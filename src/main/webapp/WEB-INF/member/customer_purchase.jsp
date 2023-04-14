<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객용 홈화면</title>
<!-- 1. Bootstrap용 css CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<!-- bootstrap용 아이콘-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

</head>
<body>
<div class="container">
	<h3>주문내역</h3>
	<form action="mypage.do?menu=4" method="post" >
		<table class="table table-hover">
  			<thead>
    			<tr>
					<th scope="col">물품이름</th>
					<th scope="col">가격</th>
					<th scope="col">이름</th>
					<th scope="col">번호</th>
					<th scope="col">수량</th>
					<th scope="col">아이템번호</th>
					<th scope="col">주문자아이디</th>
					<th scope="col">주문한 날짜</th>				
			    </tr>
  			</thead>
			<tbody>
				<c:forEach var="obj" items="${aa}">
				<tr>
					<td scope="row">${obj.no}</td>
					<td>${obj.iname}</td>
					<td>${obj.price}</td>
					<td>${obj.name}</td>
					<td>${obj.cnt}</td>
					<td>${obj.itemno}</td>
					<td>${obj.customerid}</td>
					<td>${obj.regdate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>

</body>
</html>