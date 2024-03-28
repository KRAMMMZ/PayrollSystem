<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/DASHBOARD/Dashboard_Masterpage.Master" AutoEventWireup="true" CodeBehind="payroll.aspx.cs" Inherits="Payroll.DASHBOARD.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../CSS/DASBOARD_CSS/payroll.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main class="content px-3 py-4">
        <div class="container-fluid">
            <div class="mb-2">
                <h1 class="h1 fw-bold fs-2 mb-5">Payroll Information</h1>

            </div>

            <div class="row w-100 mt-1 sas">
                <div class="col p-3">
                    <h1 class="h1 fw-bold fs-3 mb-0">Employee List</h1>
                </div>
                <div class="input-group justify-content-end p-3 col">

                    <div class="form-outline">
                        <asp:TextBox runat="server" ID="TextBox1" placeholder="Search" CssClass="form-control" />
                    </div>
                    <asp:LinkButton runat="server" ID="LinkButton1" CssClass="btn btn-primary">
                         <span aria-hidden="true" class="fas fa-search text-center "></span>
                    </asp:LinkButton>
                </div>


            </div>
            <div class="row">
                <div class="col-12">
                    <asp:GridView ID="employeeGrid" runat="server" CssClass="table table-striped  table-responsive-md" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="first_name" HeaderText="First Name" HeaderStyle-CssClass=" text-center" ItemStyle-CssClass="text-center border"  HeaderStyle-BackColor="#1E1E1E"  HeaderStyle-ForeColor="White"  />
                            <asp:BoundField DataField="middle_name" HeaderText="Middle Name" HeaderStyle-CssClass=" text-center" ItemStyle-CssClass="text-center border" HeaderStyle-BackColor="#1E1E1E"  HeaderStyle-ForeColor="White"   />
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center border" HeaderStyle-BackColor="#1E1E1E"  HeaderStyle-ForeColor="White"   />
                            <asp:BoundField DataField="email" HeaderText="Email" HeaderStyle-CssClass=" text-center" ItemStyle-CssClass="text-center border" HeaderStyle-BackColor="#1E1E1E"  HeaderStyle-ForeColor="White" />
                            <asp:BoundField DataField="position" HeaderText="Position" HeaderStyle-CssClass=" text-center" ItemStyle-CssClass="text-center border" HeaderStyle-BackColor="#1E1E1E"  HeaderStyle-ForeColor="White"   />
                            <asp:TemplateField HeaderText="View" HeaderStyle-CssClass=" text-center" ItemStyle-CssClass="text-center border" HeaderStyle-BackColor="#1E1E1E"  HeaderStyle-ForeColor="White"  >
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="View" CommandName="Edit" CssClass="btn btn-primary justify-content-center"  />
                               
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </div>
            </div>

        </div>
    </main>



</asp:Content>
