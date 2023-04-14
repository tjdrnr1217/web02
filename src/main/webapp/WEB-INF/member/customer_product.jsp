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
		<jsp:include page="customer_header.jsp"></jsp:include>
		
		<c:if test="${not empty imageNo}">
			<c:forEach var="no" items="${imageNo}">
			<img src="${pageContext.request.contextPath}/item/image?no=${no}" 
					style="width:200px; height:150px" />
			</c:forEach>
		</c:if>
		
		<c:if test="${empty imageNo}">
			<img src="${pageContext.request.contextPath}/resources/images/default.png"
				style="width:200px; height:150px" />
		</c:if>
		
		<p>물품번호 : ${obj.no}</p>
		<p>물품명 : ${obj.name}</p>
		<p>물품내용 : ${obj.content}</p>
		<p>물품가격 : ${obj.price}</p>
		<form id="form" action="purchase.do" method="post">
			<input type="hidden" name="itemno" value="${obj.no}"/>
			<select name="cnt">
				<c:forEach var="idx" begin="1" end="1000" step="1">
					<option value="${idx}">${idx}</option>
				</c:forEach>
			</select>
			<input type="submit" class="btn btn-sm btn-primary" value="주문하기" />	
		</form>	
	</div>

	<script>

	</script>
</body>
</html>