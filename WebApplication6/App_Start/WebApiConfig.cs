using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace WebApplication6
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
            name: "ReceiveDataApi",
            routeTemplate: "api/data/receivedata",
            defaults: new { controller = "Data", action = "ReceiveData" }
        );

            // Default route
            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
        }
    }
}
