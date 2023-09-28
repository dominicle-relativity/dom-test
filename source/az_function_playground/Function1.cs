using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace az_function_playground
{
    public static class Function1
    {
        [FunctionName("SCIM")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", "post", "put", "patch", "delete", Route = "scim/Users")] HttpRequest req, ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");
            if (req.Method.ToLower() == "get")
            {
                Thread.Sleep(10000);
            }
            var bodyStream = new StreamReader(req.Body);
            var body = await bodyStream.ReadToEndAsync();
            log.LogInformation(body);

            return new OkObjectResult("okay");
        }
    }
}
