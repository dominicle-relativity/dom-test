using System;
using System.Collections.Generic;
using System.Reflection.Metadata;
using System.Threading;
using System.Threading.Tasks;
using az_function_playground.Models;
using Microsoft.Azure.Documents;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;

namespace az_function_playground
{
	public class CosmosDbTrigger
	{
		[FunctionName("CosmosDbTrigger")]
		public async Task Run([CosmosDBTrigger(
			databaseName: "dom-db",
			containerName: "dom-container",
			Connection = "COSMOS_CONNECTION_STRING_READ_WRITE",
			LeaseContainerName = "leases",
			CreateLeaseContainerIfNotExists = true)]IReadOnlyList<DbDocument> input,
			ILogger log)
		{
			log.LogInformation("Cosmosdb executing");
			foreach (var doc in input)
			{
				log.LogInformation("Processing {id}", doc.Id);
				if (doc.Id == "0")
				{
					log.LogInformation("Sleep");
					Thread.Sleep(60000);
				}
				doc.Value = "AAA";
				log.LogInformation("Processed {id}", doc.Id);
			}
			log.LogInformation("Cosmosdb executed");
		}
	}
}
