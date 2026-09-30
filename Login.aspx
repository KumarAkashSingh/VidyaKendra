<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vidyakendraa.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ===== FULL BACKGROUND ===== */
        .login-bg {
            min-height: 100vh;
            width: 100%;
            background: url('images/Backgroundlogin.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        /* ===== LOGIN CARD ===== */
        .login-card {
            width: 100%;
            max-width: 420px;
            padding: 35px 30px;
            border-radius: 18px;
            background: rgba(0, 0, 0, 0.65);
            backdrop-filter: blur(14px);
            -webkit-backdrop-filter: blur(14px);
            border: 1px solid rgba(255, 255, 255, 0.15);
            box-shadow: 0 20px 50px rgba(0,0,0,0.7);
        }
            /* TEXT VISIBILITY */
            .login-title,
            .login-card label {
                color: #ffffff;
                font-weight: 600;
            }

            .login-card p,
            .text-muted {
                color: #dddddd !important;
            }



        @keyframes fadeUp {
            from {
                transform: translateY(20px);
                opacity: 0;
            }

            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* ===== HEADER ===== */
        .login-icon {
            font-size: 60px;
            color: #008dd2;
        }

        .login-title {
            font-weight: 700;
            color: #008dd2;
        }

        /* ===== INPUTS ===== */
        .form-control {
            border-radius: 12px;
            padding: 12px 15px;
            border: 1px solid #ced4da;
        }

            .form-control:focus {
                border-color: #008dd2;
                box-shadow: 0 0 0 0.15rem rgba(0,141,210,0.25);
            }

        /* BUTTON */
        .btn-login {
            background: linear-gradient(135deg, #00b4ff, #0066ff);
            border: none;
            border-radius: 30px;
            font-weight: 600;
        }

            .btn-login:hover {
                background: linear-gradient(135deg, #0099dd, #0052cc);
            }

        /* ===== LINKS ===== */

        /* LINKS */
        .login-links a {
            color: #7dd3ff;
            text-decoration: none;
        }

            .login-links a:hover {
                text-decoration: underline;
            }

        .login-card h4,
        .login-card label {
            color: #ffffff;
            font-weight: 600;
        }

        .login-card p,
        .login-card .text-muted {
            color: #dcdcdc !important;
        }

        .login-card .form-control {
            background: rgba(255,255,255,0.9);
            border: none;
            color: #000;
            font-weight: 500;
        }

            .login-card .form-control::placeholder {
                color: #666;
            }

        /* ===== MOBILE ===== */
        @media (max-width: 576px) {
            .login-card {
                padding: 30px 22px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-bg">
        <div class="login-card">
            <!-- HEADER -->
            <div class="text-center mb-4">
                <i class="fas fa-user-circle login-icon"></i>
                <h4 class="login-title mt-2">User Login</h4>
                <p class="text-muted mb-0">Welcome back to Vidyakendra</p>
            </div>

            <!-- MOBILE -->
            <div class="mb-3">
                <label class="form-label fw-semibold">Mobile Number</label>
                <asp:TextBox ID="txtEmail" runat="server"
                    CssClass="form-control"
                    Placeholder="Enter your mobile number" />
            </div>

            <!-- PASSWORD -->
            <div class="mb-3">
                <label class="form-label fw-semibold">Password</label>
                <asp:TextBox ID="txtPassword" runat="server"
                    CssClass="form-control"
                    TextMode="Password"
                    Placeholder="Enter your password" />
            </div>

            <!-- LOGIN BUTTON -->
            <div class="d-grid mt-4">
                <asp:Button ID="btnLogin" runat="server"
                    Text="Login"
                    CssClass="btn btn-login text-white"
                    OnClick="btnLogin_Click" />
            </div>

            <!-- MESSAGE -->
            <asp:Label ID="lblMsg" runat="server"
                CssClass="text-danger d-block text-center mt-3"></asp:Label>

            <!-- LINKS -->
            <div class="login-links text-center mt-4">
                <a href="Reg.aspx">New Register here</a>
                <a href="Adminlogin.aspx">/Admin Login</a>
                <br />
                <a href="ForgetPassword.aspx">Forgot password?</a>
            </div>
        </div>
    </div>
</asp:Content>
