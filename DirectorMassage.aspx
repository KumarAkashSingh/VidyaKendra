<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="DirectorMassage.aspx.cs" Inherits="Vidyakendraa.DirectorMassage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

/* =========================================================
   EXECUTIVE LEADERSHIP - DIFFERENT CORPORATE DESIGN
========================================================= */

.director-page {
    position: relative;
    padding: 70px 25px;
    background: #f4f7fa;
    overflow: hidden;
    font-family: "Segoe UI", Arial, sans-serif;
}


/* =========================================================
   BACKGROUND
========================================================= */

.director-page::before {
    content: "LEADERSHIP";

    position: absolute;

    right: -90px;
    top: 180px;

    font-size: 120px;
    font-weight: 900;

    letter-spacing: 8px;

    color: rgba(0,141,210,0.025);

    transform: rotate(90deg);

    pointer-events: none;
}


/* =========================================================
   MAIN WRAPPER
========================================================= */

.director-container {
    position: relative;

    max-width: 1450px;

    margin: auto;
}


/* =========================================================
   MAIN LAYOUT
========================================================= */

.director-main-card {

    position: relative;

    display: grid;

    grid-template-columns: 38% 62%;

    min-height: 680px;

    background: #ffffff;

    border: 1px solid #e3e9ef;

    box-shadow:
        0 30px 80px rgba(12,40,65,0.09);

    overflow: hidden;
}


/* =========================================================
   LEFT PROFILE PANEL
========================================================= */

.director-profile {

    position: relative;

    min-height: 680px;

    padding: 45px;

    display: flex;

    flex-direction: column;

    justify-content: space-between;

    background: #f4f4f400;

    overflow: hidden;
}


/* Decorative line */

.director-profile::before {

    content: "";

    position: absolute;

    width: 420px;
    height: 420px;

    right: -250px;
    top: -170px;

    border-radius: 50%;

    border: 1px solid rgba(255,255,255,0.10);
}


.director-profile::after {

    content: "";

    position: absolute;

    width: 280px;
    height: 280px;

    left: -170px;
    bottom: -120px;

    border-radius: 50%;

    border: 1px solid rgba(253,126,20,0.22);
}


/* =========================================================
   TOP NUMBER
========================================================= */

.profile-number {

    position: relative;

    z-index: 5;

    color: rgba(255,255,255,0.45);

    font-size: 11px;

    font-weight: 700;

    letter-spacing: 3px;
}


.profile-number span {

    color: #fd7e14;

    font-size: 20px;

    margin-right: 8px;
}


/* =========================================================
   IMAGE AREA
========================================================= */

.profile-image-area {

    position: relative;

    display: flex;

    align-items: center;

    justify-content: center;

    height: 410px;

    z-index: 3;
}


/* Outer orbit */

.profile-orbit {

    position: absolute;

    width: 360px;
    height: 360px;

    border-radius: 50%;

    border: 1px solid rgba(255,255,255,0.18);

    transform: rotate(-18deg);
}


/* Orange orbit */

.profile-orbit::after {

    content: "";

    position: absolute;

    width: 9px;
    height: 9px;

    right: 25px;
    top: 55px;

    border-radius: 50%;

    background: #fd7e14;

    box-shadow:
        0 0 0 7px rgba(253,126,20,0.12);
}


/* =========================================================
   CIRCULAR PHOTO
========================================================= */

.profile-image {

    position: relative;

    width: 305px;
    height: 305px;

    border-radius: 50%;

    padding: 6px;

    background: linear-gradient(
        135deg,
        #ffffff 0%,
        #f28b00 55%,
        #fd7e14 100%
    );

    box-shadow:
        0 30px 55px rgba(0,0,0,0.32);

    z-index: 4;

    animation: profileJump 1s cubic-bezier(.2,.8,.2,1);
}


.profile-image-inner {

    width: 100%;
    height: 100%;

    border-radius: 50%;

    overflow: hidden;

    background: #ffffff;

    border: 5px solid #ffffff;
}


.profile-image-inner img {

    width: 100%;
    height: 100%;

    object-fit: cover;

    object-position: center top;

    border-radius: 50%;

    display: block;

    transition: transform .7s ease;
}


.profile-image:hover img {

    transform: scale(1.06);
}


/* =========================================================
   IMAGE ANIMATION
========================================================= */

@keyframes profileJump {

    0% {
        opacity: 0;
        transform:
            translateY(90px)
            scale(.78);
    }

    55% {
        opacity: 1;
        transform:
            translateY(-12px)
            scale(1.04);
    }

    75% {
        transform:
            translateY(5px)
            scale(.98);
    }

    100% {
        opacity: 1;
        transform:
            translateY(0)
            scale(1);
    }
}


/* =========================================================
   PROFILE IDENTITY
========================================================= */

.profile-identity {

    position: relative;

    z-index: 5;

    padding-top: 15px;

    border-top: 1px solid rgba(255,255,255,0.16);
}


