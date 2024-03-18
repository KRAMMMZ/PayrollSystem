using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.UI;
using System.Xml.Linq;

namespace Payroll.LOGIN
{
    public partial class LoginPage : System.Web.UI.Page
    {
        private const string apiKey = "8BYkEfBA6O6donzWlSihBXox7C0sKR6b"; //API key
        private const string link = "https://csms-rest-api.onrender.com"; //API link

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            string Username = txtemail.Text.Trim();
            string Password = txtpassword.Text.Trim();

            try
            {
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri(link);
                    client.DefaultRequestHeaders.Add("x-api-key", apiKey);

                    var collection = new List<KeyValuePair<string, string>>();
                    collection.Add(new KeyValuePair<string, string>("email", Username));
                    collection.Add(new KeyValuePair<string, string>("password", Password));
                    var content = new FormUrlEncodedContent(collection);

                    var response = await client.PostAsync("payroll/admin/login", content);

                    if (response.IsSuccessStatusCode)
                    {
                        string responseContent = await response.Content.ReadAsStringAsync();
                        dynamic responseData = Newtonsoft.Json.JsonConvert.DeserializeObject(responseContent);
                        string userName = responseData.name;
                        Session["name"] = userName;
                        ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Success!', 'Welcome', 'success');", true);
                        Response.Redirect("~/DASHBOARD/Dashboard.aspx");
                    }
                    else if (response.StatusCode == HttpStatusCode.InternalServerError)
                    {
                        Label3.Text = response.ReasonPhrase;
                        ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Error!', 'Something Went Wrong!! Try Again Later', 'error');", true);
                    }
                    else
                    {
                        string errorContent = await response.Content.ReadAsStringAsync();
                        dynamic errorJson = Newtonsoft.Json.JsonConvert.DeserializeObject(errorContent);
                        string errorMessage = errorJson.error.message;
                        Label3.Text = errorMessage;
                    }
                }
            }
            catch (Exception ex)
            {
                Label3.Text = $"An error occurred: {ex.Message}";
            }
        }



    }
}
