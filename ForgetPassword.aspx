<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Vidyakendraa.ForgetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        body {
            background: #f4f7fb;
            font-family: Arial;
        }

        .forgot-container {
            max-width: 450px;
            margin: 60px auto;
        }

        .forgot-card {
            background: #fff;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .title {
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            color: #0d6efd;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 25px;
        }

        .form-control {
            height: 45px;
            border-radius: 10px;
        }

        .btn-custom {
            width: 100%;
            border-radius: 10px;
            padding: 12px;
            font-weight: bold;
        }

        .msg {
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
        }

        .icon-box {
            text-align: center;
            font-size: 60px;
            margin-bottom: 15px;
        }

        @media(max-width:768px) {

            .forgot-card {
                padding: 20px;
            }

            .title {
                font-size: 25px;
            }
        }
    </style>

</asp:Content>

<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="container forgot-container">

        <div class="forgot-card">

            <!-- ICON -->
            <div class="icon-box">
                🔐
            </div>

            <!-- TITLE -->
            <div class="title">
                Forget Password
            </div>

            <div class="subtitle">
                Reset your account password securely
            </div>

            <!-- MOBILE -->
            <div class="mb-3">
                <label>Mobile Number</label>

                <asp:TextBox ID="txtMobile" runat="server"  CssClass="form-control" placeholder="Enter Mobile Number" MaxLength="10"></asp:TextBox>
            </div>

            <!-- OTP -->
            <div class="mb-3">
                <label>OTP</label>

                <asp:TextBox ID="txtOTP" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
            </div>

            <!-- NEW PASSWORD -->
            <div class="mb-3">
                <label>New Password</label>

                <asp:TextBox ID="txtNewPassword"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Password"
                    placeholder="Enter New Password"></asp:TextBox>
            </div>

            <!-- CONFIRM PASSWORD -->
            <div class="mb-3">
                <label>Confirm Password</label>

                <asp:TextBox ID="txtConfirmPassword"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Password"
                    placeholder="Confirm Password"></asp:TextBox>
            </div>

            <!-- SEND OTP -->
            <div class="mb-3">

                <asp:Button ID="btnSendOTP"
                    runat="server"
                    Text="Send OTP"
                    CssClass="btn btn-primary btn-custom"
                    OnClick="btnSendOTP_Click" />

            </div>

            <!-- RESET PASSWORD -->
            <div class="mb-3">

                <asp:Button ID="btnResetPassword"
                    runat="server"
                    Text="Reset Password"
                    CssClass="btn btn-success btn-custom"
                    OnClick="btnResetPassword_Click" />

            </div>

            <!-- MESSAGE -->
            <asp:Label ID="lblMsg"
                runat="server"
                CssClass="msg"></asp:Label>

        </div>

    </div>

</asp:Content>