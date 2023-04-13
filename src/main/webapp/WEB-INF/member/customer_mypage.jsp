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
<title>공용마이페이지</title>
</head>
<body>
	<div class="container">
		<a href="mypage.do?menu=1" class="btn btn-primary">회원정보수정</a>
		<a href="mypage.do?menu=2" class="btn btn-primary">회원비번변경</a>
		<a href="mypage.do?menu=3" class="btn btn-primary">회원탈퇴</a>
		<a href="mypage.do?menu=4" class="btn btn-primary">주문내역</a>
		<hr/>
		<c:if test="${param.menu == 1 }"> 
			<jsp:include page="../customer_menu/menu1.jsp"></jsp:include>
		</c:if>
		<c:if test="${param.menu == 2 }">
			<jsp:include page="../customer_menu/menu2.jsp"></jsp:include>
		</c:if>
		<c:if test="${param.menu == 3 }">
			<jsp:include page="../customer_menu/menu3.jsp"></jsp:include>
		</c:if>
		<c:if test="${param.menu == 4 }">
			4
		</c:if>
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
	function updateMember(){
			// 유효성 검사
			const name = document.getElementsByName("name")[0];
			const age = document.getElementsByName("age")[0];
			
			// document.getElementsByTagName("form")[0].submit(); 아래가 같다
			const form = document.getElementsByTagName("form");
			form[0].submit();
	}
	
	function pwupdateMember(){
		const pw = document.getElementsByName("pw")[0];
		const pw1 = document.getElementsByName("pw1")[0];
		
		// document.getElementsByTagName("form")[0].submit(); 아래가 같다
		const form = document.getElementsByTagName("form");
		form[0].submit();
	}
	
	function deleteMember() {
		const id = document.getElementsByName("id")[0];
		const name = document.getElementsByName("name")[0];
		const age = document.getElementsByName("age")[0];
		const password = document.getElementsByName("password")[0];
		
		const form = document.getElementsByTagName("form");
		form[0].submit();
	}
	</script>

</body>
</html>