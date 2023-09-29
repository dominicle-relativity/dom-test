<#
.SYNOPSIS
	Promotes build artifacts to storage accounts in specified Azure directories
.DESCRIPTION
	This will transfer a build artifact (given a blob name and source storage account) to storage accounts in specified Azure directories using the r1-storage Azure Function. Typically used to promote build artifacts from Azure dev to commercial prod, gov reg, and gov prod.
.PARAMETER SourceStorageAccount
	
.PARAMETER DestinationStorageAccounts
	The tenant id. (example: "009")
.PARAMETER BlobName
	The customer's custom dns name. (example: "BLG")
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$true)]
	[PSCustomObject] $SourceStorageAccount,
	[Parameter(Mandatory=$true)]
	[PSCustomObject[]] $DestinationStorageAccounts,
	[Parameter(Mandatory=$true)]
	[string] $BlobName
)
Write-Host "Obtaining Function Key for Storage App Service..."
$FunctionUri = "https://r1-storage.azurewebsites.net"
$FunctionKey = az keyvault secret show --vault-name r1-kv-storage -n function-app-key --query value -o tsv
$headers = @{
	'x-functions-key' = $FunctionKey
}

$body = @{
	SourceBlob = @{
		ContainerName        = $SourceStorageAccount.StorageBlobContainerName
		Path                 = $BlobName
		StorageAccountConfig = @{
			TenantId           = $SourceStorageAccount.TenantId
			SubscriptionId     = $SourceStorageAccount.SubscriptionId
			ResourceGroupName  = $SourceStorageAccount.ResourceGroupName
			StorageAccountName = $SourceStorageAccount.StorageAccountName
		}
	}
	DestinationBlobs = @()
}
foreach($destinationStorageAccount in $DestinationStorageAccounts)
{
	$body.DestinationBlobs += @{
		ContainerName        = $destinationStorageAccount.StorageBlobContainerName
		Path                 = $BlobName
		StorageAccountConfig = @{
			TenantId           = $destinationStorageAccount.TenantId
			SubscriptionId     = $destinationStorageAccount.SubscriptionId
			ResourceGroupName  = $destinationStorageAccount.ResourceGroupName
			StorageAccountName = $destinationStorageAccount.StorageAccountName
		}
	}
}
Write-Host "Initiating Transfer..."
$transfer = (Invoke-WebRequest -Method 'POST' -Uri "$FunctionUri/api/StartTransfer" -Headers $headers -Body ($body | ConvertTo-Json -Depth 10) -ContentType 'Application/Json' -UseBasicParsing) | ConvertFrom-Json
Write-Host "Transfer Started with identifier '$($transfer.id)'"

Write-Host "Sleeping for 5 seconds as the transfer is initiated and then polled on."
Start-Sleep -Seconds 5

$transferring = $true
$retryCount = 5
do {
	Start-Sleep -Seconds 2

	try {
		$status = (Invoke-WebRequest -Method 'POST' -Uri "$FunctionUri/api/GetTransferStatus" -Headers $headers -Body ($transfer.id | ConvertTo-Json) -ContentType 'Application/Json' -UseBasicParsing) | ConvertFrom-Json -AsHashtable

		$totalBytes = 0
		$copiedBytes = 0
		$status.Transfers.GetEnumerator() | ForEach-Object {
			Write-Host "Status:$($_.Value.StatusString) Copied:$($_.Value.BytesCopied) of $($_.Value.TotalBytes)"
			$totalBytes += $_.Value.TotalBytes
			$copiedBytes += $_.Value.BytesCopied
		}

		if ($totalBytes -and ($totalBytes -gt 0)) {
			$progress = [math]::round(($copiedBytes * 100 / $totalBytes), 2)
		}
		else {
			$progress = 0.00
		}

		Write-Host "Progress:$progress Total Copied:$($copiedBytes) of $($totalBytes) Transferring:$($status.Transferring)"

		$transferring = $status.Transferring
	}
	catch {
		Write-Warning "Error encountered, could be awaiting transfers to start. RetryCount:$retryCount Exception: $_"
		Start-Sleep -Seconds 2
		$retryCount = $retryCount - 1
	}
}
while ($transferring -and ($retryCount -gt 0))
Write-Host "Transfer has finished."