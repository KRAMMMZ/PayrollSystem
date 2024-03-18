using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Payroll.ATTENDANCE
{
    public partial class Attendance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtCurrentDateTime.Text = DateTime.Now.ToString("MMMM dd, yyyy h:mm:ss tt");
        }
    }
}