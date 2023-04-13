<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 1. Bootstrap용 css CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<!-- bootstrap용 아이콘-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>판매용 홈화면</title>
</head>
<body>
	 	<div class="container">
	 	<h3>판매자 홈화면</h3>
		<hr/>
		<a href="home.do" class="btn btn-primary">홈으로</a>
		<c:if test="${sessionScope.id eq null}">
			<a href="${pageContext.request.contextPath}/customer/login.do" class="btn btn-primary">로그인</a>
			<a href="${pageContext.request.contextPath}/seller/join.do" class="btn btn-primary">회원가입</a>
			
		</c:if>
		
		<c:if test="${sessionScope.id ne null}">
			<label>${sessionScope.name}님 로그인</label>			
			<a href="#" onclick="logoutAction()" class="btn btn-primary">로그아웃</a>
			<a href="${pageContext.request.contextPath}/item/select.do" class="btn btn-primary">물품관리</a>
		</c:if>	
		<hr />
	</div>

	
	<!-- axios 추가 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<!-- jquery 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"
		integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
		
	<script>
	function logoutAction(){
		var form = document.createElement("form");
		form.setAttribute("action","logout.do");
		form.setAttribute("method","post");
		form.style.display="none";
		document.body.appendChild(form);
		form.submit();
	}
	</script>

</body>
</html>