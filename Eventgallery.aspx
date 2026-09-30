<%@ Page Title="" Language="C#" MasterPageFile="~/vidya.Master" AutoEventWireup="true" CodeBehind="Eventgallery.aspx.cs" Inherits="Vidyakendraa.Eventgallery" %>
<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        /* =========================================================
           AWPL EVENT ALBUM GALLERY
           ========================================================= */

        .mnc-gallery {
            position: relative;
            width: 100%;
            padding: 55px 0 80px;
            background: #f5f8fc;
            overflow: hidden;
            font-family: 'Segoe UI', Arial, sans-serif;
        }


        /* Background Design */

        .mnc-gallery::before {
            content: "";
            position: absolute;

            width: 650px;
            height: 650px;

            top: -300px;
            right: -250px;

            border: 1px solid rgba(0,141,210,0.08);
            border-radius: 50%;

            pointer-events: none;
        }


        .mnc-gallery::after {
            content: "";

            position: absolute;

            width: 500px;
            height: 500px;

            bottom: -270px;
            left: -220px;

            border: 1px solid rgba(253,126,20,0.08);
            border-radius: 50%;

            pointer-events: none;
        }


        /* =========================================================
           HEADER
           ========================================================= */

        .gallery-header {
            position: relative;
            z-index: 2;

            max-width: 900px;

            margin: 0 auto 45px;

            padding: 0 20px;

            text-align: center;
        }


        .gallery-small-title {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            gap: 8px;

            margin-bottom: 10px;

            color: #008dd2;

            font-size: 12px;
            font-weight: 800;

            letter-spacing: 1.7px;

            text-transform: uppercase;
        }


        .gallery-small-title i {
            font-size: 14px;
        }


        .gallery-header h1 {
            margin: 0 0 14px;

            color: #101828;

            font-size: 42px;
            font-weight: 800;

            line-height: 1.2;
        }


        .gallery-header h1 span {
            color: #008dd2;
        }


        .gallery-header p {
            max-width: 780px;

            margin: auto;

            color: #667085;

            font-size: 15px;

            line-height: 1.8;
        }


        .gallery-line {
            width: 70px;
            height: 4px;

            margin: 20px auto 0;

            background: linear-gradient(
                90deg,
                #008dd2,
                #fd7e14
            );

            border-radius: 10px;
        }


        /* =========================================================
           GALLERY CONTAINER
           ========================================================= */

        .gallery-container {
            position: relative;
            z-index: 2;

            width: calc(100% - 50px);

            max-width: 1500px;

            margin: auto;
        }


        .gallery-row {
            display: flex;
            flex-wrap: wrap;
        }


        .gallery-item {
            margin-bottom: 30px;
        }


        /* =========================================================
           EVENT CARD
           ========================================================= */

        .event-card {
            position: relative;

            height: 100%;

            overflow: hidden;

            background: #ffffff;

            border: 1px solid #e4ebf2;

            border-radius: 20px;

            box-shadow:
                0 10px 35px rgba(16,24,40,0.07);

            transition:
                transform .35s ease,
                box-shadow .35s ease,
                border-color .35s ease;
        }


        .event-card:hover {
            transform: translateY(-9px);

            border-color: rgba(0,141,210,.25);

            box-shadow:
                0 22px 50px rgba(16,24,40,.14);
        }


        /* =========================================================
           IMAGE
           ========================================================= */

        .event-image-wrapper {
            position: relative;

            width: 100%;
            height: 315px;

            overflow: hidden;

            background: #eaf1f6;

            cursor: pointer;
        }


        .event-main-img {
            width: 100%;
            height: 100%;

            display: block;

            object-fit: cover;

            transition:
                transform .7s ease;
        }


        .event-card:hover .event-main-img {
            transform: scale(1.08);
        }


        /* Dark Image Overlay */

        .event-image-wrapper::after {
            content: "";

            position: absolute;

            inset: 0;

            background:
                linear-gradient(
                    to bottom,
                    rgba(0,0,0,.02) 35%,
                    rgba(0,0,0,.58) 100%
                );

            pointer-events: none;
        }


        /* =========================================================
           DATE
           ========================================================= */

        .event-date-badge {
            position: absolute;

            top: 17px;
            left: 17px;

            z-index: 5;

            display: flex;

            align-items: center;

            gap: 7px;

            padding: 8px 13px;

            background: rgba(255,255,255,.96);

            border-radius: 30px;

            color: #008dd2;

            font-size: 11px;

            font-weight: 800;

            box-shadow:
                0 5px 18px rgba(0,0,0,.14);
        }


        .event-date-badge i {
            color: #fd7e14;
        }


        /* =========================================================
           PHOTO COUNT
           ========================================================= */

        .photo-count {
            position: absolute;

            right: 17px;
            top: 17px;

            z-index: 5;

            display: flex;

            align-items: center;

            gap: 7px;

            padding: 8px 13px;

            background: rgba(0,0,0,.65);

            backdrop-filter: blur(5px);

            border: 1px solid rgba(255,255,255,.25);

            border-radius: 30px;

            color: #ffffff;

            font-size: 11px;

            font-weight: 700;
        }


        .photo-count i {
            color: #ffffff;
        }


        /* =========================================================
           VIEW ALBUM BUTTON
           ========================================================= */

        .view-album {
            position: absolute;

            left: 50%;
            bottom: 20px;

            z-index: 5;

            transform: translate(-50%, 10px);

            opacity: 0;

            display: inline-flex;

            align-items: center;

            gap: 8px;

            padding: 10px 18px;

            background: #ffffff;

            border-radius: 30px;

            color: #008dd2;

            font-size: 12px;

            font-weight: 800;

            white-space: nowrap;

            box-shadow:
                0 7px 22px rgba(0,0,0,.20);

            transition:
                opacity .3s ease,
                transform .3s ease;
        }


        .event-card:hover .view-album {
            opacity: 1;

            transform:
                translate(-50%, 0);
        }


        .view-album i {
            color: #fd7e14;
        }


        /* =========================================================
           EVENT BODY
           ========================================================= */

        .event-body {
            position: relative;

            padding: 21px 22px 23px;

            background: #ffffff;
        }


        .event-category {
            display: flex;

            align-items: center;

            gap: 7px;

            margin-bottom: 8px;

            color: #008dd2;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1.2px;

            text-transform: uppercase;
        }


        .event-category i {
            color: #fd7e14;

            font-size: 7px;
        }


        .event-body h5 {
            margin: 0;

            color: #101828;

            font-size: 19px;

            font-weight: 750;

            line-height: 1.4;

            transition: color .25s ease;
        }


        .event-card:hover .event-body h5 {
            color: #008dd2;
        }


        .event-bottom {
            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-top: 15px;

            padding-top: 13px;

            border-top: 1px solid #edf1f5;
        }


        .event-open-text {
            color: #667085;

            font-size: 11px;

            font-weight: 600;
        }


        .event-arrow {
            display: flex;

            align-items: center;
            justify-content: center;

            width: 31px;
            height: 31px;

            border-radius: 50%;

            background: #eef8fd;

            color: #008dd2;

            transition:
                background .25s ease,
                color .25s ease,
                transform .25s ease;
        }


        .event-card:hover .event-arrow {
            background: #008dd2;

            color: #ffffff;

            transform: translateX(3px);
        }


        /* =========================================================
           LIGHTBOX / POPUP
           ========================================================= */

        .gallery-lightbox {
            position: fixed;

            inset: 0;

            z-index: 99999;

            display: none;

            align-items: center;

            justify-content: center;

            padding: 25px;

            background:
                rgba(5,15,30,.94);

            backdrop-filter: blur(8px);
        }


        .gallery-lightbox.active {
            display: flex;
        }


        /* Popup */

        .lightbox-box {
            position: relative;

            width: min(1250px, 96vw);

            height: min(850px, 94vh);

            display: flex;

            flex-direction: column;

            overflow: hidden;

            background: #101820;

            border: 1px solid rgba(255,255,255,.12);

            border-radius: 20px;

            box-shadow:
                0 30px 100px rgba(0,0,0,.55);
        }


        /* Popup Header */

        .lightbox-header {
            height: 65px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 20px;

            background: #ffffff;
        }


        .lightbox-title {
            display: flex;

            align-items: center;

            gap: 10px;

            color: #101828;

            font-size: 17px;

            font-weight: 800;
        }


        .lightbox-title i {
            color: #008dd2;
        }


        .lightbox-counter {
            margin-left: 12px;

            padding: 5px 10px;

            background: #eef8fd;

            border-radius: 20px;

            color: #008dd2;

            font-size: 11px;

            font-weight: 800;
        }


        .lightbox-close {
            width: 38px;
            height: 38px;

            display: flex;

            align-items: center;
            justify-content: center;

            border: none;

            border-radius: 50%;

            background: #f1f4f7;

            color: #344054;

            font-size: 16px;

            cursor: pointer;

            transition:
                background .25s ease,
                color .25s ease,
                transform .25s ease;
        }


        .lightbox-close:hover {
            background: #008dd2;

            color: #ffffff;

            transform: rotate(90deg);
        }


        /* Main Image Area */

        .lightbox-main {
            position: relative;

            flex: 1;

            min-height: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 20px;

            background:
                radial-gradient(
                    circle at center,
                    #243746 0%,
                    #101820 65%
                );
        }


        .lightbox-main img {
            max-width: 100%;
            max-height: 100%;

            object-fit: contain;

            border-radius: 8px;

            box-shadow:
                0 15px 50px rgba(0,0,0,.45);

            user-select: none;
        }


        /* Navigation */

        .lightbox-nav {
            position: absolute;

            top: 50%;

            transform: translateY(-50%);

            width: 48px;
            height: 48px;

            display: flex;

            align-items: center;
            justify-content: center;

            border: none;

            border-radius: 50%;

            background: rgba(255,255,255,.94);

            color: #008dd2;

            font-size: 17px;

            cursor: pointer;

            box-shadow:
                0 8px 25px rgba(0,0,0,.25);

            transition:
                background .25s ease,
                color .25s ease,
                transform .25s ease;
        }


        .lightbox-nav:hover {
            background: #008dd2;

            color: #ffffff;
        }


        .lightbox-prev {
            left: 20px;
        }


        .lightbox-next {
            right: 20px;
        }


        /* Thumbnail Area */

        .lightbox-thumbnails {
            height: 100px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            gap: 10px;

            padding: 10px 15px;

            overflow-x: auto;

            background: #ffffff;
        }


        .lightbox-thumb {
            width: 80px;
            height: 70px;

            flex: 0 0 auto;

            padding: 2px;

            border: 2px solid transparent;

            border-radius: 8px;

            background: #eef1f4;

            overflow: hidden;

            cursor: pointer;

            transition:
                border-color .25s ease,
                transform .25s ease;
        }


        .lightbox-thumb:hover {
            transform: translateY(-2px);
        }


        .lightbox-thumb.active {
            border-color: #008dd2;
        }


        .lightbox-thumb img {
            width: 100%;
            height: 100%;

            display: block;

            object-fit: cover;

            border-radius: 5px;
        }


        /* =========================================================
           MOBILE
           ========================================================= */

        @media (max-width: 991px) {

            .gallery-header h1 {
                font-size: 36px;
            }

            .event-image-wrapper {
                height: 280px;
            }

            .lightbox-box {
                width: 96vw;
                height: 92vh;
            }

        }


        @media (max-width: 767px) {

            .mnc-gallery {
                padding: 40px 0 55px;
            }

            .gallery-header {
                margin-bottom: 32px;
            }

            .gallery-header h1 {
                font-size: 30px;
            }

            .gallery-header p {
                font-size: 14px;
            }

            .gallery-container {
                width: calc(100% - 25px);
            }

            .gallery-item {
                margin-bottom: 22px;
            }

            .event-image-wrapper {
                height: 280px;
            }

            .view-album {
                opacity: 1;

                transform:
                    translate(-50%, 0);

                padding: 9px 15px;
            }

            .lightbox-box {
                width: 100%;
                height: 100%;

                border-radius: 0;
            }

            .lightbox-header {
                height: 60px;

                padding: 0 13px;
            }

            .lightbox-title {c
                font-size: 14px;
            }

            .lightbox-counter {
                font-size: 10px;
            }

            .lightbox-main {
                padding: 10px;
            }

            .lightbox-nav {
                width: 40px;
                height: 40px;

                font-size: 14px;
            }

            .lightbox-prev {
                left: 10px;
            }

            .lightbox-next {
                right: 10px;
            }

            .lightbox-thumbnails {
                height: 80px;

                padding: 8px 10px;
            }

            .lightbox-thumb {
                width: 65px;
                height: 58px;
            }

        }


        @media (max-width: 480px) {

            .gallery-header h1 {
                font-size: 26px;
            }

            .gallery-container {
                width: calc(100% - 18px);
            }

            .event-image-wrapper {
                height: 240px;
            }

            .event-body {
                padding: 18px;
            }

            .event-body h5 {
                font-size: 17px;
            }

            .photo-count {
                top: 13px;
                right: 13px;

                padding: 7px 10px;

                font-size: 10px;
            }

            .event-date-badge {
                top: 13px;
                left: 13px;

                padding: 7px 10px;

                font-size: 10px;
            }

            .lightbox-title {
                max-width: 70%;

                white-space: nowrap;

                overflow: hidden;

                text-overflow: ellipsis;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">


    <!-- =========================================================
         EVENT GALLERY
         ========================================================= -->

    <section class="mnc-gallery">


        <!-- HEADER -->

        <div class="gallery-header">

            <div class="gallery-small-title">

                <i class="fas fa-photo-video"></i>

                Our Moments

            </div>


            <h1>

                Event <span>Gallery</span>

            </h1>


            <p>

                Explore memorable moments, celebrations and
                activities from Asclepius Wellness. Discover
                our journey through photographs and special
                events.

            </p>


            <div class="gallery-line"></div>

        </div>



        <!-- GALLERY -->

        <div class="gallery-container">

            <div class="row gallery-row">


                <asp:Repeater ID="rptGallery"
                    runat="server">


                    <ItemTemplate>


                        <div class="col-lg-4 col-md-6 col-sm-12 gallery-item">


                            <div class="event-card">


                                <!-- IMAGE -->

                                <div class="event-image-wrapper"
                                     onclick="openAlbum(this);">


                                    <%--<img src='<%# ResolveUrl("~/Images/") + Eval("CoverImage") %>'
                                        class="event-main-img"
                                        alt='<%# Eval("EventTitle") %>' />--%>


                                    <!-- DATE -->

                                    <div class="event-date-badge">

                                        <i class="far fa-calendar-alt"></i>

                                        <%# Convert.ToDateTime(Eval("EventDate")).ToString("dd MMM yyyy") %>

                                    </div>


                                    <!-- PHOTO COUNT -->

                                    <div class="photo-count">

                                        <i class="fas fa-images"></i>

                                        <%# Eval("PhotoCount") %> Photos

                                    </div>


                                    <!-- VIEW -->

                                    <div class="view-album">

                                        <i class="fas fa-expand-alt"></i>

                                        View Album

                                    </div>


                                    <!-- HIDDEN IMAGES -->

                                    <div class="album-images"
                                         style="display:none;">

                                        <asp:Repeater
                                            ID="rptEventImages"
                                            runat="server"
                                            DataSource='<%# Eval("ImagesPath") %>'>


                                            <ItemTemplate>

                                                <span
                                                    class="album-image"
                                                    data-image='<%# ResolveUrl("~/Images/") + Eval("ImagePath") %>'>
                                                </span>

                                            </ItemTemplate>


                                        </asp:Repeater>

                                    </div>


                                </div>



                                <!-- BODY -->

                                <div class="event-body">


                                    <div class="event-category">

                                        <i class="fas fa-circle"></i>

                                        AWPL Event Album

                                    </div>


                                    <h5>

                                        <%# Eval("EventTitle") %>

                                    </h5>


                                    <div class="event-bottom">

                                        <span class="event-open-text">

                                            <i class="fas fa-images"></i>

                                            View all event photos

                                        </span>


                                        <span class="event-arrow">

                                            <i class="fas fa-arrow-right"></i>

                                        </span>

                                    </div>


                                </div>


                            </div>


                        </div>


                    </ItemTemplate>


                </asp:Repeater>


            </div>

        </div>


    </section>



    <!-- =========================================================
         LIGHTBOX
         ========================================================= -->

    <div id="galleryLightbox"
         class="gallery-lightbox">


        <div class="lightbox-box">


            <!-- HEADER -->

            <div class="lightbox-header">


                <div class="lightbox-title">

                    <i class="fas fa-images"></i>

                    <span id="lightboxTitle">
                        Event Album
                    </span>

                    <span id="lightboxCounter"
                          class="lightbox-counter">

                        1 / 1

                    </span>

                </div>


                <button type="button"
                        class="lightbox-close"
                        onclick="closeAlbum();">

                    <i class="fas fa-times"></i>

                </button>


            </div>



            <!-- MAIN IMAGE -->

            <div class="lightbox-main">


                <button type="button"
                        class="lightbox-nav lightbox-prev"
                        onclick="previousImage();">

                    <i class="fas fa-chevron-left"></i>

                </button>


                <img id="lightboxImage"
                     src=""
                     alt="Event Image" />


                <button type="button"
                        class="lightbox-nav lightbox-next"
                        onclick="nextImage();">

                    <i class="fas fa-chevron-right"></i>

                </button>


            </div>



            <!-- THUMBNAILS -->

            <div id="lightboxThumbnails"
                 class="lightbox-thumbnails">
            </div>


        </div>

    </div>



    <!-- =========================================================
         LIGHTBOX JAVASCRIPT
         ========================================================= -->

    <script>

        let currentImages = [];

        let currentIndex = 0;


        function openAlbum(element) {

            currentImages = [];

            currentIndex = 0;


            /* Get all event images */

            const imageElements =
                element.querySelectorAll(
                    ".album-image"
                );


            imageElements.forEach(function (item) {

                const image =
                    item.getAttribute("data-image");


                if (image) {

                    currentImages.push(image);

                }

            });


            /* Fallback to main image */

            if (currentImages.length === 0) {

                const mainImage =
                    element.querySelector(
                        ".event-main-img"
                    );


                if (mainImage) {

                    currentImages.push(
                        mainImage.src
                    );

                }

            }


            /* Event Title */

            const card =
                element.closest(".event-card");


            const title =
                card.querySelector(
                    ".event-body h5"
                );


            document.getElementById(
                "lightboxTitle"
            ).innerText =
                title
                    ? title.innerText
                    : "Event Album";


            /* Open */

            document.getElementById(
                "galleryLightbox"
            ).classList.add("active");


            document.body.style.overflow =
                "hidden";


            createThumbnails();


            showImage(0);

        }



        function closeAlbum() {

            document.getElementById(
                "galleryLightbox"
            ).classList.remove("active");


            document.body.style.overflow =
                "";

        }



        function showImage(index) {

            if (
                currentImages.length === 0
            ) {
                return;
            }


            if (index < 0) {

                index =
                    currentImages.length - 1;

            }


            if (
                index >= currentImages.length
            ) {

                index = 0;

            }


            currentIndex = index;


            document.getElementById(
                "lightboxImage"
            ).src =
                currentImages[currentIndex];


            document.getElementById(
                "lightboxCounter"
            ).innerText =
                (currentIndex + 1)
                + " / "
                + currentImages.length;


            updateActiveThumbnail();

        }



        function nextImage() {

            showImage(
                currentIndex + 1
            );

        }



        function previousImage() {

            showImage(
                currentIndex - 1
            );

        }



        function createThumbnails() {

            const container =
                document.getElementById(
                    "lightboxThumbnails"
                );


            container.innerHTML = "";


            currentImages.forEach(
                function (image, index) {


                    const button =
                        document.createElement(
                            "button"
                        );


                    button.type =
                        "button";


                    button.className =
                        "lightbox-thumb";


                    button.innerHTML =
                        "<img src='"
                        + image
                        + "' alt='Event photo "
                        + (index + 1)
                        + "' />";


                    button.onclick =
                        function () {

                            showImage(index);

                        };


                    container.appendChild(
                        button
                    );

                }
            );

        }



        function updateActiveThumbnail() {

            const thumbnails =
                document.querySelectorAll(
                    ".lightbox-thumb"
                );


            thumbnails.forEach(
                function (thumbnail, index) {

                    thumbnail.classList.toggle(
                        "active",
                        index === currentIndex
                    );

                }
            );


            const active =
                thumbnails[currentIndex];


            if (active) {

                active.scrollIntoView({
                    behavior: "smooth",
                    block: "nearest",
                    inline: "center"
                });

            }

        }



        /* =====================================================
           CLOSE ON BACKGROUND CLICK
           ===================================================== */

        document.getElementById(
            "galleryLightbox"
        ).addEventListener(
            "click",
            function (event) {

                if (
                    event.target === this
                ) {

                    closeAlbum();

                }

            }
        );



        /* =====================================================
           KEYBOARD CONTROL
           ===================================================== */

        document.addEventListener(
            "keydown",
            function (event) {


                const lightbox =
                    document.getElementById(
                        "galleryLightbox"
                    );


                if (
                    !lightbox.classList.contains(
                        "active"
                    )
                ) {

                    return;

                }


                if (
                    event.key === "Escape"
                ) {

                    closeAlbum();

                }


                if (
                    event.key === "ArrowRight"
                ) {

                    nextImage();

                }


                if (
                    event.key === "ArrowLeft"
                ) {

                    previousImage();

                }

            }
        );

    </script>


</asp:Content>
