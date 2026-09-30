<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Addtocart.aspx.cs" Inherits="Vidyakendraa.Addtocart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Page background */
        body {
            background: #f8f9fa;
        }

        /* Cart Title */
        h3 {
            font-weight: 600;
        }

        /* Cart Table */
        .table {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
        }

            .table th {
                background: #f1f3f5;
                font-weight: 600;
                text-align: center;
            }

            .table td {
                vertical-align: middle;
                text-align: center;
            }

            /* Book image */
            .table img {
                border-radius: 6px;
                box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            }

        /* Grand total section */
        .text-end h4 {
            font-weight: 700;
            color: #7a7c80fc;
        }

        /* Checkout button */
        .btn-success {
            padding: 10px 25px;
            border-radius: 8px;
            font-weight: 600;
            transition: 0.3s;
            background-color: #fd7e14;
        }

            .btn-success:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            }

        /* Empty cart message */
        .alert-info {
            background: #e9f7ef;
            border: none;
            color: #1e7e34;
            font-weight: 500;
            border-radius: 8px;
            padding: 15px;
        }

        /* Responsive table */
        @media (max-width: 768px) {
            .table img {
                height: 50px;
            }

            h4 {
                font-size: 18px;
            }
        }

        .empty-cart-box {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            display: inline-block;
            margin-top: 45px;
        }

        .empty-icon {
            font-size: 60px;
            color: #ccc;
        }
        .container-m4{
            margin-top: 5.5rem !important;
        }
    </style>
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-m4">
        <div class="container mt-5 mb-5">
            <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="text-center mt-5">
                <div class="empty-cart-box">
                    <i class="fa fa-shopping-cart empty-icon"></i>
                    <h4 class="mt-3">Your cart is empty</h4>
                    <p class="text-muted">Looks like you haven't added any books yet.</p>
                    <a href="Home.aspx" class="btn btn-success mt-2">Back To Home
                    </a>
                </div>
            </asp:Panel>
            <asp:Repeater ID="rptCart" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered">
                        <tr class="table-light">
                            <th>Image</th>
                            <th>Book Name</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                        </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td width="100">
                            <img src='<%# ResolveUrl("~/Images/") + Eval("ImagePath") %>'
                                style="height: 70px;" />
                        </td>
                        <td><%# Eval("BookName") %></td>
                        <td>₹ <%# Eval("Price") %></td>
                        <td><%# Eval("Qty") %></td>
                        <td>₹ <%# Eval("Total") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:Panel ID="cartSummary" runat="server">
                <div class="text-end mt-3">
                    <h4 class="fw-bold text-success">Grand Total: ₹
                    <asp:Label ID="lblGrandTotal" runat="server" />
                    </h4>

                    <asp:Button ID="btnCheckout" runat="server"
                        Text="Proceed to Checkout"
                        CssClass="btn btn-success btn-lg px-4 mt-2" />
                </div>
            </asp:Panel>

        </div>
    </div>
</asp:Content>
