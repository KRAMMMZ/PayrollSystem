using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace Payroll.DASHBOARD
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private const string apiKey = "8BYkEfBA6O6donzWlSihBXox7C0sKR6b"; //API key
        private const string link = "https://csms-rest-api.onrender.com"; //API link

        protected async void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                await PopulateEmployeeGridAsync();
            }
        }

        private async Task PopulateEmployeeGridAsync()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri(link);
                client.DefaultRequestHeaders.Add("x-api-key", apiKey);

                var response = await client.GetAsync("employee/all");
                response.EnsureSuccessStatusCode();

                var responseContent = await response.Content.ReadAsStringAsync();
                var employeesResponse = JsonConvert.DeserializeObject<EmployeesResponse>(responseContent);
                employeeGrid.DataSource = employeesResponse.Employees;
                employeeGrid.DataBind();
            }
        }

        public class Employee
        {
            public string first_name { get; set; }
            public string middle_name { get; set; }
            public string last_name { get; set; }
            public string email { get; set; }
            public string position { get; set; }
        }
        public class EmployeesResponse
        {
            public List<Employee> Employees { get; set; }
        }

    }
}