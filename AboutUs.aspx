<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Vidyakendraa.AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================================
           GLOBAL
        ========================================== */

        .aw-about {
            font-family: Arial, Helvetica, sans-serif;
            color: #1d2939;
        }


        /* =========================================
           HERO
        ========================================== */

        .aw-hero {
            position: relative;
            min-height: 285px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;

            background:
                linear-gradient(rgba(35, 22, 10, 0.82), rgba(35, 22, 10, 0.82)),
                url('images/about-banner.jpg') center center / cover no-repeat;

            overflow: hidden;
        }

        .aw-hero-content {
            position: relative;
            z-index: 2;
            max-width: 900px;
            padding: 40px 20px;
            color: #fff;
        }

        .aw-hero-tag {
            display: inline-block;
            padding: 8px 20px;
            border: 1px solid rgba(253,126,20,.7);
            color: #fff;
            border-radius: 30px;
            font-size: 13px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 20px;
            background: rgba(253,126,20,.12);
        }

        .aw-hero h1 {
            font-size: 52px;
            font-weight: 700;
            margin-bottom: 18px;
        }

        .aw-hero p {
            font-size: 20px;
            line-height: 1.7;
            margin: 0 auto;
            opacity: .95;
        }


        /* =========================================
           COMMON SECTION
        ========================================== */

        .aw-section {
            padding: 85px 0;
        }

        .aw-section-light {
            background: #fff8f2;
        }

        .aw-heading {
            margin-bottom: 45px;
        }

        .aw-heading .small-title {
            color: #fd7e14;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 10px;
            display: block;
        }

        .aw-heading h2 {
            font-size: 38px;
            font-weight: 700;
            color: #2b211b;
            margin-bottom: 15px;
        }

        .aw-heading p {
            color: #667085;
            font-size: 16px;
            line-height: 1.8;
            max-width: 760px;
        }


        /* =========================================
           WHO WE ARE
        ========================================== */

        .aw-who-image {
            position: relative;
            padding: 15px;
        }

        .aw-who-image img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 18px;

            box-shadow:
                0 18px 45px rgba(253,126,20,.18);
        }

        .aw-image-badge {
            position: absolute;
            right: 0;
            bottom: 35px;

            background: #fd7e14;
            color: #fff;

            padding: 18px 25px;
            border-radius: 12px;

            box-shadow:
                0 10px 30px rgba(253,126,20,.28);
        }

        .aw-image-badge strong {
            display: block;
            font-size: 22px;
        }

        .aw-image-badge span {
            font-size: 12px;
            opacity: .9;
        }

        .aw-who-content {
            padding: 20px 20px 20px 45px;
        }

        .aw-who-content h2 {
            font-size: 38px;
            font-weight: 700;
            color: #2b211b;
            margin-bottom: 20px;
        }

        .aw-who-content h2 span {
            color: #fd7e14;
        }

        .aw-who-content p {
            color: #667085;
            font-size: 16px;
            line-height: 1.9;
            margin-bottom: 18px;
        }


        /* =========================================
           VISION / MISSION
        ========================================== */

        .aw-info-card {
            background: #fff;

            border-radius: 18px;
            padding: 38px 32px;

            height: 100%;

            border: 1px solid #f3e1d2;

            transition: all .3s ease;

            box-shadow:
                0 8px 30px rgba(253,126,20,.07);
        }

        .aw-info-card:hover {
            transform: translateY(-8px);

            box-shadow:
                0 18px 40px rgba(253,126,20,.15);
        }

        .aw-icon {
            width: 62px;
            height: 62px;

            border-radius: 15px;

            background: #fff0e3;
            color: #fd7e14;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 27px;

            margin-bottom: 22px;
        }

        .aw-info-card h3 {
            font-size: 24px;
            color: #2b211b;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .aw-info-card p {
            color: #667085;
            line-height: 1.8;
            margin: 0;
            font-size: 15px;
        }


        /* =========================================
           QUALITY & COMPLIANCE
        ========================================== */

        .aw-quality-box {
            background: #fff;

            border-radius: 20px;
            padding: 45px;

            box-shadow:
                0 10px 40px rgba(253,126,20,.09);

            border: 1px solid #f3e1d2;
        }

        .aw-quality-box h2 {
            color: #2b211b;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .aw-quality-box p {
            color: #667085;
            line-height: 1.9;
            font-size: 16px;
        }

        .aw-quality-highlight {
            margin-top: 25px;

            padding: 18px 20px;

            border-left: 4px solid #fd7e14;

            background: #fff6ee;

            color: #4a3425;

            font-weight: 600;
            line-height: 1.7;
        }


        /* =========================================
           WHY ASCLEPIUS
        ========================================== */

        .aw-why-card {
            background: #fff;

            border-radius: 15px;
            padding: 28px 22px;

            height: 100%;

            border: 1px solid #f3e1d2;

            transition: .3s ease;
        }

        .aw-why-card:hover {
            transform: translateY(-6px);

            box-shadow:
                0 15px 35px rgba(253,126,20,.13);
        }

        .aw-check {
            width: 45px;
            height: 45px;

            border-radius: 50%;

            background: #fff0e3;
            color: #fd7e14;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 20px;

            margin-bottom: 18px;
        }

        .aw-why-card h5 {
            font-size: 17px;
            line-height: 1.5;
            color: #2b211b;
            font-weight: 700;
            margin: 0;
        }


        /* =========================================
           MANUFACTURING
        ========================================== */

        .aw-manufacturing {
            background:
                linear-gradient(
                    rgba(55, 28, 8, .93),
                    rgba(55, 28, 8, .93)
                ),
                url('images/manufacturing.jpg') center / cover no-repeat;

            color: #fff;
        }

        .aw-manufacturing .small-title {
            color: #ffb066;
        }

        .aw-manufacturing h2 {
            color: #fff;
        }

        .aw-manufacturing p {
            color: rgba(255,255,255,.84);
            line-height: 1.9;
            font-size: 16px;
        }

        .aw-manufacturing-points {
            margin-top: 30px;
        }

        .aw-manufacturing-point {
            display: flex;
            align-items: flex-start;
            margin-bottom: 18px;
        }

        .aw-manufacturing-point i {
            margin-right: 12px;
            margin-top: 5px;
            color: #fd7e14;
        }


        /* =========================================
           JOIN JOURNEY / CTA
        ========================================== */

        .aw-cta {
            padding: 80px 20px;

            background:
                linear-gradient(
                    135deg,
                    #452c19,
                    #f28b00
                );

            text-align: center;
            color: #fff;
        }

        .aw-cta h2 {
            font-size: 40px;
            font-weight: 700;
            margin-bottom: 18px;
        }

        .aw-cta p {
            max-width: 850px;
            margin: 0 auto 30px;

            font-size: 17px;
            line-height: 1.8;

            opacity: .95;
        }

        .aw-btn {
            display: inline-block;

            padding: 14px 30px;

            border-radius: 8px;

            text-decoration: none;

            font-weight: 700;

            margin: 5px;

            transition: .3s ease;
        }

        .aw-btn-primary {
            background: #fff;
            color: #fd7e14;
        }

        .aw-btn-primary:hover {
            background: #fff4ea;
            color: #d95f00;
        }

        .aw-btn-outline {
            border: 1px solid rgba(255,255,255,.9);
            color: #fff;
        }

        .aw-btn-outline:hover {
            background: #fff;
            color: #fd7e14;
        }


        /* =========================================
           RESPONSIVE
        ========================================== */

        @media (max-width: 991px) {

            .aw-hero h1 {
                font-size: 42px;
            }

            .aw-who-content {
                padding: 40px 10px 10px;
            }

            .aw-who-image img {
                height: 400px;
            }

            .aw-section {
                padding: 50px 0;
            }
        }


        @media (max-width: 767px) {

            .aw-hero {
                min-height: 285px;
            }

            .aw-hero h1 {
                font-size: 34px;
            }

            .aw-hero p {
                font-size: 16px;
            }

            .aw-section {
                padding: 50px 0;
            }

            .aw-heading h2,
            .aw-who-content h2 {
                font-size: 30px;
            }

            .aw-who-image img {
                height: 300px;
            }

            .aw-image-badge {
                right: 15px;
                bottom: 25px;
            }

            .aw-quality-box {
                padding: 30px 22px;
            }

            .aw-cta h2 {
                font-size: 30px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="aw-about">


        <!-- =========================================
             HERO
        ========================================== -->

        <section class="aw-hero">

            <div class="aw-hero-content">

                <span class="aw-hero-tag">
                    About Asclepius Wellness
                </span>

                <h1>
                    Wellness. Opportunity. Progress.
                </h1>

                <p>
                    Empowering healthier lifestyles and creating meaningful
                    opportunities through quality, innovation and responsible
                    business practices.
                </p>

            </div>

        </section>


        <!-- =========================================
             ABOUT US
        ========================================== -->

        <section class="aw-section">

            <div class="container">

                <div class="row align-items-center">


                    <!-- IMAGE LEFT -->

                    <div class="col-lg-6">

                        <div class="aw-who-image">

                            <img src="images/aboutus.jpg"
                                 alt="Asclepius Wellness"
                                 class="img-fluid" />


                        </div>

                    </div>


                    <!-- CONTENT RIGHT -->

                    <div class="col-lg-6">

                        <div class="aw-who-content">

                            <h2>
                                About
                                <span>Asclepius Wellness</span>
                            </h2>

                            <p>
                                Asclepius Wellness Private Limited is a leading
                                wellness and direct selling company in India,
                                committed to promoting healthier lifestyles through
                                quality wellness products and responsible business
                                practices.
                            </p>

                            <p>
                                With a growing product portfolio and distribution
                                network across India, we combine quality, innovation,
                                wellness, and entrepreneurship to create long-term
                                value for our customers and Direct Sellers.
                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =========================================
             VISION & MISSION
        ========================================== -->

        <section class="aw-section aw-section-light">

            <div class="container">

                <div class="aw-heading text-center">

                    <span class="small-title">
                        Our Direction
                    </span>

                    <h2>
                        Vision & Mission
                    </h2>

                    <p class="mx-auto">
                        Our vision and mission guide our commitment to wellness,
                        trust, transparency, innovation and sustainable growth.
                    </p>

                </div>


                <div class="row g-4">


                    <!-- VISION -->

                    <div class="col-lg-6">

                        <div class="aw-info-card">

                            <div class="aw-icon">
                                <i class="fas fa-eye"></i>
                            </div>

                            <h3>
                                Our Vision
                            </h3>

                            <p>
                                Our vision is to become one of the most trusted
                                wellness and direct selling companies in India,
                                empowering millions of people towards better health,
                                personal growth, and economic opportunities.
                            </p>

                            <p class="mt-3">
                                We aim to grow with a strong foundation of quality,
                                trust, transparency, and innovation.
                            </p>

                        </div>

                    </div>


                    <!-- MISSION -->

                    <div class="col-lg-6">

                        <div class="aw-info-card">

                            <div class="aw-icon">
                                <i class="fas fa-bullseye"></i>
                            </div>

                            <h3>
                                Our Mission
                            </h3>

                            <p>
                                Our mission is to provide high-quality health and
                                wellness products that support healthier lifestyles
                                and everyday well-being.
                            </p>

                            <p class="mt-3">
                                At the same time, we are committed to building a
                                transparent and responsible direct selling platform
                                that encourages entrepreneurship and creates
                                opportunities for sustainable growth.
                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =========================================
             QUALITY
        ========================================== -->

        <section class="aw-section">

            <div class="container">

                <div class="row justify-content-center">

                    <div class="col-lg-10">

                        <div class="aw-quality-box">

                            <div class="aw-heading mb-3">

                                <span class="small-title">
                                    Our Commitment
                                </span>

                                <h2>
                                    Quality, Certification & Compliance
                                </h2>

                            </div>

                            <div class="aw-quality-highlight">

                                Quality and customer trust remain at the heart
                                of Asclepius Wellness.

                            </div>

                            <p class="mt-4">

                                Our products are manufactured under defined quality
                                standards and in accordance with applicable GMP,
                                FSSAI, and regulatory requirements.

                            </p>

                            <p>

                                We remain committed to responsible business practices,
                                transparency, and applicable direct selling compliance.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =========================================
             WHY ASCLEPIUS
        ========================================== -->

        <section class="aw-section aw-section-light">

            <div class="container">

                <div class="aw-heading text-center">

                    <span class="small-title">
                        Our Strength
                    </span>

                    <h2>
                        Why Asclepius Wellness?
                    </h2>

                    <p class="mx-auto">

                        Our focus is to make quality wellness products in India
                        accessible through a strong and growing network.

                    </p>

                </div>


                <div class="row g-4">


                    <div class="col-lg-4 col-md-6">

                        <div class="aw-why-card">

                            <div class="aw-check">
                                <i class="fas fa-check"></i>
                            </div>

                            <h5>
                                Quality-focused health and wellness products
                            </h5>

                        </div>

                    </div>


                    <div class="col-lg-4 col-md-6">

                        <div class="aw-why-card">

                            <div class="aw-check">
                                <i class="fas fa-flask"></i>
                            </div>

                            <h5>
                                Thoughtfully developed formulations
                            </h5>

                        </div>

                    </div>


                    <div class="col-lg-4 col-md-6">

                        <div class="aw-why-card">

                            <div class="aw-check">
                                <i class="fas fa-industry"></i>
                            </div>

                            <h5>
                                Strong quality and manufacturing standards
                            </h5>

                        </div>

                    </div>


                    <div class="col-lg-4 col-md-6">

                        <div class="aw-why-card">

                            <div class="aw-check">
                                <i class="fas fa-network-wired"></i>
                            </div>

                            <h5>
                                Growing distribution network across India
                            </h5>

                        </div>

                    </div>


                    <div class="col-lg-4 col-md-6">

                        <div class="aw-why-card">

                            <div class="aw-check">
                                <i class="fas fa-handshake"></i>
                            </div>

                            <h5>
                                Transparent and responsible business practices
                            </h5>

                        </div>

                    </div>


                    <div class="col-lg-4 col-md-6">

                        <div class="aw-why-card">

                            <div class="aw-check">
                                <i class="fas fa-heart"></i>
                            </div>

                            <h5>
                                Focus on customer satisfaction and long-term trust
                            </h5>

                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =========================================
             MANUFACTURING
        ========================================== -->

        <section class="aw-section aw-manufacturing">

            <div class="container">

                <div class="row align-items-center">


                    <div class="col-lg-8">

                        <div class="aw-heading mb-0">

                            <span class="small-title">
                                Manufacturing Excellence
                            </span>

                            <h2>
                                Quality at Every Stage
                            </h2>

                            <p>
                                At Asclepius Wellness, quality is considered at
                                every stage — from ingredient selection and
                                formulation to manufacturing, quality control,
                                and final packaging.
                            </p>

                            <p>
                                Modern manufacturing processes, defined quality
                                systems, and continuous improvement help us deliver
                                reliable wellness products our customers can choose
                                with confidence.
                            </p>

                        </div>

                    </div>


                    <div class="col-lg-4">

                        <div class="aw-manufacturing-points">


                            <div class="aw-manufacturing-point">

                                <i class="fas fa-check-circle"></i>

                                <span>
                                    Ingredient Selection
                                </span>

                            </div>


                            <div class="aw-manufacturing-point">

                                <i class="fas fa-check-circle"></i>

                                <span>
                                    Thoughtful Formulation
                                </span>

                            </div>


                            <div class="aw-manufacturing-point">

                                <i class="fas fa-check-circle"></i>

                                <span>
                                    Quality Control
                                </span>

                            </div>


                            <div class="aw-manufacturing-point">

                                <i class="fas fa-check-circle"></i>

                                <span>
                                    Final Packaging
                                </span>

                            </div>


                            <div class="aw-manufacturing-point">

                                <i class="fas fa-check-circle"></i>

                                <span>
                                    Continuous Improvement
                                </span>

                            </div>


                        </div>

                    </div>

                </div>

            </div>

        </section>


        <!-- =========================================
             JOIN OUR JOURNEY
        ========================================== -->

        <section class="aw-cta">

            <div class="container">

                <h2>
                    Join Our Journey
                </h2>

                <p>
                    Asclepius Wellness continues to move forward with one purpose —
                    better health, meaningful opportunities, and sustainable growth.
                    Explore our wellness products and become part of a growing
                    community committed to Health, Prosperity, and Progress.
                </p>


                <a href="Home.aspx"
                   class="aw-btn aw-btn-primary">

                    <i class="fas fa-shopping-bag me-2"></i>

                    Explore Products

                </a>


                <a href="ContactUs.aspx"
                   class="aw-btn aw-btn-outline">

                    <i class="fas fa-envelope me-2"></i>

                    Contact Us Today

                </a>

            </div>

        </section>


    </div>

</asp:Content>