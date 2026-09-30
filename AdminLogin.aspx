<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Vidyakendraa.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-login-bg {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
        }

        .admin-card {
            width: 100%;
            max-width: 400px;
            padding: 35px;
            border-radius: 12px;
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .admin-title {
            font-weight: 700;
            color: #2c5364;
        }

        .btn-admin {
            background: #2c5364;
            color: white;
            border-radius: 30px;
        }

        .btn-admin:hover {
            background: #1e3c4f;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="admin-login-bg">
        <div class="admin-card">

            <div class="text-center mb-4">
                <h3 class="admin-title">Admin Panel Login</h3>
                <p class="text-muted">Authorized access only</p>
            </div>

            <!-- USERNAME -->
            <div class="mb-3">
                <label>Admin Username</label>
                <asp:TextBox ID="txtAdminUser" runat="server" CssClass="form-control" />
            </div>

            <!-- PASSWORD -->
            <div class="mb-3">
                <label>Password</label>
                <asp:TextBox ID="txtAdminPass" runat="server" TextMode="Password" CssClass="form-control" />
            </div>

            <!-- BUTTON -->
            <div class="d-grid mt-4">
                <asp:Button ID="btnAdminLogin" runat="server"
                    Text="Login"
                    CssClass="btn btn-admin"
                    OnClick="btnAdminLogin_Click" />
            </div>

            <asp:Label ID="lblMsg" runat="server" CssClass="text-danger d-block text-center mt-3"></asp:Label>

        </div>
    </div>

</asp:Content>