.identity-label {

    color: #fd7e14;

    font-size: 9px;

    font-weight: 800;

    letter-spacing: 2px;

    text-transform: uppercase;

    margin-bottom: 8px;
}


.identity-name {

    margin: 0;

    color: #0f0202;

    font-size: 28px;

    line-height: 1.2;

    font-weight: 700;
}


.identity-designation {

    margin-top: 8px;

    color: #0f0202;

    font-size: 12px;

    font-weight: 500;
}


/* =========================================================
   RIGHT MESSAGE AREA
========================================================= */

.director-message {

    position: relative;

    padding: 55px 7px;

    min-height: 680px;

    display: flex;

    flex-direction: column;

    overflow: hidden;
}


/* watermark */

.director-message::after {

    content: "";

    position: absolute;

    width: 430px;
    height: 430px;

    right: -160px;
    bottom: -170px;

    background-image: url('Images/logo.png');

    background-repeat: no-repeat;

    background-position: center;

    background-size: contain;

    opacity: .025;

    pointer-events: none;
}


/* =========================================================
   TOP LABEL
========================================================= */

.message-top {

    display: flex;

    align-items: center;

    gap: 15px;

    margin-bottom: 18px;
}


.message-index {

    color: #fd7e14;

    font-size: 12px;

    font-weight: 800;

    letter-spacing: 2px;
}


.message-line {

    width: 45px;
    height: 1px;

    background: #d7e0e8;
}


.message-category {

    color: #fd7e14;

    font-size: 10px;

    font-weight: 800;

    letter-spacing: 2px;

    text-transform: uppercase;
}


/* =========================================================
   HEADING
========================================================= */

.message-heading {

    margin: 0;

    color: #0c2742;

    font-size: 43px;

    line-height: 1.1;

    font-weight: 700;

    letter-spacing: -1.5px;
}


.message-heading span {

    color: #fd7e14;
}


/* =========================================================
   SUBTITLE
========================================================= */

.message-subtitle {

    margin-top: 12px;

    color: #788797;

    font-size: 15px;

    font-weight: 500;
}


/* =========================================================
   BIG QUOTE
========================================================= */

.opening-quote {

    position: relative;

    margin: 30px 0 20px;

    padding-left: 48px;
}


.opening-quote::before {

    content: "“";

    position: absolute;

    left: 0;
    top: -17px;

    color: #fd7e14;

    font-family: Georgia, serif;

    font-size: 70px;

    line-height: 1;
}


.opening-quote p {

    margin: 0;

    color: #33495f;

    font-size: 16px;

    line-height: 1.7;

    font-weight: 600;
}


/* =========================================================
   MESSAGE SCROLL
========================================================= */

.message-scroll {

    height: 320px;

    overflow-y: auto;

    overflow-x: hidden;

    padding-right: 20px;

    color: #596a7b;

    font-size: 14px;

    line-height: 1.9;

    scrollbar-width: thin;

    scrollbar-color:
        #f28b00
        #edf1f5;
}


.message-scroll::-webkit-scrollbar {
    width: 5px;
}


.message-scroll::-webkit-scrollbar-track {
    background: #edf1f5;
}


.message-scroll::-webkit-scrollbar-thumb {

    background: #f28b00;

    border-radius: 10px;
}


.message-scroll p {

    margin: 0 0 15px;
}


.message-scroll strong {

    color: #102c47;

    font-weight: 700;
}


/* =========================================================
   BOTTOM SIGNATURE
========================================================= */

.message-footer {

    margin-top: auto;

    padding-top: 18px;

    border-top: 1px solid #e7edf2;

    display: flex;

    justify-content: space-between;

    align-items: flex-end;
}


.signature-name {

    color: #102c47;

    font-size: 18px;

    font-weight: 700;
}


.signature-role {

    margin-top: 4px;

    color: #fd7e14;

    font-size: 10px;

    font-weight: 800;

    letter-spacing: 1.3px;

    text-transform: uppercase;
}


.footer-mark {

    width: 42px;
    height: 3px;

    background: #fd7e14;
}


/* =========================================================
   TABLET
========================================================= */

@media (max-width: 1100px) {

    .director-main-card {

        grid-template-columns: 40% 60%;
    }


    .director-profile {

        padding: 35px;
    }


    .profile-image {

        width: 260px;
        height: 260px;
    }


    .profile-orbit {

        width: 315px;
        height: 315px;
    }


    .director-message {

        padding: 45px;
    }


    .message-heading {

        font-size: 35px;
    }

}


/* =========================================================
   MOBILE
========================================================= */

@media (max-width: 991px) {

    .director-page {

        padding: 40px 15px 60px;
    }


    .director-main-card {

        grid-template-columns: 1fr;
    }


    .director-profile {

        min-height: 570px;

        height: 570px;

        padding: 30px;
    }


    .profile-image-area {

        height: 350px;
    }


    .director-message {

        min-height: auto;

        padding: 45px 35px;
    }


    .message-scroll {

        height: 350px;
    }

}


