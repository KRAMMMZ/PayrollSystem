<%@ Page Title="" Language="C#" MasterPageFile="~/DASHBOARD/Dashboard_Masterpage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Payroll.DASHBOARD.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="../CSS/DASBOARD_CSS/dashboard.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" 
    integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <main class="content px-3 py-4">
     <div class="container-fluid">
         <div class="mb-3">
             <h3 class="fw-bold fs-4 mb-3">Admin  Dashboard</h3>
             <div class="row row-cols-lg-3 g-2">
                 <div class="box col-12 col-md-6 ">
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
                                 <span class=" fw-bold">Since Last Month
                                 </span>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="box col-12 col-md-6 ">
                     <div class="card  border-0">
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
                 <div class="col-12 col-md-12 ">
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
             <h3 class="fw-bold fs-4 my-3">Avg. Agent Earnings
             </h3>
             <div class="row">
                 <div class="col-12">
                     <table class="table table-striped">
                         <thead>
                             <tr class="highlight">
                                 <th scope="col">#</th>
                                 <th scope="col">First</th>
                                 <th scope="col">Last</th>
                                 <th scope="col">Handle</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr>
                                 <th scope="row">1</th>
                                 <td>Mark</td>
                                 <td>Otto</td>
                                 <td>@mdo</td>
                             </tr>
                             <tr>
                                 <th scope="row">2</th>
                                 <td>Jacob</td>
                                 <td>Thornton</td>
                                 <td>@fat</td>
                             </tr>
                             <tr>
                                 <th scope="row">3</th>
                                 <td colspan="2">Larry the Bird</td>
                                 <td>@twitter</td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
     </div>
       
 </main>

    <script>

    </script>

</asp:Content>
