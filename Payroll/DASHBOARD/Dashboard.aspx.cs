﻿using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Payroll.DASHBOARD.WebForm2;

namespace Payroll.DASHBOARD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private const string apiKey = "8BYkEfBA6O6donzWlSihBXox7C0sKR6b"; //API key
        private const string link = "https://csms-rest-api.onrender.com"; //API link

        protected async void Page_Load(object sender, EventArgs e)
        {
            string name = Session["name"] as string;

            if (!IsPostBack) // Load data only on initial load
            {
                await PopulateEmployeeGridAsync();
            }
            //ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Success!', 'Welcome {name??"user"}', 'success');", true);
            //if (string.IsNullOrEmpty(name))
            //{
            //        Response.Redirect("~/LOGIN/LoginPage.aspx");
            //}
            //if (!IsPostBack)
            //{
            //    PopulateEmployeeTable();
            //}
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

                // Count the number of employees
                int employeeCount = employeesResponse.Employees.Count;

                // Now you have the count of employees, you can use it as needed
                // For example, you can display it in a label or perform further actions
                lblEmployeeCount.Text = $"{employeeCount}";

              
              
            }
        }
        //private void PopulateEmployeeTable()
        //{
        //    DateTime date = DateTime.Today;
        //    int counter = 1; // Counter variable to track the row number
        //    bool hasData = false; // Flag to track if any data is retrieved

        //    // Connect to the database and retrieve employee data for today
        //    string connectionString = "Data Source=MJ\\SQLEXPRESS;Initial Catalog=Payroll(SIAII);Integrated Security=True;Encrypt=False";
        //    string query = "SELECT Email FROM [attendanceTBL] WHERE Date = @Date";
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        SqlCommand command = new SqlCommand(query, connection);
        //        connection.Open();
        //        command.Parameters.AddWithValue("@Date", date);
        //        SqlDataReader reader = command.ExecuteReader();

        //        while (reader.Read())
        //        {
        //            hasData = true; // Data found in the database
        //            TableRow newRow = new TableRow();
        //            TableCell counterCell = new TableCell();
        //            counterCell.Text = counter.ToString();
        //            newRow.Cells.Add(counterCell);

        //            for (int i = 0; i < reader.FieldCount; i++)
        //            {
        //                TableCell newCell = new TableCell();
        //                newCell.Text = reader[i].ToString();
        //                newRow.Cells.Add(newCell);
        //            }
        //            counter++;
        //        }
        //        reader.Close();
        //    }

        //    if (hasData)
        //    {
        //        var url = "https://csms-rest-api.onrender.com/employee/all";
        //        var key = "8BYkEfBA6O6donzWlSihBXox7C0sKR6b";
        //        var client = new RestClient(url);
        //        var request = new RestRequest();
        //        request.AddHeader("x-api-key", key);
        //        var response = client.Get(request);
        //        var apiContent = response.Content;
        //        var apiData = JsonConvert.DeserializeObject<dynamic>(apiContent);
        //        var apiEmployees = apiData.employees;
        //        foreach (var employee in apiEmployees)
        //        {
        //            TableRow newRow = new TableRow();

        //            TableCell counterCell = new TableCell();
        //            counterCell.Text = counter.ToString();
        //            newRow.Cells.Add(counterCell);

        //            TableCell firstNameCell = new TableCell();
        //            firstNameCell.Text = employee.first_name.ToString();
        //            newRow.Cells.Add(firstNameCell);

        //            TableCell lastNameCell = new TableCell();
        //            lastNameCell.Text = employee.last_name.ToString();
        //            newRow.Cells.Add(lastNameCell);

        //            TableCell emailCell = new TableCell();
        //            emailCell.Text = employee.email.ToString();
        //            newRow.Cells.Add(emailCell);

        //            employeeTable.Rows.Add(newRow);

        //            counter++;
        //        }
        //    }
        //    if (!hasData)
        //    {
        //        TableRow noDataRow = new TableRow();
        //        TableCell noDataCell = new TableCell();
        //        noDataCell.Text = "No data available for today.";
        //        noDataCell.ColumnSpan = 4;
        //        noDataRow.Cells.Add(noDataCell);
        //        employeeTable.Rows.Add(noDataRow);
        //    }
        //}


    }
}