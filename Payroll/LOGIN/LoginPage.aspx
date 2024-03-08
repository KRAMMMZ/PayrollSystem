﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Payroll.LOGIN.LoginPage" %>

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
    <title>Payroll System</title>
</head>
<body>
    <form id="form1" runat="server">

        <section class="vh-100 ">
            <div class="container-fluid  h-100">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 d-flex align-items-center justify-content-center h-100 ">
                    <div class="col-md-8 col-lg-7 col-xl-8 sad">
                     
                    </div>
                    <div class=" col-sm-10 col-md-7 col-lg-5 col-xl-4 p-4 sew  ">
                        <!-- Email input -->
                        <div class="p-2 d-flex justify-content-center align-items-center asd">
                            <img src="../RESOURCES/logo.png" class="img-fluid h-50 w-75" alt="Logo" />
                        </div>
                        <div class="form-outline mb-4">
                            <input type="email" id="form1Example13" class="form-control form-control-lg" />
                            <label class="form-label" for="form1Example13">Email address</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="form1Example23" class="form-control form-control-lg" />
                            <label class="form-label" for="form1Example23">Password</label>
                        </div>

                        <div class="d-flex justify-content-end align-items-center mb-4">
                          
                            <a href="../DASHBOARD/Dashboard.aspx">Forgot password?</a>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>

                    

                    </div>
                </div>
            </div>
        </section>



        <script src="../BOOTSTRAP5/js/bootstrap.bundle.min.js"> </script>
    </form>
</body>
</html>