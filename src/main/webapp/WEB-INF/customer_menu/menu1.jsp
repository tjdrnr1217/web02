<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<form action="mypage.do?menu=1" method="post" >
		<label>아이디 : </label>
		<input type="text" name="id" placeholder="아이디" value="${obj.id}" readonly>
		<hr>
		<label>이름 : </label>
		<input type="text" name="name" placeholder="이름" value="${obj.name}">
		<hr/>
		<label>나이 : </label>
		<input type="number" name="age" placeholder="나이" value="${obj.age}">
		<hr/>
		<input type="button" value="정보변경" onclick="updateMember()">
	</form>
</div>