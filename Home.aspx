<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Vidyakendraa.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .banner-img {
            height: 420px;
            object-fit: cover;
        }

        @media (max-width:768px) {
            .banner-img {
                height: 220px;
            }
        }

        .category-icon img {
            width: 80px;
            height: 80px;
        }

        .product-card img {
            height: 180px;
            object-fit: cover;
            visibility: visible;
        }

        .school-section {
            background: #f5f5f5;
            padding: 0px 0;
        }

        .category-card {
            background: #ffffff;
            border-radius: 50%;
            width: 140px;
            height: 140px;
            margin: auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            box-shadow: 0 6px 18px rgba(0,0,0,0.12);
            transition: all 0.3s ease;
            cursor: pointer;
        }

            .category-card img {
                width: 60px;
                height: 60px;
                object-fit: contain;
            }

            .category-card p {
                margin-top: 10px;
                font-weight: 600;
                color: #333;
            }

            .category-card:hover {
                background: #008dd2;
                transform: translateY(-8px);
            }

                .category-card:hover p {
                    color: #fff;
                }

                .category-card:hover img {
                    /* filter: brightness(0) invert(1);*/
                }

        /* Mobile */
        @media (max-width: 768px) {
            .category-card {
                width: 120px;
                height: 120px;
            }

                .category-card img {
                    width: 50px;
                    height: 50px;
                }
        }

        .product-card {
            border-radius: 10px;
            transition: 0.3s;
        }

            .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            }

        .book-img {
            height: 250px;
            object-fit: cover;
        }

        .category-card {
            background: #fff;
            padding: 15px;
            border-radius: 12px;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }

            .category-card img {
                width: 100%;
                height: 150px;
                object-fit: cover;
                border-radius: 10px;
            }

            .category-card p {
                margin-top: 10px;
                font-weight: 600;
                color: #333;
            }

            .category-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }

        .category-link {
            text-decoration: none;
            display: block;
        }

        /* Card */
        .category-card {
            background: #fff;
            border-radius: 15px;
            padding: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

            /* Image */
            .category-card img {
                width: 100%;
                height: 160px;
                object-fit: cover;
                border-radius: 10px;
                transition: 0.4s;
            }

            /* Text */
            .category-card p {
                margin-top: 10px;
                font-weight: 600;
                color: #333;
            }

            /* Hover Effect */
            .category-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            }

                /* Image Hover Zoom */
                .category-card:hover img {
                    transform: scale(1.08);
                }

        .header-gif {
            width: 100%;
            text-align: center;
            background: #fff;
        }

        .festival-img {
            max-width: 100%;
            height: 80px;
            object-fit: contain;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" style="margin-top: 65px">
    <div style="margin-top: 45px;">
        <div class="header-gif">
            <asp:Image ID="imgFestival" runat="server" CssClass="festival-img" />
            <!-- ===== BANNER SLIDER ===== -->
            <div id="mainBanner" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="3000" style="margin-top: -45px;">
                <!-- INDICATORS -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#mainBanner" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#mainBanner" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#mainBanner" data-bs-slide-to="2"></button>
                </div>

                <!-- SLIDES -->
                <div class="carousel-inner">

                    <div class="carousel-item active">
                        <img src="images/Vidyabanner1.jpg" class="d-block w-100 banner-img" alt="Banner 1">
                    </div>
                    <div class="carousel-item">
                        <img src="images/Vidyabanner2.jpg" class="d-block w-100 banner-img" alt="Banner 2">
                    </div>
                    <div class="carousel-item">
                        <img src="images/Vidyabanner3.jpg" class="d-block w-100 banner-img" alt="Banner 3">
                    </div>
                </div>

                <!-- CONTROLS -->
                <button class="carousel-control-prev" type="button" data-bs-target="#mainBanner" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#mainBanner" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>
        </div>

        <!-- ===== CATEGORY ICONS ===== -->
        <div class="container mb-5" style="margin-top: 25px;">
            <div class="row text-center justify-content-center">

                <div class="col-6 col-md-3 mb-4">
                    <a href="Books.aspx?Category=KidsToKG" class="category-link">
                        <div class="category-card">
                            <img src="images/cat1.jpg" alt="KidsToKG Book" />
                            <p>Kids To KG Book</p>
                        </div>
                    </a>
                </div>

                <div class="col-6 col-md-3 mb-4">
                    <a href="Books.aspx?Category=1To8" class="category-link">
                        <div class="category-card">
                            <img src="images/cat2.jpg" alt="1to8 Book" />
                            <p>1 To 8 Book</p>
                        </div>
                    </a>
                </div>

                <div class="col-6 col-md-3 mb-4">
                    <a href="Books.aspx?Category=9To10" class="category-link">
                        <div class="category-card">
                            <img src="images/cat3.jpg" alt="9To10 Book" />
                            <p>9 To 10 Book</p>
                        </div>
                    </a>
                </div>

                <div class="col-6 col-md-3 mb-4">
                    <a href="Books.aspx?Category=11To12" class="category-link">
                        <div class="category-card">
                            <img src="images/cat4.jpg" alt="11To12 Book" />
                            <p>11 To 12 Book</p>
                        </div>
                    </a>
                </div>

            </div>
        </div>


        <!-- ===== PRODUCTS (2 ROW × 4 COLUMN) ===== -->
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptBooks" runat="server">
                    <ItemTemplate>
                        <div class="col-lg-3 col-md-4 col-sm-6 mb-4 d-flex">
                            <div class="card product-card w-100 h-100 shadow-sm">

                                <!-- IMAGE -->
                                <a href='BookDetails.aspx?BookID=<%# Eval("BookID") %>'>
                                    <asp:Image ID="imgBook" runat="server"
                                        ImageUrl='<%# ResolveUrl("~/Images/") + Eval("ImagePath") %>'
                                        CssClass="card-img-top book-img" />
                                </a>

                                <!-- BODY -->
                                <div class="card-body text-center d-flex flex-column">

                                    <h6 class="flex-grow-1">
                                        <a href='BookDetails.aspx?BookID=<%# Eval("BookID") %>'
                                            class="text-dark text-decoration-none">
                                            <%# Eval("BookName") %>
                                        </a>
                                    </h6>
                                    <small class="text-muted d-block mb-2">
                                        <%# Eval("Category") %>
                                    </small>

                                    <p class="fw-bold text-success mb-0">
                                        ₹ <%# Eval("Price") %>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <!-- ===== SCHOOL / EDUCATION SECTION ===== -->
        <div class="school-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <img src="images/Vidyabanner.jpg" class="img-fluid rounded" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