/* =========================================================
   SMALL MOBILE
========================================================= */

@media (max-width: 575px) {

    .director-page {

        padding: 25px 10px 45px;
    }


    .director-profile {

        min-height: 500px;

        height: 500px;

        padding: 22px;
    }


    .profile-image-area {

        height: 310px;
    }


    .profile-image {

        width: 220px;
        height: 220px;
    }


    .profile-orbit {

        width: 265px;
        height: 265px;
    }


    .identity-name {

        font-size: 23px;
    }


    .director-message {

        padding: 32px 20px 35px;
    }


    .message-heading {

        font-size: 30px;
    }


    .opening-quote {

        padding-left: 38px;

        margin-top: 25px;
    }


    .opening-quote p {

        font-size: 14px;
    }


    .message-scroll {

        height: 320px;

        font-size: 13px;

        line-height: 1.8;

        padding-right: 12px;
    }

}

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<section class="director-page">

    <div class="director-container">

        <div class="director-main-card">


            <!-- =================================================
                 LEFT EXECUTIVE PROFILE
            ================================================= -->

            <div class="director-profile">


                <%--<div class="profile-number">

                    <span>01</span>

                    LEADERSHIP

                </div>--%>


                <div class="profile-image-area">

                    <div class="profile-orbit"></div>


                    <div class="profile-image">

                        <div class="profile-image-inner">

                            <img
                                src="Images/Sanjeevsir1.jpeg"
                                alt="Dr. Sanjeev Kumar"
                                loading="eager"
                                fetchpriority="high" />

                        </div>

                    </div>

                </div>


                <div class="profile-identity">

                    <div class="identity-label">
                        Executive Leadership
                    </div>


                    <h2 class="identity-name">

                        <asp:Label
                            ID="lblDirectorName"
                            runat="server"
                            Text="Dr. Sanjeev Kumar">
                        </asp:Label>

                    </h2>


                    <div class="identity-designation">

                        <asp:Label
                            ID="lblDesignation"
                            runat="server"
                            Text="MD &amp; CEO">
                        </asp:Label>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 RIGHT MESSAGE
            ================================================= -->

            <div class="director-message">


                <div class="message-top">
                    <span class="message-category">
                        Leadership Message
                    </span>
                </div>

                <h1 class="message-heading">
                    <asp:Label  ID="lblTitle" runat="server"  Text="Director's Message">
                    </asp:Label>
                </h1>

                <div class="message-subtitle">
                    <asp:Label
                        ID="lblSubTitle"
                        runat="server"
                        Text="Welcome To Our Organization">
                    </asp:Label>
                </div>
                <div class="opening-quote">

                    <p>
                        Building a healthier, stronger and more prosperous
                        future through people, purpose and progress.
                    </p>

                </div>


                <div class="message-scroll">
                    <p>
                        <strong>Great Day,</strong>
                    </p>

                    <p>
                        It gives me immense pleasure to welcome you to Asclepius Wellness.
                    </p>

                    <p>
                        When we began this journey, our vision was clear — to build an organization that goes beyond business and creates a meaningful difference in people’s lives through wellness, opportunity, and empowerment.
                    </p>

                    <p>
                        At Asclepius Wellness, we believe that good health is the foundation of a better life. This belief inspires us to continuously work towards offering high-quality wellness products while maintaining strong standards of quality, innovation, and responsibility.
                    </p>

                    <p>
                        However, our journey is not defined by products alone. It is defined by people — the individuals and families who trust us, the dedicated team that works behind the organization, and our Direct Sellers who carry our vision across the country. Their trust and commitment have been instrumental in shaping Asclepius Wellness into what it is today.
                    </p>


                    <p>
                        As we move forward, our focus remains on continuous improvement, responsible growth, stronger systems, and creating opportunities that enable people to progress with confidence and dignity.
                    </p>

                    <p>
                        For me, success is not measured only by how much an organization grows, but by how many lives it is able to positively impact along the way.
                    </p>

                    <p>
                        With the continued trust and support of the entire Asclepius family, I am confident that we will keep moving forward, reaching new milestones and building an organization that stands for Health, Prosperity, Trust, and Progress.
                    </p>


                    <p>
                        Together, let us continue this journey towards a healthier and more prosperous future.
                    </p>

                    <div>
                    <p>
                        <strong>Dr. Sanjeev Kumar</strong>
                        
                    </p>


                    <p>
                        <strong>MD &amp; CEO</strong> 
                    </p>


                    <p>
                        <strong>Asclepius Wellness Pvt. Ltd.</strong> 
                    </p>
                        </div>

                </div>
            </div>
        </div>
    </div>

</section>

</asp:Content>