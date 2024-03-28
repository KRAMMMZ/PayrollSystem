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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
        integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <title>Employee Attendance</title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="container w-75">
            <div class="row row-cols-1 row-cols-lg-1 g-2">
                <div class="col col-lg-12 p-0 head">
                    <h1 class="h1 text-center">CLEANING SERVICE MANAGEMENT SYSTEM</h1>
                </div>
                <div class="col col-lg-12 p-0">
                    <asp:TextBox ID="txtCurrentDateTime" runat="server" CssClass="h-100 w-100 fw-bold text-center  txt" Enabled="False" BorderStyle="None"></asp:TextBox>

                </div>

                <div class="col col-lg-12 d-flex align-items-center justify-content-center p-0  buttons">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary w-100 h-100 col-lg-4" Text="TIME IN" OnClick="Button1_Click" />

                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger w-100 h-100 col-lg-4" Text="TIME OUT" OnClick="Button2_Click" />
                </div>
                <div class="col-1 p-5 h-100 w-100 form-log d-flex justify-content-center align-items-center">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div class="form-outline mb-2">
                                    <asp:Label ID="Label2" runat="server" CssClass="form-label fw-bold" Text="Email Address :"></asp:Label>
                                    <asp:TextBox ID="txtemail" CssClass="form-control form-control-lg" runat="server" required="true"></asp:TextBox>
                                </div>
                                <div class="form-outline mb-2">
                                    <asp:Label ID="Label1" runat="server" CssClass="form-label fw-bold" Text="Password :"></asp:Label>
                                    <asp:TextBox ID="txtpassword" CssClass="form-control form-control-lg" runat="server" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </div>
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
