<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
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