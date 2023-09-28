using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace az_function_playground.Models
{
	public class DbDocument
	{
		[JsonProperty("id")]
		public string Id { get; set; }

		[JsonProperty("value")]
		public string Value { get; set; }

		[JsonProperty("_etag")]
		public string Etag { get; set; }

	}
}
