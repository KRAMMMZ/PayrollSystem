using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Payroll.ATTENDANCE
{
    public partial class Attendance : System.Web.UI.Page
    {
        private const string apiKey = "8BYkEfBA6O6donzWlSihBXox7C0sKR6b";
        private const string link = "https://csms-rest-api.onrender.com";
        string connectionString = "Data Source=MJ\\SQLEXPRESS;Initial Catalog=Payroll(SIAII);Integrated Security=True;Encrypt=False";
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCurrentDateTime.Text = DateTime.Now.ToString("MMMM dd, yyyy h:mm:ss tt");
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            var url = "https://csms-rest-api.onrender.com/employee/all";
            var key = apiKey;
            var client = new RestClient(url);
            var request = new RestRequest().AddHeader("x-api-key", key);
            var response = client.Get(request);
            var employeeData = JObject.Parse(response.Content);
            var employees = employeeData["employees"];
            bool isEmailRegistered = false;
            foreach (var employee in employees)
            {
                if ((string)employee["email"] == txtemail.Text)
                {
                    isEmailRegistered = true;
                    break;
                }
            }
            if (!isEmailRegistered)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Warning!', 'Your email is not registered. Please contact the HR department.', 'warning');", true);
                return;
            }
            DateTime currentTime = DateTime.Now, date = DateTime.Today;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string selectSql = "SELECT COUNT(*) FROM [attendanceTBL] WHERE Email = @Email AND TimeIn >= @StartDate AND TimeIn < @EndDate";
                    using (SqlCommand command = new SqlCommand(selectSql, connection))
                    {
                        command.Parameters.AddWithValue("@Email", txtemail.Text);
                        command.Parameters.AddWithValue("@StartDate", date);
                        command.Parameters.AddWithValue("@EndDate", date.AddDays(1));
                        if ((int)command.ExecuteScalar() > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Warning!', 'You have already made a time-in entry for today.', 'warning');", true);
                            return;
                        }
                    }
                }
                var timeInClient = new RestClient(link);
                var timeInRequest = new RestRequest("attendance", Method.Post).AddHeader("Content-Type", "application/json").AddHeader("x-api-key", apiKey);
                var attdData = new { email = txtemail.Text, currentTime };
                string jsonBody = JsonConvert.SerializeObject(attdData);
                timeInRequest.AddParameter("application/json", jsonBody, ParameterType.RequestBody);
                RestResponse timeInResponse = timeInClient.Execute(timeInRequest);
                if (!timeInResponse.IsSuccessful)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Warning!', 'Oops! Something went wrong while submitting data. However, your data has been stored locally.😊', 'info');", true);
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string Insertsql = "INSERT INTO [attendanceTBL] (Email, TimeIn, TimeOut, Date) VALUES (@Email, @TimeIn, @TimeOut, @Today)";
                        using (SqlCommand command = new SqlCommand(Insertsql, connection))
                        {
                            command.Parameters.AddWithValue("@Email", txtemail.Text);
                            command.Parameters.AddWithValue("@TimeIn", currentTime);
                            command.Parameters.AddWithValue("@TimeOut", "0");
                            command.Parameters.AddWithValue("@Today", date);
                            int rowsAffected = command.ExecuteNonQuery();
                            if (rowsAffected <= 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Error!', 'Something Went Wrong!! Try Again Later', 'error');", true);
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Warning!', 'Something went wrong!! Try again Later.', 'warning');", true);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime currentTime = DateTime.Now, date = DateTime.Today;
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    string selectSql = "SELECT COUNT(*) FROM [attendanceTBL] WHERE Email = @Email AND TimeIn >= @StartDate AND TimeIn < @EndDate";
                    using (SqlCommand command = new SqlCommand(selectSql, connection))
                    {
                        command.Parameters.AddWithValue("@Email", txtemail.Text);
                        command.Parameters.AddWithValue("@StartDate", date);
                        command.Parameters.AddWithValue("@EndDate", date.AddDays(1));
                        int count = (int)command.ExecuteScalar();
                        if (count == 0)
                        {
                            throw new Exception("No time-in entry found for the current user and date.");
                        }
                    }
                }
                var client = new RestClient(link);
                var request = new RestRequest("attendance", Method.Post).AddHeader("Content-Type", "application/json").AddHeader("x-api-key", apiKey);
                var attdData = new { email = txtemail.Text, currentTime };
                string jsonBody = JsonConvert.SerializeObject(attdData);
                request.AddParameter("application/json", jsonBody, ParameterType.RequestBody);
                RestResponse response = client.Execute(request);
                if (!response.IsSuccessful)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Warning!', 'Oops! Something went wrong while submitting data. However, your data has been stored locally.😊', 'info');", true);
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();
                        string updateSql = "UPDATE [attendanceTBL] SET TimeOut = @TimeOut WHERE Email = @Email AND TimeOut = '0' AND Date = @Date";
                        using (SqlCommand command = new SqlCommand(updateSql, connection))
                        {
                            command.Parameters.AddWithValue("@Email", txtemail.Text);
                            command.Parameters.AddWithValue("@TimeOut", currentTime);
                            command.Parameters.AddWithValue("@Date", date);
                            if (command.ExecuteNonQuery() <= 0)
                            {
                                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Error!', 'Failed to update TimeOut.', 'error');", true);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Error!', '{ex.Message}', 'error');", true);
            }
        }

    }
}