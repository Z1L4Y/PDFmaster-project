using PuppeteerSharp;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Web.UI.WebControls;
using PuppeteerSharp.Media;
using System.Net.Http;
using System.Net;
using Newtonsoft.Json.Linq;

namespace WebApplication6.Controllers
{
    public class PdfController : Controller
    {
        [HttpPost]
        [ValidateInput(false)]
        public async Task<ActionResult> GeneratePdf(string Code, string Style, string GeneratedFileName, string FileSize, string JsonData)
        {
            // replace Json string to a JObject
            var parameters = JObject.Parse(JsonData);

            foreach (var item in parameters)
            {
                Code = Code.Replace($"{{{{{item.Key}}}}}", item.Value.ToString());
                Style = Style.Replace($"{{{{{item.Key}}}}}", item.Value.ToString());
            }
            try
            {
                var puppeteerOptions = new LaunchOptions
                {
                    Headless = true,
                    ExecutablePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe"
                };


                using (var browser = await Puppeteer.LaunchAsync(puppeteerOptions))
                {
                    using (var page = await browser.NewPageAsync())
                    {

                        
                        string htmlContent = Code + " <style>" + Style + " </style>";

                        
                        await page.SetContentAsync(htmlContent);

                        if ( FileSize == "A4")
                        {
                            FileSize = "Format = PuppeteerSharp.Media.PaperFormat.A4";
                        }


                        var pdfOptions = new PdfOptions
                        {
                            Format = GetPaperFormat(FileSize),
                            PrintBackground = true,
                        };

                        
                        var pdfData = await page.PdfDataAsync(pdfOptions);

                        
                        await browser.CloseAsync();
                        
                        return File(pdfData, "application/pdf", GeneratedFileName + ".pdf");
                    }
                }
            }
            catch (Exception ex)
            {
                
                return Content($"Error: {ex.Message}");
            }
        }

        public async Task<ActionResult> GeneratePdfInternal(string Code, string Style, string GeneratedFileName, string FileSize, string JsonData)
        {
            try
            {
                var parameters = JObject.Parse(JsonData);

                // replace placeholders in Code
                foreach (var item in parameters)
                {
                    Code = Code.Replace($"{{{{{item.Key}}}}}", item.Value.ToString());
                    Style = Style.Replace($"{{{{{item.Key}}}}}", item.Value.ToString());
                }
                var puppeteerOptions = new LaunchOptions
                {
                    Headless = true,
                    ExecutablePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe"
                };


                using (var browser = await Puppeteer.LaunchAsync(puppeteerOptions))
                {
                    using (var page = await browser.NewPageAsync())
                    {


                        string htmlContent = Code + " <style>" + Style + " </style>";


                        await page.SetContentAsync(htmlContent);

                        if (FileSize == "A4")
                        {
                            FileSize = "Format = PuppeteerSharp.Media.PaperFormat.A4";
                        }


                        var pdfOptions = new PdfOptions
                        {
                            Format = GetPaperFormat(FileSize),
                            PrintBackground = true,
                        };


                        var pdfData = await page.PdfDataAsync(pdfOptions);


                        await browser.CloseAsync();
                        Response.ContentType = "application/pdf";
                        Response.Headers.Add("X-Filename", GeneratedFileName + ".pdf");
                        Response.Headers.Add("Access-Control-Expose-Headers", "X-Filename");
                        return File(pdfData, "application/pdf", GeneratedFileName + ".pdf");
                    }
                }
            }
            catch (Exception ex)
            {

                return Content($"Error: {ex.Message}");
            }
        }



