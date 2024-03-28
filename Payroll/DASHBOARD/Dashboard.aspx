<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/DASHBOARD/Dashboard_Masterpage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Payroll.DASHBOARD.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="../CSS/DASBOARD_CSS/dashboard.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" 
    integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <main class="content px-3 py-4">
     <div class="container-fluid">
         <div class="mb-3">
             <h1 class=" fw-bold fs-3 mb-3">Admin  Dashboard</h1>
             <div class="row row-cols-lg-3 g-2">
                 <div class="box col-12 col-md-6 ">
                     <div class="card border-0">
                         <div class="card-body py-4">
                                 
                             <asp:Label ID="lblEmployeeCount" runat="server"  CssClass="h1 fw-bold"></asp:Label>
                             <h5 class=" fw-bold mt-2">Active Employees  </h5>
                           
                         </div>
                     </div>
                 </div>
                 <div class="box col-12 col-md-6 ">
                     <div class="card  border-0">
                         <div class="card-body py-4">                       
                             <h1 class="h1 mb-2 fw-bold">
                                 $72,540
                             </h1>
                             <h5 class=" fw-bold">Currently Log In
                             </h5>
                         </div>
                     </div>
                 </div>
                 <div class="box col-12 col-md-12 ">
                     <div class="card border-0">
                         <div class="card-body py-4">
                             <h5 class="mb-2 fw-bold">Memebers Progress
                             </h5>
                             <p class="mb-2 fw-bold">
                                 $72,540
                             </p>
                             <div class="mb-0">
                                 <span class="badge text-success me-2">+9.0%
                                 </span>
                                 <span class="fw-bold">Since Last Month
                                 </span>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
             <h3 class="fw-bold fs-4 my-3">Employee Attendance (LOG IN)
             </h3>
             <div class="row">
                 <div class="col-12">
                     <asp:Table runat="server" CssClass="table table-striped" ID="employeeTable">
                    <asp:TableHeaderRow CssClass="table-dark">
                        <asp:TableHeaderCell>#</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Last Name</asp:TableHeaderCell>
                        <asp:TableHeaderCell>First Name</asp:TableHeaderCell>
                        <asp:TableHeaderCell>Time In</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
                 </div>
             </div>
         </div>
     </div>
       
 </main>

    <script>

</script>

</asp:Content>
