using System;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.UI;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Payroll.LOGIN
{
    public partial class LoginPage : System.Web.UI.Page
    {
        private const string apiKey = "8BYkEfBA6O6donzWlSihBXox7C0sKR6b"; //API key
        private const string link = "https://csms-rest-api.onrender.com/payroll/admin/all"; //API link

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected async void Button1_Click(object sender, EventArgs e)
        {
            string username = txtemail.Text.Trim();
            string password = txtpassword.Text.Trim();
           
            bool isAuthenticated = await AuthenticateUser(username, password);

            if (isAuthenticated)
            {
                Label3.Text= "Login successful!";
                Response.Redirect("~/DASHBOARD/Dashboard.aspx");
                // Proceed to main application or any other action
            }
            else
            {
                Label3.Text = "Invalid username or password. Please try again.";
            }
        }
        private async Task<bool> AuthenticateUser(string username, string password)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(link);

                // Add API key to request headers
                client.DefaultRequestHeaders.Add("x-api-key", apiKey);

                var loginData = new { Username = username, Password = password };
                var response = await client.PostAsJsonAsync("login", loginData);

                if (response.IsSuccessStatusCode)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}