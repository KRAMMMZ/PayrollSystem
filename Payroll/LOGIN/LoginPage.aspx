<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Payroll.LOGIN.LoginPage" Async="True" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css" />
    <link rel="stylesheet" href="../BOOTSTRAP5/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../CSS/LOGIN_CSS/login.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.6/dist/sweetalert2.all.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.10.6/dist/sweetalert2.min.css"rel="stylesheet"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <title>Payroll System</title>
</head>
<body>
    <form id="form1" runat="server">

        <section class="vh-100 ">
            <div class="container-fluid  h-100">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 d-flex align-items-center justify-content-center p-5 h-100  ">
                    <div class="col-md-8 col-lg-7 col-xl-8 h-75 image">
                      <img src="../RESOURCES/payroll-removebg-preview.png"
                             class="img-fluid img w-75 h-100" alt="Sample image"/>
                    </div>
                    <div class=" col-sm-10 col-md-8 col-lg-5 col-xl-4 p-5 h-100 form-log ">
                   
                        <div class=" mb-4 d-flex justify-content-center qwe ">
                            <img src="../RESOURCES/1a-removebg-preview.png" class="img-fluid logo" alt="Logo" />
                        </div>
                        <div class="form-outline mb-2">    
                            <asp:Label ID="Label2" runat="server" CssClass="form-label fw-bold" Text="Email Address :"> </asp:Label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Email is Required" ControlToValidate="txtemail" CssClass="required text-danger"></asp:RequiredFieldValidator>
                   
                            <asp:TextBox ID="txtemail" CssClass="form-control form-control-lg"  runat="server"></asp:TextBox>                 
                            
                        </div>
                        <div class="form-outline mb-2">
                             <asp:Label ID="Label1" runat="server" CssClass="form-label fw-bold" Text="Password :"></asp:Label>  <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ErrorMessage="* Password is Required" ControlToValidate="txtpassword" CssClass="required text-danger"></asp:RequiredFieldValidator>
                           
                            <asp:TextBox ID="txtpassword" CssClass="form-control form-control-lg"  runat="server" TextMode="Password"></asp:TextBox>                 
                                     
                        </div>

                        <div class="d-flex  justify-content-between align-items-center mb-4">
                           <span>
                            <input type="checkbox" onclick="myFunction()" />
                            Show Password</span>
                            <a href="../DASHBOARD/Dashboard.aspx">Forgot password?</a>
                        </div>

                        <!-- Submit button -->
   
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-lg btn-block" Text="Log in" OnClick="Button1_Click" />
                        


                    </div>
                </div>
            </div>
        </section>



        <script src="../BOOTSTRAP5/js/bootstrap.bundle.min.js"> </script>
        <script>
            function myFunction() {
                var x = document.getElementById("txtpassword");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }

        </script>
        <script>
            $(document).ready(function () {
                // Function to bold the error message in SweetAlert dialog
                function boldErrorMessage() {
                    $('.swal-modal').find('.swal-text').css('font-weight', 'bold');
                }

                // Call the function after the dialog is shown
                $(document).on('shown.bs.modal', '.swal-modal', function () {
                    boldErrorMessage();
                });
            });
        </script>
       
    </form>
</body>
</html>
