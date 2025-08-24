using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Results;
using System.Web.Http.Routing;

namespace WebApplication6.Controllers
{
    public class DataController : ApiController
    {

        [HttpGet]
        [HttpPost]
        [Route("api/data/receivedata")] // Specific route for this action
        public IHttpActionResult ReceiveData([FromBody] MyDataModel model)
        {
            if (model == null) return BadRequest("No data received");
            return Ok("Data received successfully!");
        }
        public HttpResponseMessage Options()
        {
            var response = new HttpResponseMessage(HttpStatusCode.OK);
            response.Headers.Add("Access-Control-Allow-Origin", "*");
            response.Headers.Add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
            response.Headers.Add("Access-Control-Allow-Headers", "Content-Type, Authorization");
            return response;
        }


    }
    public class MyDataModel
    {
        public string Parameter { get; set; }
    }
    
}
