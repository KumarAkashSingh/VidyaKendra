<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="Vidyakendraa.BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .book-card {
            box-shadow: 0 4px 18px rgba(0,0,0,0.08);
            border-radius: 12px;
            background: #fff;
        }

        .book-img {
            max-height: 420px;
            object-fit: contain;
        }

        .price-text {
            font-size: 28px;
            font-weight: 600;
            color: #28a745;
        }

        .book-title {
            font-weight: 700;
        }

        .btn-cart {
            background: #ffd814;
            border: 1px solid #fcd200;
            padding: 6px 9px;
            border-radius: 6px;
            font-weight: 600;
            transition: 0.2s;
        }

            .btn-cart:hover {
                background: #f7ca00;
            }

        .details-label {
            font-weight: 600;
            color: #555;
        }


        .page-header {
            position: relative;
            width: 100%;
        }

            .page-header::before {
                content: "";
                position: absolute;
                inset: 0;
                background: rgba(0,0,0,0.45); /* dark overlay */
                margin-top: 24px;
                margin-top: -24px;
                width: 1521px;
                margin-left: -125px;
                height: 140px;
            }



            .page-header > div {
                position: relative;
                z-index: 2;
            }

        .page-header-banner {
            width: 100%;
            height: 190px; /* desktop height */
            background: url('../Image/BannerRegistration.jpg') center center no-repeat;
            background-size: cover;
        }

        /* Tablet */
        @media (max-width:992px) {
            .page-header-banner {
                height: 180px;
            }
        }

        /* Mobile */
        @media (max-width:576px) {
            .page-header-banner {
                height: 140px;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- HEADER IMAGE FULL WIDTH -->
    <div class="container-fluid p-0 mb-4">
        <div class="page-header-banner"></div>
    </div>

    <!-- BOOK DETAILS -->
    <div class="container mb-5">
        <div class="row shadow rounded bg-white p-4" >
            <!-- LEFT: IMAGE SLIDER -->
            <div class="col-md-5 mb-4 mb-md-0">
                <div id="bookCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <asp:Repeater ID="rptImages" runat="server" OnItemDataBound="rptImages_ItemDataBound">
                            <ItemTemplate>
                                <div runat="server" id="divItem" class="carousel-item">
                                    <img src='<%# ResolveUrl("~/Images/") + Eval("ImagePath") %>'
                                        class="d-block w-100 rounded"
                                        style="height: 350px; object-fit: cover;" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <button class="carousel-control-prev" type="button"
                        data-bs-target="#bookCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>

                    <button class="carousel-control-next" type="button"
                        data-bs-target="#bookCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
            </div>


            <!-- RIGHT: BOOK DETAILS -->
            <div class="col-md-7">
                <h2 class="fw-bold mb-3">
                    <asp:Label ID="lblName" runat="server" />
                </h2>

                <p class="mb-2">
                    <strong>Category:</strong>
                    <asp:Label ID="lblCategory" runat="server" />
                </p>

                <h4 class="text-success fw-bold mb-3">
                    <asp:Label ID="lblPrice" runat="server" />
                </h4>

                <p class="mb-4">
                    <strong>Description:</strong><br />
                    <asp:Label ID="Labeldes" runat="server" />
                </p>

                <div class="mt-3">
                    <asp:Button ID="btnCart" runat="server"
                        Text="Add to Cart"
                        CssClass="btn btn-warning me-2 px-4"
                        OnClick="btnCart_Click" />

                    <asp:Button ID="btnBuy" runat="server"
                        Text="Buy Now"
                        CssClass="btn btn-success px-4" />
                </div>
            </div>
        </div>
    </div>

    <!-- RELATED BOOKS -->
    <div class="container mb-5">
        <h4 class="fw-bold mb-4 text-center">Related Books</h4>

        <div class="row">
            <asp:Repeater ID="rptRelatedBooks" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                        <div class="card h-100 shadow-sm border-0">
                            <a href='BookDetails.aspx?BookID=<%# Eval("BookID") %>'>
                                <img src='<%# ResolveUrl("~/Images/") + Eval("ImagePath") %>'
                                    class="card-img-top"
                                    style="height: 200px; object-fit: cover;" />
                            </a>
                            <div class="card-body text-center">
                                <h6 class="fw-semibold">
                                    <%# Eval("BookName") %>
                                </h6>
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
