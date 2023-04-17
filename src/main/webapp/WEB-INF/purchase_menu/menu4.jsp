<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<h3>시간대별 주문목록</h3>
</div>



<div class="container">
		<a href="purchase.do?menu=1" class="btn btn-sm btn-primary">전체 주문목록</a>
		<a href="purchase.do?menu=2" class="btn btn-sm btn-primary">회원별 주문목록</a>
		<a href="purchase.do?menu=3" class="btn btn-sm btn-primary">물품별 주문목록</a>
		<a href="purchase.do?menu=4" class="btn btn-sm btn-primary">시간대별 주문목록</a>		
		<hr/>
		
		<c:if test="${param.menu == 1 }">
			<jsp:include page="../purchase_menu/menu1.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 2 }">
			<jsp:include page="../purchase_menu/menu2.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 3 }">
			<jsp:include page="../purchase_menu/menu3.jsp"></jsp:include>
		</c:if>
		
		<c:if test="${param.menu == 4 }">
			<jsp:include page="../purchase_menu/menu4.jsp"></jsp:include>
		</c:if>	
	</div>