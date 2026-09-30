<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Vidyakendraa.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* ==============================
           FAQ PAGE
        ============================== */

        .faq-page {
            font-family: 'Segoe UI', sans-serif;
            background: #f7f9fc;
            padding: 30px 0 70px;
        }

        /* HERO */

        .faq-hero {
            position: relative;
            overflow: hidden;
            border-radius: 18px;
            padding: 38px 30px;
            text-align: center;
            color: #fff;
            background: linear-gradient(135deg, #0d6efd, #00a8e8);
            margin-bottom: 45px;
        }

        .faq-hero::before {
            content: "";
            position: absolute;
            width: 280px;
            height: 280px;
            border-radius: 50%;
            background: rgba(255,255,255,.10);
            right: -80px;
            top: -100px;
        }

        .faq-hero::after {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255,255,255,.08);
            left: -60px;
            bottom: -80px;
        }

        .faq-hero-content {
            position: relative;
            z-index: 2;
        }

        .faq-hero h1 {
            font-size: 38px;
            font-weight: 800;
            margin: 0 0 10px;
        }

        .faq-hero p {
            max-width: 700px;
            margin: auto;
            font-size: 16px;
            line-height: 1.8;
            opacity: .95;
        }


        /* ==============================
           MAIN FAQ LAYOUT
        ============================== */

        .faq-main-row {
            display: grid;
            grid-template-columns: 380px 1fr;
            gap: 40px;
            align-items: start;
        }


        /* ==============================
           LEFT FAQ IMAGE
        ============================== */

        .faq-left {
            position: sticky;
            top: 100px;
        }

        .faq-image-card {
            position: relative;
            overflow: hidden;
            border-radius: 22px;
            background: #fff;
            box-shadow: 0 12px 35px rgba(0,0,0,.10);
        }

        .faq-image {
            width: 100%;
            height: 430px;
            object-fit: cover;
            display: block;
        }

        .faq-image-overlay {
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            padding: 35px 25px 25px;
            color: #fff;
            background: linear-gradient(
                transparent,
                rgba(13,43,77,.95)
            );
        }

        .faq-image-overlay h3 {
            font-size: 25px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .faq-image-overlay p {
            margin: 0;
            font-size: 14px;
            line-height: 1.7;
            opacity: .92;
        }


        /* ==============================
           FAQ RIGHT SIDE
        ============================== */

        .faq-right {
            min-width: 0;
        }

        .faq-title {
            margin-bottom: 25px;
        }

        .faq-title span {
            color: #0d6efd;
            font-size: 13px;
            font-weight: 800;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .faq-title h2 {
            color: #172b4d;
            font-size: 34px;
            font-weight: 800;
            margin: 7px 0;
        }

        .faq-title p {
            color: #667085;
            margin: 0;
            line-height: 1.7;
        }


        /* SEARCH */

        .faq-search-box {
            background: #fff;
            padding: 7px;
            border-radius: 50px;
            box-shadow: 0 8px 25px rgba(0,0,0,.08);
            display: flex;
            align-items: center;
            margin-bottom: 25px;
            border: 1px solid #e8edf4;
        }

        .faq-search-box i {
            color: #0d6efd;
            font-size: 17px;
            margin-left: 18px;
        }

        .faq-search-box input {
            border: none;
            outline: none;
            width: 100%;
            padding: 13px 15px;
            font-size: 15px;
            border-radius: 50px;
        }


        /* ==============================
           ACCORDION
        ============================== */

        .faq-list {
            width: 100%;
        }

        .faq-item {
            background: #fff;
            border-radius: 15px;
            margin-bottom: 12px;
            border: 1px solid #e6ebf2;
            overflow: hidden;
            transition: .3s;
        }

        .faq-item:hover {
            box-shadow: 0 8px 25px rgba(13,110,253,.08);
            border-color: #cdddf7;
        }

        .faq-question {
            padding: 19px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
            color: #172b4d;
            font-size: 15px;
            font-weight: 700;
            gap: 15px;
        }

        .faq-question span {
            padding-right: 10px;
        }

        .faq-question i {
            color: #0d6efd;
            transition: .3s;
            min-width: 20px;
            text-align: center;
        }

        .faq-answer {
            display: none;
            padding: 0 20px 20px;
            color: #667085;
            font-size: 14px;
            line-height: 1.8;
        }

        .faq-item.active {
            border-color: #bcd4f8;
            box-shadow: 0 8px 25px rgba(13,110,253,.08);
        }

        .faq-item.active .faq-answer {
            display: block;
        }

        .faq-item.active .faq-question {
            color: #0d6efd;
        }

        .faq-item.active .faq-question i {
            transform: rotate(180deg);
        }


        /* ==============================
           CONTACT
        ============================== */

        .faq-contact {
            margin-top: 25px;
            padding: 28px;
            border-radius: 18px;
            background: linear-gradient(135deg, #172b4d, #0d6efd);
            color: #fff;
            text-align: center;
        }

        .faq-contact h3 {
            font-size: 23px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .faq-contact p {
            opacity: .9;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .faq-contact-btn {
            display: inline-block;
            background: #fff;
            color: #0d6efd;
            padding: 11px 23px;
            border-radius: 30px;
            text-decoration: none;
            font-weight: 700;
            transition: .3s;
        }

        .faq-contact-btn:hover {
            color: #0d6efd;
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0,0,0,.2);
        }


        /* ==============================
           MOBILE
        ============================== */

        @media(max-width: 991px) {

            .faq-main-row {
                grid-template-columns: 1fr;
                gap: 30px;
            }

            .faq-left {
                position: relative;
                top: auto;
            }

            .faq-image {
                height: 300px;
            }

        }


        @media(max-width: 768px) {

            .faq-page {
                padding: 15px 0 50px;
            }

            .faq-hero {
                border-radius: 15px;
                padding: 35px 20px;
            }

            .faq-hero h1 {
                font-size: 30px;
            }

            .faq-hero p {
                font-size: 14px;
            }

            .faq-image {
                height: 260px;
            }

            .faq-title h2 {
                font-size: 28px;
            }

            .faq-question {
                padding: 17px;
                font-size: 14px;
            }

            .faq-answer {
                padding: 0 17px 17px;
                font-size: 14px;
            }

        }

    </style>


    <script>

        function toggleFAQ(element) {

            var item = element.parentElement;

            var allItems =
                document.querySelectorAll('.faq-item');

            allItems.forEach(function (faq) {

                if (faq !== item) {
                    faq.classList.remove('active');
                }

            });

            item.classList.toggle('active');
        }


        function searchFAQ() {

            var input =
                document.getElementById("faqSearch");

            var filter =
                input.value.toLowerCase();

            var items =
                document.querySelectorAll(".faq-item");

            items.forEach(function (item) {

                var text =
                    item.innerText.toLowerCase();

                if (text.indexOf(filter) > -1) {
                    item.style.display = "";
                }
                else {
                    item.style.display = "none";
                }

            });

        }

    </script>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">

    <div class="faq-page">

        <div class="container">

            <!-- HERO -->

            <section class="faq-hero">

                <div class="faq-hero-content">

                    <h1>
                        Frequently Asked Questions
                    </h1>

                    <p>
                        Find answers to common questions about
                        Asclepius Wellness, our products, quality,
                        business opportunities and mission.
                    </p>

                </div>

            </section>


            <!-- TWO COLUMN -->

            <div class="faq-main-row">


                <!-- =========================
                     LEFT SIDE IMAGE
                ========================== -->

                <div class="faq-left">
                    <div class="faq-image-card">
                        <img src="images/faq.jpeg"  alt="Asclepius Wellness FAQ" class="faq-image" />
                        <div class="faq-image-overlay">
                            <h3>
                                Have Questions?
                            </h3>
                            <p>
                                Find quick and useful answers about
                                Asclepius Wellness products, quality,
                                business opportunities and our mission.
                            </p>
                        </div>
                    </div>
                </div>



                <!-- =========================
                     RIGHT SIDE FAQ
                ========================== -->

                <div class="faq-right">
                    <div class="faq-title">
                        <span>
                            KNOW MORE
                        </span>
                        <h2>
                            Frequently Asked Questions
                        </h2>
                        <p>
                            Explore the answers to the most common
                            questions about Asclepius Wellness.
                        </p>
                    </div>


                    <!-- SEARCH -->

                    <div class="faq-search-box">
                        <i class="fas fa-search"></i>
                        <input type="text" id="faqSearch" placeholder="Search your question..."
                               onkeyup="searchFAQ()" />
                    </div>

                    <!-- FAQ LIST -->

                    <div class="faq-list">
                        <!-- FAQ 1 -->
                        <div class="faq-item">
                            <div class="faq-question"  onclick="toggleFAQ(this)">
                                <span>
                                    What is Asclepius Wellness?
                                </span>
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="faq-answer">
                                Asclepius Wellness is a direct selling company in India formed in 2014, specializing in offering premium wellness, personal care, food supplements, home care, and agricultural products made from scientifically formulated and nature-based ingredients.
                             </div>
                        </div>



                        <!-- FAQ 2 -->

                        <div class="faq-item">
                            <div class="faq-question" onclick="toggleFAQ(this)">
                                <span>
                                    What kind of products does Asclepius Wellness sell?
                                </span>
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="faq-answer">
                                We sell a wide array of health supplements, basic needs, beauty care, hair care, oral care, home care, and agricultural products, which have been manufactured from the best quality materials and production process.

                            </div>
                        </div>

                        <!-- FAQ 3 -->

                        <div class="faq-item">
                            <div class="faq-question"  onclick="toggleFAQ(this)">
                                <span>
                                    Why should I buy Asclepius Wellness products?
                                </span>
                                <i class="fas fa-chevron-down"></i>
                            </div>
                            <div class="faq-answer">
                                Our products are inspired by Ayurveda and scientific research and are manufactured using the finest quality material and manufacturing process.

                            </div>
                        </div>



                        <!-- FAQ 4 -->

                        <div class="faq-item">
                            <div class="faq-question" onclick="toggleFAQ(this)">

                                <span>
                                    Do Asclepius Wellness products undergo quality testing?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Yes. All our products go through various quality tests for purity and safety from our scientifically advanced manufacturing process.

                            </div>

                        </div>



                        <!-- FAQ 5 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    Is Asclepius Wellness a direct selling company?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Yes, Asclepius Wellness is an established direct selling company, giving people the chance to have access to quality products and business prospects that are guided by proper policies and training.

                            </div>

                        </div>



                        <!-- FAQ 6 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    Can I form my own business through Asclepius Wellness?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Yes, we offer you a clear-cut business process, marketing assistance, and other support services so that you can earn a decent income while selling quality wellness products.

                            </div>

                        </div>



                        <!-- FAQ 7 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    How are your products different from other companies' products?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                We manufacture high-quality products that are made of selected ingredients, scientifically formulated and controlled for consistency of performance and quality.

                            </div>

                        </div>



                        <!-- FAQ 8 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    Can your products be used on a daily basis?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Some of our wellness and skin care products are manufactured to be used on a regular basis.

                            </div>

                        </div>



                        <!-- FAQ 9 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    What are the ways Asclepius Wellness uses to make sure that its customers are satisfied?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                The company focuses on quality, transparency, efficient customer service, ethical behavior, and continuous improvement of products in order to provide satisfaction and build trust with each of its customers.

                            </div>

                        </div>



                        <!-- FAQ 10 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    What is the mission of Asclepius Wellness?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Our mission consists in advocating healthier lifestyles by providing quality wellness products along with creating jobs, helping entrepreneurs succeed, and making a positive contribution to society.

                            </div>

                        </div>



                        <!-- FAQ 11 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    Who can use Asclepius Wellness products?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Asclepius Wellness products are created for adults who are interested in leading a healthy life. Please, always carefully read product labels and ask your doctor if necessary.

                            </div>

                        </div>



                        <!-- FAQ 12 -->

                        <div class="faq-item">

                            <div class="faq-question"
                                 onclick="toggleFAQ(this)">

                                <span>
                                    Does Asclepius Wellness conduct its business ethically?
                                </span>

                                <i class="fas fa-chevron-down"></i>

                            </div>

                            <div class="faq-answer">

                                Yes. Since 2014, we have remained committed to ethical direct selling practices, transparency, customer satisfaction, regulatory compliance, and creating genuine business opportunities for our growing community.

                            </div>

                        </div>


                    </div>



                    <!-- CONTACT -->

                    <div class="faq-contact">

                        <h3>
                            Still Have a Question?
                        </h3>

                        <p>
                            Our support team is here to help you with your
                            questions and concerns.
                        </p>

                        <a href="ContactUs.aspx"
                           class="faq-contact-btn">

                            Contact Us

                            <i class="fas fa-arrow-right ms-2"></i>

                        </a>

                    </div>


                </div>

            </div>

        </div>

    </div>

</asp:Content>
