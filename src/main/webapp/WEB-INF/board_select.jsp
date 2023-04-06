<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판글쓰기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" /><title>Insert title here</title>
	<style>
	ul{
   	display: flex;
    justify-content: center;
    align-items: center;
	}
	
	table{
	 border: 1px solid #c8c8c8;
	}
	</style>
</head>

<body>
	<div class="container">
		<a href="write.do" class="btn btn-primary">글쓰기</a>
		
		<div style="width:500px; margin-top:10px;">
			<form class="row g-2">
  				<div class="col-auto">
					<input type="text" name="text" class="form-control" placeholder="검색어" style="width:300px;"/>
				</div>
				<div class="col-auto">
					<input type="submit" class="btn btn-primary" value="검색" />
				</div>
			</form>		
		</div>
		
		<table class="table table-hover">
  			<thead>
    			<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
					<th scope="col">날짜</th>
			    </tr>
  			</thead>
			<tbody>
				<c:forEach var="obj" items="${list}">
				<tr>
					<td scope="row">${obj.no}</td>
					<td>${obj.title}</td>
					<td>${obj.writer}</td>
					<td>${obj.hit}</td>
					<td>${obj.regdate}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<ul id="pagination-demo" class="pagination"></ul>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.twbsPagination.min.js"></script>
	<script>
	// $(document).ready(function(){
	$(function(){
		$('#pagination-demo').twbsPagination({
			  totalPages	: Number('${pages}'),
			  visiblePages	: 10,
			  first 		: '≪',
			  last 			: '≫',
			  prev 			: '<',
			  next 			: '>',
			  initiateStartPageClick : false,
			  startPage  	: Number('${param.page}'),	
			  onPageClick	: function (event, page) {
					window.location.href="select.do?page=" + page;
			  }
		});	
	});
	</script>

</body>
</html>