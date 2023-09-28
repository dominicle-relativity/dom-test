using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace az_function_playground.Models
{
	public class ScimUser
	{
		[JsonPropertyName("schemas")]
		public string[] Schemas { get; set; }
	}
}
