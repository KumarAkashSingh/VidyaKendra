<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Allcourse.aspx.cs" Inherits="Vidyakendraa.Allcourse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Page Background */
        body {
            background-color: #f8f9fa;
        }

        /* Dropdown Styling */
        .form-select {
            border-radius: 8px;
            box-shadow: none;
            border: 1px solid #ddd;
            transition: 0.3s;
        }

            .form-select:focus {
                border-color: #28a745;
                box-shadow: 0 0 5px rgba(40, 167, 69, 0.3);
            }

        /* Book Card */
        .card {
            border: none;
            border-radius: 12px;
            transition: 0.3s ease;
            overflow: hidden;
        }

            .card:hover {
                transform: translateY(-6px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }

        /* Book Image */
        .card-img-top {
            height: 220px;
            object-fit: cover;
            transition: 0.3s;
        }

        .card:hover .card-img-top {
            transform: scale(1.05);
        }

        /* Book Name */
        .card-body h6 {
            font-weight: 600;
            min-height: 45px;
        }

        /* Category */
        .card-body small {
            display: block;
            margin-bottom: 8px;
        }

        /* Price */
        .text-success {
            font-size: 16px;
        }

        /* Responsive spacing */
        @media (max-width: 768px) {
            .card-img-top {
                height: 180px;
            }
        }

        .filter-dropdown {
            width: 133px;
            margin-top: 41px;
            float: right;
        }
        .fw-bold{
                margin-top: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <!-- FILTER ROW -->
        <div class="row mb-4 align-items-center">
            <div class="col-md-6">
                <h4 class="fw-bold">All Books</h4>
            </div>
            <div class="col-md-6 text-end">
                <asp:DropDownList ID="ddlCategory" runat="server"
                    CssClass="form-select filter-dropdown"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
        </div>

        <!-- BOOK LIST -->
        <div class="row">
            <asp:Repeater ID="rptBooks" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-4 d-flex">
                        <div class="card w-100 shadow-sm h-100">
                            <a href='BookDetails.aspx?BookID=<%# Eval("BookID") %>'>
                                <img src='<%# ResolveUrl("~/Images/") + Eval("ImagePath") %>'
                                    class="card-img-top"
                                    style="height: 220px; object-fit: cover;" />
                            </a>
                            <div class="card-body text-center">
                                <h6><%# Eval("BookName") %></h6>
                                <small class="text-muted"><%# Eval("Category") %></small>
                                <p class="text-success fw-bold mb-0">
                                    ₹ <%# Eval("Price") %>
                                </p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

