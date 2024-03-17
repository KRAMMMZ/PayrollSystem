<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="Payroll.ATTENDANCE.Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css" />
    <link rel="stylesheet" href="../BOOTSTRAP5/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../CSS/attendance.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.6/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.6/dist/sweetalert2.min.css" rel="stylesheet" />
    <title>Employee Attendance</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container w-50">
            <div class="row row-cols-1 row-cols-lg-1 g-2 ">
                <h1 class="h1 fw-bold text-center"> CLEANING SERVICES MANAGEMENT ATTENDANCE MONITORING</h1>

                <div class="col col-lg-12 p-0">
                    <asp:TextBox ID="txtCurrentDateTime" runat="server" CssClass="h-100 w-100 fw-bold text-center  txt" Enabled="False" BorderStyle="None"></asp:TextBox>

                </div>

                <div class="col col-lg-6 p-0">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary w-100 h-100" Text="TIME IN" />
                </div>
                <div class="col col-lg-6  p-0 ">
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-secondary w-100 h-100" Text="TIME OUT" />
                </div>
                <div class="col p-5 h-100 w-100  d-flex justify-content-center form-log ">


                    <div class="form-outline  w-75 mb-2">
                        <asp:Label ID="Label2" runat="server" CssClass="form-label fw-bold" Text="Email Address :"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <asp:TextBox ID="txtemail" CssClass="form-control form-control-lg" runat="server"></asp:TextBox>

                    </div>
                   


                </div>

            </div>

        </div>

        <script type="text/javascript">
           
            function updateDateTime() {
                var now = new Date();
                var options = { year: 'numeric', month: 'long', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: true };
                var formattedDateTime = now.toLocaleString('en-US', options);
                document.getElementById('<%= txtCurrentDateTime.ClientID %>').value = formattedDateTime;
                setTimeout(updateDateTime, 1000); 
            }

        
            window.onload = function () {
                updateDateTime();
            };
        </script>
    </form>
</body>
</html>
