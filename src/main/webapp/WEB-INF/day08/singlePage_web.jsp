<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name="author" content="LDJ">
    <meta name="description" content="이 페이지는 startBootstrap.com에서 제공하는 무료 템플릿을 커스터마이징하는 예제입니다.">
    <title>Single Page Website</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- 1. Bootstrap용 css CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <!-- Font Awesome 아이콘 css CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 3. Bootstrap Icon용 CDN / font-awesome Icon용 CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/day08/css/singlepage.css'>
    <link rel='icon' href="images/ui.ico">
    <!-- jquery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <!--font awesome용 스크립트 CDN-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
        integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src='${pageContext.request.contextPath}/day08/script/singlepage.js'></script>

    <script>
        $(document).ready(function () {
            var navbarShrink = () => {
                const mainNav = $('#mainNav');
                if (!mainNav){
                    return;
                }

                if(window.scrollY === 0)
                    mainNav.removeClass('navbar-shrink');
                else
                    mainNav.addClass('navbar-shrink');
             }

            navbarShrink();
            $(document).scroll(function () {
                navbarShrink();
            });
            // 실패 동작안함!
            // const navbarToggle = $('.navbar-toggle');
            // const resNavItems = [].slice.call(
            //     documnet.querySelectorAll('#navbarResponsive .nav-link')
            // );

            // resNavItems.map(function(resNavItem){
            //     resNavItem.addEventListener('click', () =>{
            //         if(window.getComputedStyle(navbarToggler).display !== 'none'){
            //             navbarToggle.click();
            //         }
            //     });
            // });
            //js 코딩하세여
            $('#menu_about').click(function(){
                $(this).addClass('active');
                $('#menu_portfolio').removeClass('active');
                $('#menu_signup').removeClass('active');
            });
            $('#menu_portfolio').click(function(){
                $(this).addClass('active');
                $('#menu_about').removeClass('active');
                $('#menu_signup').removeClass('active');
            });
            $('#menu_signup').click(function(){
                $(this).addClass('active');
                $('#menu_portfolio').removeClass('active');
                $('#menu_about').removeClass('active');
            });
        });
    </script>
</head>

