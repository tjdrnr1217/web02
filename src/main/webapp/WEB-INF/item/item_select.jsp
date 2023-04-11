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
<style>
header {
	margin: 0 auto;
}

table {
	margin: 0 auto;
	width: 1000px;
	height: 500px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	text-align: center;
	border-bottom: 1px solid #444444;
	padding: 10px;
}
ul {
   display: flex;
   justify-content: center;
   align-items: center;
}
#btn{
	margin-top: 10px;
	
}
.input-group{
	margin-top: 10px;
	margin-bottom: 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<a href="${pageContext.request.contextPath}/item/write.do" id="btn" class="btn btn-primary">물품등록</a> <br/>
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<!-- 서치창과 서치버튼을 붙임-->
				<input class="form-control" type="text" placeholder="검색어 입력..."
					aria-label="검색어 입력..." aria-describedby="btnSearch">
				<button class="btn btn-primary" id="btnSearch" type="button">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
		<table class="table">
			<thead>
				<tr>
					<th>물품 번호</th>
					<th>물품명</th>
					<th>물품 내용</th>
					<th>물품 가격</th>
					<th>물품 수량</th>
					<th>물품 등록 날짜</th>
					<th>이미지</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="obj" items="${item}">
					<tr>
						<td>${obj.no}</td>
						<td>${obj.name}</td>
						<td>${obj.content}</td>
						<td>${obj.price}</td>
						<td>${obj.quantity}</td>
						<td>${obj.regdate}</td>
						<td><a href="imagewrite.do?ino=${obj.no}" class="btn btn-primary">이미지 등록</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<ul id="pagination-demo" class="pagination"></ul>
	</div>
	
	 
	 <!-- axios 추가 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	 <!-- jquery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
        integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
	
	<script>
	
	async function ajaxUpdateHit(no){
		// 1. restful을 이용해서 조회수를 증가
		const url = '${pageContext.request.contextPath}/api/board/updatehit.json?no=' + no;
		const headers = {"Content-Type":"application/json"};
		
		const {data}= await axios.put(url, {},{headers});
		console.log(data);
		
		
		if(data.result === 1){
			// 2. 상세화면페이지로 전환
			window.location.href='selectone.do?no='+no;
		}
		
	}
	// $(document).ready(function){ === $(function(){
	$(function(){
		$('#pagination-demo').twbsPagination({
			  totalPages: Number('${pages}'),
			  visiblePages: 10,
			  first : '≪',
			  last : '≫',
			  prev : '＜',
			  next : '＞',
			  initiateStartPageClick : false,
			  startPage : Number('${param.page}'),
			  onPageClick: function (event, page) {
			    //$('#page-content').text('Page ' + page);
			    window.location.href="select.do?page="+page;
			  }
		});
	});
	
	</script>
</body>
</html>