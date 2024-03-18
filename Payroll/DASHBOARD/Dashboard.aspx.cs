using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Payroll.DASHBOARD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["name"] as string;
            //ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", $"swal('Success!', 'Welcome {name??"user"}', 'success');", true);

            //if (string.IsNullOrEmpty(name))
            //{
            //        Response.Redirect("~/LOGIN/LoginPage.aspx");
            //}
        }
    }
}