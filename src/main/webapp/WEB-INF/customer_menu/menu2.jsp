<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<form action="mypage.do?menu=2" method="post" >
		<label> 현재 암호 : </label>
		<input type="password" name="pw" placeholder="암호" value="${obj.password}">
		<hr/>
		<label> 변경 암호 : </label>
		<input type="password" name="pw1" placeholder="암호">
		<hr/>
		<input type="button" value="암호변경" onclick="pwupdateMember()">
	</form>
</div>