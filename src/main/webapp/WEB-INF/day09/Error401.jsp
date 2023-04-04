<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>401 에러</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href="${pageContext.request.contextPath}/day09/css/main.css"/>
    <!-- 1. Bootstrap용 css CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <!-- Font Awesome 아이콘 css CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- <style>
        .asd{
            font-size: 1.25rem;
            /* 1rem=16px */
            font-weight: 300;
        }
    </style> -->
</head>
<body>
    <div id="layoutError">
        <div id="layoutError_content">
            <main>
                <div class="cotainer">
                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="text-center mt-4">
                                <h1 class="display-1">401</h1>
                                <p class="asd">Unauthorized</p>
                                <p class="lead">Access to this resource is denied.</p>
                                <a href="index.do">
                                    <i class="fas fa-arrow-left me-1"></i>
                                    메인화면으로
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid py-4">
                <div class="d-flex justify-content-between align-items-center small">
                    <div class="text-muted me-2">Copyright &copy; PKNU 2023.</div>
                    <div> 
                        <a href="#">Privacy Policy</a> &middot; <a href="#">Terms</a> &amp; <a href="#">Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
     <!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
     crossorigin="anonymous"></script>
</body>
</html>