        private PaperFormat GetPaperFormat(string fileSize)
        {
            if (fileSize == "A3")
            {
                return PuppeteerSharp.Media.PaperFormat.A3;
            }
            else if (fileSize == "A4")
            {
                return PuppeteerSharp.Media.PaperFormat.A4;
            }
            else if (fileSize == "Letter")
            {
                return PuppeteerSharp.Media.PaperFormat.Letter;
            }
            else if (fileSize == "Legal")
            {
                return PuppeteerSharp.Media.PaperFormat.Legal;
            }
            else if (fileSize == "Tabloid")
            {
                return PuppeteerSharp.Media.PaperFormat.Tabloid;
            }
            else if (fileSize == "Ledger")
            {
                return PuppeteerSharp.Media.PaperFormat.Ledger;
            }
            else
            {
                // Default
                return PuppeteerSharp.Media.PaperFormat.A4;
            }
        }




        [HttpPost]
        [ValidateInput(false)]
        public async Task<ActionResult> GeneratePdfForPreview(string Code, string Style, string FileSize, string JsonData)
        {
            try
            {
                var parameters = JObject.Parse(JsonData);

                // replace placeholders in Code
                foreach (var item in parameters)
                {
                    Code = Code.Replace($"{{{{{item.Key}}}}}", item.Value.ToString());
                    Style = Style.Replace($"{{{{{item.Key}}}}}", item.Value.ToString());
                }

                var puppeteerOptions = new LaunchOptions
                {
                    Headless = true,
                    ExecutablePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe"
                };

                using (var browser = await Puppeteer.LaunchAsync(puppeteerOptions))
                {
                    using (var page = await browser.NewPageAsync())
                    {
                        
                        string htmlContent = Code + " <style>" + Style + " </style>";

                        
                        await page.SetContentAsync(htmlContent);

                        
                        var pdfOptions = new PdfOptions
                        {
                            Format = GetPaperFormat(FileSize),
                            PrintBackground = true,
                        };

                        
                        var pdfData = await page.PdfDataAsync(pdfOptions);

                        // Convert the PDF to url
                        var pdfBase64 = Convert.ToBase64String(pdfData);
                        var dataUrl = $"data:application/pdf;base64,{pdfBase64}";

                        ViewBag.PdfDataUrl = dataUrl;

                        return Json(new { pdfDataUrl = dataUrl }); 
                    }
                }
            }
            catch (Exception ex)
            {
                
                return Content($"Error: {ex.Message}");
            }

        }


        private static readonly HttpClient client = new HttpClient();

        private async Task<string> GetFirebaseData(string path)
        {
            // sending request to the database
            HttpResponseMessage response = await client.GetAsync(path);
            if (response.IsSuccessStatusCode)
            {
                string json = await response.Content.ReadAsStringAsync();
                //Converting the json data to string
                return JsonConvert.DeserializeObject<string>(json);
            }
            return null;
        }

        [HttpPost]
        public async Task<ActionResult> ReceiveData()
        {
            var json = new StreamReader(Request.InputStream).ReadToEnd();
            //Converts the Json into key, value format - Key: "ID" — Value: "User ID"
            var dataModel = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);

            if (dataModel == null || !dataModel.ContainsKey("ID") || !dataModel.ContainsKey("template"))
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest, "Invalid data received");
            }

            string userId = dataModel["ID"];
            string templateName = dataModel["template"];
            string additionalParams = dataModel.ContainsKey("additionalParams") ? dataModel["additionalParams"] : "{}";
            string baseUrl = "https://pdfmaster-c097b-default-rtdb.europe-west1.firebasedatabase.app/";

            //A way I found to get all information from the databse at the same time - Task<T> allows us to make actions on the background while the code continues
            var tasks = new List<Task<string>>();
            tasks.Add(GetFirebaseData($"{baseUrl}users/{userId}/Templates/{templateName}/code.json"));
            tasks.Add(GetFirebaseData($"{baseUrl}users/{userId}/Templates/{templateName}/style.json"));
            tasks.Add(GetFirebaseData($"{baseUrl}users/{userId}/Templates/{templateName}/filedimension.json"));
            tasks.Add(GetFirebaseData($"{baseUrl}users/{userId}/Templates/{templateName}/filename.json"));


            var results = await Task.WhenAll(tasks);

            return await GeneratePdfInternal(results[0], results[1], results[3], results[2], additionalParams);
        }
    }
}