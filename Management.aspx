<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="Vidyakendraa.Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================================================
           MAIN PAGE
        ========================================================= */

        .management-page {
            position: relative;
            width: 100%;
            padding: 45px 0 60px;
            background: #f5f8fc;
            overflow: hidden;
            font-family: 'Segoe UI', Arial, sans-serif;
            isolation: isolate;
        }


        /* =========================================================
           FULL PAGE AWPL WATERMARK
        ========================================================= */

        .management-page::before {
            content: "";
            position: absolute;
            width: 850px;
            height: 850px;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -30%);

            background-image: url('Images/logo.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;

            opacity: 0.035;
            pointer-events: none;
            z-index: 0;
        }


        .management-page::after {
            content: "";
            position: absolute;
            width: 500px;
            height: 500px;
            left: -220px;
            top: 300px;

            background-image: url('Images/logo.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;

            opacity: 0.018;
            pointer-events: none;
            z-index: 0;
        }


        /* =========================================================
           INTRO SECTION
        ========================================================= */

        .management-heading {
            position: relative;
            z-index: 2;

            width: 100%;
            margin-bottom: 30px;
            padding: 0 25px;
        }


        .management-heading-inner {
            position: relative;
            overflow: hidden;

            width: 100%;
            max-width: 1500px;

            margin: auto;
            padding: 28px 40px;

            background: #ffffff;

            border: 1px solid #e5edf5;
            border-radius: 20px;

            box-shadow:
                0 12px 35px rgba(20, 50, 90, 0.07);
        }


        .management-heading-inner::after {
            content: "";

            position: absolute;

            width: 250px;
            height: 250px;

            right: -70px;
            top: -90px;

            background-image: url('Images/AWPLLogo.png');
            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;

            opacity: 0.035;

            pointer-events: none;
        }


        .small-title {
            position: relative;
            z-index: 2;

            display: inline-flex;
            align-items: center;

            gap: 8px;

            margin-bottom: 7px;

            color: #f28b00;
            font-size: 18px;
            font-weight: 700;

            letter-spacing: 1px;

            text-transform: uppercase;
        }


        .small-title i {
            font-size: 14px;
        }


        .management-heading h1 {
            position: relative;
            z-index: 2;

            margin: 0 0 12px;

            color: #f28b00;

            font-size: 25px;
            font-weight: 800;

            line-height: 1.2;
        }


        .management-heading h1 span {
            color: #f28b00;
        }


        .management-heading p {
            position: relative;
            z-index: 2;

            max-width: 1350px;

            margin: 0 0 10px;

            color: #667085;

            font-size: 15px;
            line-height: 1.8;

            text-align: left;
        }


        .management-heading p:last-child {
            margin-bottom: 0;
        }


        /* =========================================================
           MANAGEMENT CARD
        ========================================================= */

        .management-card {
            position: relative;
            z-index: 2;

            display: grid;

            grid-template-columns:
                390px minmax(0, 1fr);

            width: calc(100% - 50px);

            max-width: 1500px;

            height: 620px;

            margin: 0 auto 30px;

            background: #ffffff;

            border: 1px solid #e1e9f1;

            border-radius: 24px;

            overflow: hidden;

            box-shadow:
                0 18px 50px rgba(20, 50, 90, 0.10);
        }


        /* =========================================================
           CARD WATERMARK
        ========================================================= */

        .management-card::after {
            content: "";

            position: absolute;

            width: 360px;
            height: 360px;

            right: -80px;
            bottom: -110px;

            background-image: url('Images/AWPLLogo.png');

            background-repeat: no-repeat;
            background-position: center;
            background-size: contain;

            opacity: 0.025;

            pointer-events: none;

            z-index: 0;
        }


        /* =========================================================
           LEFT PROFILE - WHITE BACKGROUND
        ========================================================= */

        .profile-left {
            position: relative;

            width: 100%;
            height: 620px;

            display: flex;

            flex-direction: column;

            align-items: center;

            justify-content: center;

            padding: 35px;

            background: #ffffff;

            overflow: hidden;
        }


        /* =========================================================
           DECORATIVE ROUND CIRCLES
        ========================================================= */

        .profile-left::before {
            content: "";

            position: absolute;

            width: 420px;
            height: 420px;

            border: 1px solid rgba(0, 141, 210, 0.12);

            border-radius: 50%;

            top: 42%;
            left: 50%;

            transform:
                translate(-50%, -50%);

            pointer-events: none;
        }


        .profile-left::after {
            content: "";

            position: absolute;

            width: 340px;
            height: 340px;

            border: 1px solid rgba(253, 126, 20, 0.20);

            border-radius: 50%;

            top: 42%;
            left: 50%;

            transform:
                translate(-50%, -50%);

            pointer-events: none;
        }


        /* =========================================================
           ROUND PROFILE IMAGE
        ========================================================= */

        .profile-left img {
            position: relative;

            z-index: 3;

            display: block;

            width: 300px;
            height: 300px;

            max-width: 100%;

            object-fit: cover;

            object-position: center top;

            border-radius: 50%;

            border: 7px solid #ffffff;

            box-shadow:#f28b00;

            background: #ffffff;

            opacity: 0;

            transform:
                translateY(30px)
                scale(0.92);

            transition:
                opacity 0.8s ease,
                transform 0.8s ease;

            will-change: opacity, transform;
        }


        /* =========================================================
           IMAGE APPEAR ANIMATION
        ========================================================= */

        .management-card.show-image .profile-left img {
            opacity: 1;

            transform:
                translateY(0)
                scale(1);
        }


        /* =========================================================
           IMAGE HOVER
        ========================================================= */

        .profile-left img:hover {
            transform: scale(1.03);
        }


        /* =========================================================
           PROFILE INFORMATION
        ========================================================= */

        .profile-info {
            position: relative;

            z-index: 5;

            width: 100%;

            margin-top: 28px;

            text-align: center;

            color: #f28b00;
        }


        /* =========================================================
           LEADERSHIP BADGE
        ========================================================= */

        .profile-label {
            display: inline-flex;

            align-items: center;

            margin-bottom: 9px;

            padding: 6px 14px;

            background: #f4f8fb;

            border: 1px solid #dce8f0;

            border-radius: 30px;

            color: #f28b00;

            font-size: 11px;

            font-weight: 700;

            letter-spacing: 1.2px;

            text-transform: uppercase;
        }


        /* =========================================================
           NAME - BLACK
        ========================================================= */

        .profile-info h3 {
            margin: 0 0 7px;

            color: #f28b00;

            font-size: 27px;

            font-weight: 800;

            line-height: 1.25;

            text-shadow: none;
        }


        /* =========================================================
           DESIGNATION - BLACK
        ========================================================= */

        .profile-designation {
            display: flex;

            justify-content: center;

            align-items: center;

            gap: 8px;

            color: #f28b00;

            font-size: 15px;

            font-weight: 600;
        }


        .profile-designation i {
            color: #ff7a00;

            font-size: 16px;
        }


        /* =========================================================
           RIGHT CONTENT
        ========================================================= */

        .profile-right {
            position: relative;

            z-index: 2;

            height: 620px;

            min-width: 0;

            padding: 42px 55px;

            display: flex;

            flex-direction: column;
        }


        /* =========================================================
           CONTENT HEADER
        ========================================================= */

        .profile-header {
            flex-shrink: 0;

            margin-bottom: 20px;

            padding-bottom: 18px;

            border-bottom: 1px solid #edf1f5;
        }


        .profile-header-label {
            display: flex;

            align-items: center;

            gap: 8px;

            margin-bottom: 8px;

            color: #f28b00;

            font-size: 12px;

            font-weight: 700;

            letter-spacing: 1px;

            text-transform: uppercase;
        }


        .profile-header-label i {
            font-size: 14px;
        }


        .profile-header h2 {
            margin: 0;

            color: #f28b00;

            font-size: 30px;

            font-weight: 800;

            line-height: 1.2;
        }


        .profile-header h2 span {
            color: #f28b00;
        }


        .profile-header .designation {
            margin-top: 7px;

            color: #f28b00;

            font-size: 15px;

            font-weight: 700;
        }


        /* =========================================================
           SCROLLABLE BIO
        ========================================================= */

        .bio-scroll {
            flex: 1;

            min-height: 0;

            overflow-y: auto;

            overflow-x: hidden;

            padding:
                2px
                22px
                5px
                0;

            scrollbar-width: thin;

            scrollbar-color:
                #f28b00
                #edf2f7;
        }


        .bio-scroll::-webkit-scrollbar {
            width: 6px;
        }


        .bio-scroll::-webkit-scrollbar-track {
            background: #edf2f7;

            border-radius: 10px;
        }


        .bio-scroll::-webkit-scrollbar-thumb {
            background: #f28b00;

            border-radius: 10px;
        }


        .bio-scroll::-webkit-scrollbar-thumb:hover {
            background: #006fa8;
        }


        /* =========================================================
           BIO TEXT
        ========================================================= */

        .bio-scroll p {
            margin: 0 0 17px;

            color: #5f6b7a;

            font-size: 15.5px;

            line-height: 1.9;

            text-align: justify;
        }


        .bio-scroll p strong {
            color: #f28b00;

            font-weight: 700;
        }


        /* =========================================================
           QUOTE BOX
        ========================================================= */

        .leader-quote {
            position: relative;

            margin: 0 0 20px;

            padding:
                17px
                22px
                17px
                48px;

            background:
                linear-gradient(
                    135deg,
                    #f1f9fe,
                    #f8fbff
                );

            border-left:
                4px solid #f28b00;

            border-radius: 12px;

            color: #344054;

            font-size: 15px;

            font-weight: 600;

            line-height: 1.7;
        }


        .leader-quote i {
            position: absolute;

            left: 15px;

            top: 17px;

            color: #f28b00;

            font-size: 20px;
        }


        /* =========================================================
           HIGHLIGHT BOX
        ========================================================= */

        .profile-highlight {
            display: grid;

            grid-template-columns:
                repeat(2, minmax(0, 1fr));

            gap: 14px;

            margin-top: 7px;

            margin-bottom: 10px;
        }


        .highlight-item {
            padding: 14px 16px;

            background: #f8fafc;

            border: 1px solid #e8eef5;

            border-radius: 12px;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease;
        }


        .highlight-item:hover {
            transform: translateY(-2px);

            box-shadow:
                0 8px 20px rgba(20, 50, 90, 0.07);
        }


        .highlight-item i {
            margin-right: 7px;

            color: #ff6b00;
        }


        .highlight-item span {
            color: #344054;

            font-size: 13px;

            font-weight: 600;
        }


        /* =========================================================
           TABLET
        ========================================================= */

        @media (max-width: 1100px) {

            .management-card {
                grid-template-columns:
                    330px minmax(0, 1fr);
            }


            .profile-left {
                padding: 25px;
            }


            .profile-left img {
                width: 250px;

                height: 250px;
            }


            .profile-right {
                padding: 35px 38px;
            }


            .profile-header h2 {
                font-size: 31px;
            }

        }


        /* =========================================================
           TABLET / MOBILE
        ========================================================= */

        @media (max-width: 991px) {

            .management-page {
                padding: 30px 0 45px;
            }


            .management-heading {
                padding: 0 15px;
            }


            .management-heading-inner {
                padding: 25px;
            }


            .management-heading h1 {
                font-size: 28px;
            }


            .management-card {

                grid-template-columns: 1fr;

                width: calc(100% - 30px);

                height: auto;

                margin-bottom: 25px;
            }


            .profile-left {

                height: 480px;

                min-height: 480px;
            }


            .profile-left img {

                width: 285px;

                height: 285px;
            }


            .profile-right {

                height: 540px;

                padding: 32px 30px;
            }


            .profile-header h2 {

                font-size: 30px;
            }

        }


        /* =========================================================
           SMALL MOBILE
        ========================================================= */

        @media (max-width: 575px) {

            .management-page {
                padding-top: 20px;
            }


            .management-page::before {

                width: 430px;

                height: 430px;

                opacity: 0.028;
            }


            .management-page::after {

                width: 300px;

                height: 300px;

                left: -130px;
            }


            .management-heading {

                padding: 0 10px;

                margin-bottom: 20px;
            }


            .management-heading-inner {

                padding: 20px 18px;

                border-radius: 16px;
            }


            .management-heading h1 {

                font-size: 24px;
            }


            .management-heading p {

                font-size: 14px;

                line-height: 1.7;

                text-align: left;
            }


            .management-card {

                width: calc(100% - 20px);

                margin-left: 10px;

                margin-right: 10px;

                border-radius: 18px;
            }


            .profile-left {

                height: 420px;

                min-height: 420px;

                padding: 20px;
            }


            .profile-left::before {

                width: 330px;

                height: 330px;
            }


            .profile-left::after {

                width: 285px;

                height: 285px;
            }


            .profile-left img {

                width: 220px;

                height: 220px;

                border-width: 6px;
            }


            .profile-info {

                margin-top: 20px;
            }


            .profile-info h3 {

                font-size: 22px;
            }


            .profile-designation {

                font-size: 13px;
            }


            .profile-right {

                height: 500px;

                padding: 25px 20px;
            }


            .profile-header {

                margin-bottom: 15px;

                padding-bottom: 14px;
            }


            .profile-header h2 {

                font-size: 25px;
            }


            .profile-header .designation {

                font-size: 14px;
            }


            .bio-scroll {

                padding-right: 10px;
            }


            .bio-scroll p {

                font-size: 14px;

                line-height: 1.75;

                text-align: left;
            }


            .leader-quote {

                padding:
                    14px
                    14px
                    14px
                    40px;

                font-size: 13px;
            }


            .profile-highlight {

                grid-template-columns: 1fr;

                gap: 10px;
            }


            .highlight-item {

                padding: 12px 14px;
            }

        }

    </style>


    <!-- =========================================================
         IMAGE FIRST TIME SCROLL ANIMATION
    ========================================================= -->

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const cards =
                document.querySelectorAll(".management-card");


            if (!("IntersectionObserver" in window)) {

                cards.forEach(function (card) {

                    card.classList.add("show-image");

                });

                return;
            }


            const observer = new IntersectionObserver(

                function (entries) {

                    entries.forEach(function (entry) {

                        if (entry.isIntersecting) {

                            entry.target.classList.add(
                                "show-image"
                            );


                            observer.unobserve(
                                entry.target
                            );

                        }

                    });

                },

                {
                    threshold: 0.20
                }

            );


            cards.forEach(function (card) {

                observer.observe(card);

            });

        });

    </script>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <section class="management-page">


        <!-- =====================================================
             PAGE INTRO
        ====================================================== -->

        <div class="management-heading">

            <div class="management-heading-inner">

                <div class="small-title">

                    <i class="fas fa-users"></i>

                    Meet Our Management

                </div>


               <%-- <h1>
                     <span></span>
                </h1>--%>


                <p>
                    At Asclepius Wellness, our management is the driving force behind the Company’s vision, values, and continued growth.
                </p>


                <p>
                    Led by experienced and visionary leadership, the management team provides strategic direction while ensuring that the organisation remains committed to quality, innovation, ethical business practices, and long-term value creation.
                </p>


                <p>
                    With a clear understanding of the wellness industry and a strong focus on people, our leadership continuously works towards building a sustainable organisation, strengthening our business network, and creating meaningful opportunities for growth.
                </p>


                <p>
                    Our Managing Director and Director play a pivotal role in shaping the Company’s future, guiding its strategic initiatives, and maintaining a culture built on trust, responsibility, transparency, and excellence.
                </p>


                <p>
                    Together, they lead Asclepius Wellness with a shared vision — to build a trusted wellness organisation that positively impacts lives and continues to grow with purpose.
                </p>

            </div>

        </div>


        <!-- =====================================================
             CEO CARD
        ====================================================== -->

        <div class="management-card">


            <!-- LEFT IMAGE -->

            <div class="profile-left">

                <img src="Images/Sanjeevsir1.jpeg"
                     alt="Mr. Sanjeev Kumar" />


                <div class="profile-info">

                    <div class="profile-label">
                        Leadership
                    </div>


                    <h3>
                        Dr. Sanjeev Kumar
                    </h3>


                    <div class="profile-designation">

                        <i class="fas fa-crown"></i>

                        MD &amp; CEO

                    </div>

                </div>

            </div>


            <!-- RIGHT CONTENT -->

            <div class="profile-right">


                <div class="profile-header">

                    <div class="profile-header-label">

                        <i class="fas fa-user-tie"></i>

                        Leadership Profile

                    </div>


                    <h2>
                        Dr. Sanjeev <span>Kumar</span>
                    </h2>


                    <div class="designation">
                        MD &amp; CEO
                    </div>

                </div>


                <!-- SCROLLABLE BIO -->

                <div class="bio-scroll">


                    <div class="leader-quote">

                        <i class="fas fa-quote-left"></i>

                        Strong leadership, clear vision and commitment
                        are the foundation of sustainable growth and
                        long-term success.

                    </div>


                    <p>

                        <strong>Dr. Sanjeev Kumar</strong> and brought up in Modinagar, Ghaziabad, Mr. Sanjeev Kumar completed his schooling and higher education in Ghaziabad. He started his professional career by serving in the Indian Army, during which he was stationed at border areas on several occasions. After serving in the Indian Army for approximately 16 years, he took retirement and subsequently pursued other professional opportunities with the objective of contributing to society and the business community.

                    </p>


                    <p>

                        He spent approximately three years in direct marketing and built a direct-selling team comprising “millions of People”. Recognising his dedication and leadership, many people looked to him for guidance and mentorship. He was impressed by the potential of direct marketing to provide individuals with opportunities to develop entrepreneurial skills and pursue financial independence through legitimate business activities.

                    </p>


                    <p>

                        Mr. Kumar also recognised that health concerns, employment challenges and limited economic opportunities can create significant difficulties for individuals and families. Having personally experienced the potential of herbal and wellness products within his family, Mr. Kumar was inspired to pursue his vision of establishing a healthcare and wellness company, Asclepius Wellness Private Limited, engaged in the manufacturing and marketing of ayurvedic, herbal, personal care and food supplement products.

                    </p>


                    <p>

                        Today, our products are used by millions of consumers across India, supported by the Company’s growing distribution and authorised direct-selling network.

                    </p>


                    <p>

                        The Company’s direct-selling model also provides individuals with opportunities to earn income through genuine product sales and business activities, subject to individual effort, actual sales, applicable Company policies and other relevant factors.

                    </p>


                    <p>

                        This reflects his belief in creating meaningful economic opportunities while contributing to a stronger and more empowered society.

                    </p>


                    <div class="profile-highlight">


                        <div class="highlight-item">

                            <i class="fas fa-award"></i>

                            <span>
                                Experienced Leadership
                            </span>

                        </div>


                        <div class="highlight-item">

                            <i class="fas fa-handshake"></i>

                            <span>
                                Customer Trust
                            </span>

                        </div>


                    </div>

                </div>

            </div>

        </div>


        <!-- =====================================================
             DIRECTOR CARD
        ====================================================== -->

        <div class="management-card">


            <!-- LEFT IMAGE -->

            <div class="profile-left">

                <img src="Images/Sanjeevsir.jpg"
                     alt="Mr. Mam Chand Raipuriya" />


                <div class="profile-info">

                    <div class="profile-label">
                        Leadership
                    </div>


                    <h3>
                        Mr. Mam Chand Raipuriya
                    </h3>


                    <div class="profile-designation">

                        <i class="fas fa-user-tie"></i>

                        Director

                    </div>

                </div>

            </div>


            <!-- RIGHT CONTENT -->

            <div class="profile-right">


                <div class="profile-header">

                    <div class="profile-header-label">

                        <i class="fas fa-user-tie"></i>

                        Leadership Profile

                    </div>


                    <h2>
                        Mr. Mam Chand <span>Raipuriya</span>
                    </h2>


                    <div class="designation">
                        Director
                    </div>

                </div>


                <!-- SCROLLABLE BIO -->

                <div class="bio-scroll">


                    <div class="leader-quote">

                        <i class="fas fa-quote-left"></i>

                        Building strong relationships and maintaining
                        transparency are essential for creating lasting
                        value and trust.

                    </div>


                    <p>

                        <strong>Mr. Raipuriya</strong> was born and brought up in Alwar, Rajasthan. He completed his schooling and higher education in Alwar and holds an MBA from the Symbiosis Institute of International Business.

                    </p>


                    <p>

                        He started his professional career by serving in the Indian Navy, where he worked in administration and finance for approximately 20 years. He subsequently gained approximately seven years of experience in sales and marketing.

                    </p>


                    <p>

                        In 2014, he decided to apply his extensive knowledge and experience in finance and marketing towards building and contributing to a business venture with a meaningful purpose.

                    </p>


                    <p>

                        Mr. Raipuriya brings extensive experience from his service in the Indian Navy, particularly in administration and finance. He has contributed significantly to strengthening the Company’s operational systems and processes.

                    </p>


                    <p>

                        He continues to contribute new ideas and initiatives aimed at improving the Company’s operational systems, accessibility and user experience.

                    </p>


                    <p>

                        He continues to bring new practices and ideas to support the training and development of the sales, marketing and research &amp; development teams, drawing on his professional knowledge and experience.

                    </p>


                    <div class="profile-highlight">


                        <div class="highlight-item">

                            <i class="fas fa-chart-line"></i>

                            <span>
                                Business Development
                            </span>

                        </div>


                        <div class="highlight-item">

                            <i class="fas fa-users"></i>

                            <span>
                                Strong Relationships
                            </span>

                        </div>


                    </div>

                </div>

            </div>

        </div>


        <!-- =====================================================
             MANAGEMENT & COMPLIANCE
        ====================================================== -->

        <div class="management-heading">

            <div class="management-heading-inner">

                <div class="small-title">

                    <i class="fas fa-users"></i>

                    <strong>
                        Management &amp; Compliance Commitment
                    </strong>

                </div>


                <p>

                    The management of Asclepius Wellness is committed to responsible business practices, consumer protection, accurate product communication, quality and compliance with applicable laws and regulatory requirements.

                </p>


                <p>

                    Information concerning products, health benefits, income opportunities, qualifications, experience and other objectively verifiable matters should be supported by appropriate records and presented in accordance with applicable requirements.

                </p>

            </div>

        </div>


    </section>

</asp:Content>