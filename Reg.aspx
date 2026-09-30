<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Reg.aspx.cs" Inherits="Vidyakendraa.Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>School Book Registration | Vidyakendra</title>

    <style>
        .reg-card {
            border-radius: 12px;
        }

        .reg-title {
            background: #008dd2;
            color: #fff;
            padding: 15px;
            border-radius: 12px 12px 0 0;
        }

        .form-control, .form-select {
            border-radius: 6px;
        }

        .btn-success {
            background-color: #fd7e14 !important; /* your brand color */
            border-color: #fd7e14 !important;
            color: #fff;
        }

            .btn-success:hover {
                background-color: #006fa3 !important;
                border-color: #006fa3 !important;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow-lg reg-card">
                    <!-- HEADER -->
                    <div class="reg-title text-center">
                        <h4 class="mb-0">School Book Registration</h4>
                        <small>Buy School Books Online</small>
                    </div>

                    <!-- BODY -->
                    <div class="card-body p-4">

                        <h5 class="text-primary mb-3">Student Information</h5>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtStudentName" runat="server"
                                    CssClass="form-control" Placeholder="Student Name" />
                            </div>

                            <div class="col-md-3">
                                <asp:TextBox ID="txtClass" runat="server"
                                    CssClass="form-control" Placeholder="Class" />
                            </div>

                            <div class="col-md-3">
                                <asp:DropDownList ID="ddlBoard" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Board" Value="" />
                                    <asp:ListItem>CBSE</asp:ListItem>
                                    <asp:ListItem>ICSE</asp:ListItem>
                                    <asp:ListItem>State</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="mb-3">
                            <asp:TextBox ID="txtSchoolName" runat="server"
                                CssClass="form-control" Placeholder="School Name" />
                        </div>

                        <h5 class="text-primary mb-3">Contact Details</h5>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <asp:TextBox ID="txtParentName" runat="server"
                                    CssClass="form-control" Placeholder="Parent Name" />
                            </div>

                            <div class="col-md-6">
                                <asp:TextBox ID="txtMobile" runat="server"
                                    CssClass="form-control" Placeholder="Mobile Number" />
                            </div>
                        </div>

                        <div class="mb-3">
                            <asp:TextBox ID="txtAddress" runat="server"
                                CssClass="form-control" TextMode="MultiLine" Rows="3"
                                Placeholder="Delivery Address" />
                        </div>

                        <div class="text-center">
                            <asp:Button ID="btnSubmit" runat="server"
                                Text="Register Now"
                                CssClass="btn btn-success px-5"
                                OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