<body id="page-top">
    <!--내비게이션 영역-->
    <nav id="mainNav" class="navbar navbar-light navbar-expand fixed-top">
        <div class="container px-4">
            <a href="#page-top" class="navbar-brand">Logo</a>
            <!-- data-bs-toggle -->
            <button type="button" class="navbar-toggler navbar-toggler-right" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div id="navbarResponsive" class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li><a id="menu_about" href="#about" class="nav-link">About</a></li>
                    <li><a id="menu_portfolio" href="#portfolio" class="nav-link">Portfolio</a></li>
                    <li><a id="menu_signup" href="#signup" class="nav-link">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 마스터헤드 -->
    <header class="masterHead">
        <div class="container px-4 d-flex h-100 justify-content-center align-items-center">
            <div class="d-flex justify-content-center">
                <div class="text-center">
                    <h1 class="mx-auto my-0 text-uppercase">Grayscale</h1>
                    <h2 class="text-white-50 mx-auto mt-2 mb-5">responsive single page Bootstrap site</h2>
                    <a href="#" class="btn btn-primary shadow-sm">Get Start</a>
                </div>
            </div>
        </div>
    </header>

    <!--about 메뉴-->
    <section id="about" class="about-section text-center">
        <div class="container px-4">
            <div class="row gx-4 justify-content-center">
                <div class="col-8">
                    <h2 class="text-gray mb-4">About single page website</h2>
                    <p class="text-gray-50">Grayscale is a free Bootstrap theme created by Start Bootstrap. It can be
                        yours right now, simply download the template on
                        <a href="https://startbootstrap.com/theme/grayscale/">the preview page.</a>
                        The theme is open source, and you can use it for any purpose, personal or commercial.
                    </p>
                </div>
            </div>
            <img src="${pageContext.request.contextPath}/day08/images/ipad.png" alt="..." class="img-fluid">
        </div>
    </section>

    <!-- Portfolio 영역 container 안에 row column 이기 때문에 div가 3개 들어감-->
    <section id="portfolio" class="portfolios-section bg-light">
        <div class="container px-4 ">
            <!-- 1st row 영역 -->
            <div class="row align-items-center gx-0 mb-4">
                <div class="col-8">
                    <img src="${pageContext.request.contextPath}/day08/images/bg-masthead.jpg" class="img-fluid mb-3">
                </div>
                <div class="col-4">
                    <div class="featured-text text-center">
                        <h4>Shoreline</h4>
                        <p class="text-black-50 mb-0">Grayscale is open source and MIT licensed. This means you can use it for any project - even
                            commercial projects! Download it, customize it, and publish your website!</p>
                    </div>
                </div>
            </div>
            <!-- 2nd row -->
            <div class="row justify-content-center gx-0">
                <div class="col-6">
                    <img src="${pageContext.request.contextPath}/day08/images/demo-image-01.jpg" class="img-fluid">
                </div>
                <div class="col-6">
                    <div class="bg-black text-center h-100 portfolio">
                        <div class="d-flex h-100">
                            <div class="portfolio-text w-100 my-auto text-center">
                                <h4 class="text-white">Misty</h4>
                                <p class="mb-0 text-white-50">An example of where you can put an image of a project, or anything else, along with a
                                    description.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 3rd row -->
            <div class="row justify-content-center gx-0">
                <div class="col-6">
                    <img src="${pageContext.request.contextPath}/day08/images/demo-image-02.jpg" class="img-fluid">
                </div>
                <!-- col 영역 위치 바꾸기 order-first -->
                <div div class="col-6 order-first">
                    <div class="bg-black text-center h-100 portfolio">
                        <div class="d-flex h-100">
                            <div class="portfolio-text w-100 my-auto text-center">
                                <h4 class="text-white">Mountains</h4>
                                <p class="mb-0 text-white-50">Another example of a project with its respective description. These sections work
                                    well responsively as well!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact / signup 영역 -->
    <section id="signup" class="signup-section">
        <div class="container px-4">
            <div class="row px-4">
                <div class="col-10 mx-auto text-center">
                    <i class="far fa-paper-plane fa-2x text-white"></i>
                    <h2 class="text-white mb-5">Subscribe!!</h2>
                    <form id="contactForm" class="form-signup">
                        <!-- 나중에 추가할 것!! -->
                        <div class="row input-group-newsletter">
                            <div class="col"><input id="email" type="email" class="form-control" placeholder="Enter email address..." aria-label="Enter email address..." data-sb-validations="required,email"></div>
                            <div class="col-auto"><button id="save" type="submit" class="btn btn-primary">Send Email</button></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact 영역-->
    <section class="contact-section bg-black">
        <div class="container px-4">
            <div class="row gx-4">
                <!--1st col-->
                <div class="col-4 mb-3">
                    <div class="card py-4 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-map-marked-alt custom-color mb-2"></i>
                            <h4 class="text-uppercase m-0">Address</h4>
                            <hr class="my-4 mx-auto">
                            <div class="small text-black-50">365, Sinseon-ro, Nam-gu, Busan</div>
                        </div>
                    </div>
                </div>
                <!-- 2nd col-->
                <div class="col-4 mb-3">
                    <div class="card py-4 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-envelope custom-color mb-2"></i>
                            <h4 class="text-uppercase m-0">Email</h4>
                            <hr class="my-4 mx-auto">
                            <div class="small text-black-50"><a href="#">tjdrnr9353@naver.com</a></div>
                        </div>
                    </div>
                </div>
                <!--3rd col-->
                <div class="col-4 mb-3">
                    <div class="card py-4 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-mobile-alt custom-color mb-2"></i>
                            <h4 class="text-uppercase m-0">Phone</h4>
                            <hr class="my-4 mx-auto">
                            <div class="small text-black-50">+82 010-XXXX-XXXX</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="social d-flex justify-content-center">
                <a class="mx-2" href="#"><i class="fab fa-twitter"></i></a>
                <a class="mx-2" href="#"><i class="fab fa-facebook-f"></i></a>
                <a class="mx-2" href="#"><i class="fab fa-github"></i></a>
            </div>
        </div>
    </section>

    <!--footer 영역-->
    <footer class="footer bg-black small text-center text-white-50">
        <div class="container px-4">Copyright &copy; Single Page Website 2023.</div>
    </footer>

    <!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
</body>

</html>