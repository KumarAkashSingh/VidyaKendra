<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Vidyakendraa.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contact-wrapper {
            min-height: 85vh;
            background: #f4f7fb;
            padding: 60px 15px;
        }

        .contact-card {
            background: #ffffff;
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
            padding: 35px;
        }

        .contact-title {
            color: #008dd2;
            font-weight: 700;
        }

        .form-control {
            border-radius: 10px;
            padding: 10px 14px;
        }

        .btn-send {
            background: linear-gradient(135deg, #00b4ff, #0066ff);
            border: none;
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: 600;
        }

            .btn-send:hover {
                background: linear-gradient(135deg, #0099dd, #0052cc);
            }

        .contact-info {
            background: #008dd2;
            color: #fff;
            border-radius: 18px;
            padding: 30px;
            height: 100%;
        }

            .contact-info h5 {
                font-weight: 700;
            }

            .contact-info p {
                margin-bottom: 10px;
            }

        .info-card {
            background: #ffffff;
            border-radius: 14px;
            padding: 13px 10px;
            border: 1px solid #e8e8e8;
            box-shadow: 0 8px 20px rgba(0,0,0,0.06);
            transition: all 0.3s ease;
        }

            .info-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 12px 28px rgba(0,0,0,0.1);
            }

        .section-title {
            color: #ff6a00;
            font-weight: 700;
            margin-bottom: 14px;
            font-size: 25px;
        }

        .info-line {
            font-size: 17x;
            margin-bottom: 12px;
            color: #222;
        }

            .info-line strong {
                font-weight: 700;
            }

            .info-line a {
                color: #ff6a00;
                text-decoration: none;
                font-weight: 500;
            }

                .info-line a:hover {
                    text-decoration: underline;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="contact-wrapper">
        <div class="container">
            <div class="row g-4 align-items-stretch">
                <!-- CONTACT INFO -->
                <div class="col-md-5">
                    <div class="contact-info">
                        <h5>Vidyakendra</h5>
                        <p>Empowering education with quality learning.</p>

                        <hr />

                        <p>
                            <strong>📍 Address:</strong><br />
                            Vidyakendra, India
                        </p>

                        <p>
                            <strong>📞 Phone:</strong><br />
                            +91 9198818395
                        </p>

                        <p>
                            <strong>✉ Email:</strong><br />
                            info@vidyakendra.com
                        </p>

                        <p>
                            <strong>⏰ Working Hours:</strong><br />
                            Mon – Sat: 9:00 AM – 6:00 PM
                        </p>
                    </div>
                </div>


                <!-- CONTACT FORM -->
                <div class="col-md-7">
                    <div class="contact-card">
                        <h3 class="contact-title mb-3">Contact Us</h3>
                        <p class="text-muted mb-4">
                            Have questions? We’d love to hear from you.
                        </p>

                        <div class="mb-3">
                            <label class="form-label">Your Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                Placeholder="Enter your name"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mobile Number</label>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"
                                Placeholder="Enter mobile number"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
                                Placeholder="Enter email address"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Message</label>
                            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control"
                                TextMode="MultiLine" Rows="4"
                                Placeholder="Write your message"></asp:TextBox>
                        </div>

                        <div class="text-center mt-4">
                            <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-send text-white" OnClick="btnSend_Click" />
                        </div>

                        <asp:Label ID="lblMsg" runat="server"
                            CssClass="text-success d-block text-center mt-3"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container my-5">



        <!-- PAYOUT SECTION -->
        <div class="container my-5">
            <div class="row g-4">
                <!-- CARD 1 -->
                <div class="col-md-4">
                    <div class="info-card h-100">
                        <h2 class="section-title">Account Section</h2>
                        <p class="info-line">
                            <strong>Phone No. :</strong>
                            <span>+91 9953354092</span>
                        </p>
                        <p class="info-line">
                            <strong>E-mail :</strong>
                            <a href="mailto:accounts@asclepiuswellness.com">accounts@asclepiuswellness.com
                            </a>
                        </p>
                    </div>
                </div>

                <!-- CARD 2 -->
                <div class="col-md-4">
                    <div class="info-card h-100">
                        <h2 class="section-title">Payout Section</h2>
                        <p class="info-line">
                            <strong>Phone No. :</strong>
                            <span>+91 9953439499</span>
                        </p>
                        <p class="info-line">
                            <strong>E-mail :</strong>
                            <a href="mailto:payouts@asclepiuswellness.com">payouts@asclepiuswellness.com
                            </a>
                        </p>
                    </div>
                </div>

                <!-- CARD 3 -->
                <div class="col-md-4">
                    <div class="info-card h-100">
                        <h2 class="section-title">Payout Section</h2>
                        <p class="info-line">
                            <strong>Phone No. :</strong>
                            <span>+91 9953439499</span>
                        </p>
                        <p class="info-line">
                            <strong>E-mail :</strong>
                            <a href="mailto:payouts@asclepiuswellness.com">payouts@asclepiuswellness.com
                            </a>
                        </p>
                    </div>
                </div>

                <!-- CARD 4 -->
                <div class="col-md-4">
                    <div class="info-card h-100">
                        <h2 class="section-title">Support Section</h2>
                        <p class="info-line">
                            <strong>Phone No. :</strong>
                            <span>+91 9876543210</span>
                        </p>
                        <p class="info-line">
                            <strong>E-mail :</strong>
                            <a href="mailto:support@asclepiuswellness.com">support@asclepiuswellness.com
                            </a>
                        </p>
                    </div>
                </div>

                <!-- CARD 5 -->
                <div class="col-md-4">
                    <div class="info-card h-100">
                        <h2 class="section-title">Sales Section</h2>
                        <p class="info-line">
                            <strong>Phone No. :</strong>
                            <span>+91 9123456789</span>
                        </p>
                        <p class="info-line">
                            <strong>E-mail :</strong>
                            <a href="mailto:sales@asclepiuswellness.com">sales@asclepiuswellness.com
                            </a>
                        </p>
                    </div>
                </div>
                <!-- CARD 6 -->
                <div class="col-md-4">
                    <div class="info-card h-100">
                        <h2 class="section-title">Sales Section</h2>
                        <p class="info-line">
                            <strong>Phone No. :</strong>
                            <span>+91 9123456789</span>
                        </p>
                        <p class="info-line">
                            <strong>E-mail :</strong>
                            <a href="mailto:sales@asclepiuswellness.com">sales@asclepiuswellness.com
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

