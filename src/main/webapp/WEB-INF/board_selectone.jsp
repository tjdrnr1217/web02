<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판내용</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
</head>

<body>
	<div class="container">
		<div style="width:700px; border:1px solid #cccccc; margin :0px auto;padding:40px;">
			<div class="mb-3 row">
		    	<label for="staticEmail" class="col-sm-2 col-form-label">글번호</label>
		    	<div class="col-sm-10">
		      		<input type="text" class="form-control" value="${brd.no}" readonly />
		    	</div>
		  	</div>
		  
		  	<div class="mb-3 row">
		    	<label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
		    	<div class="col-sm-10">
		      		${brd.title}
		    	</div>
		  	</div>
		  	
		  	<div class="mb-3 row">
		    	<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
		    	<div class="col-sm-10">
		      		${brd.content}
		    	</div>
		  	</div>
		  	
		  	<div class="mb-3 row">
		    	<label for="inputPassword" class="col-sm-2 col-form-label">작성자</label>
		    	<div class="col-sm-10">
		      		${brd.writer}
		    	</div>
		  	</div>
		  	
		  	<div class="mb-3 row">
		    	<label for="inputPassword" class="col-sm-2 col-form-label">조회수</label>
		    	<div class="col-sm-10">
		      		${brd.hit}
		    	</div>
		  	</div>
		  	
		  	<div class="mb-3 row">
		    	<label for="inputPassword" class="col-sm-2 col-form-label">날짜</label>
		    	<div class="col-sm-10">
		      		${brd.regdate}
		    	</div>
		  	</div>
		  	
		  	<div class="mb-3 row">
		  		<div class="col-sm-10">
		    	<a class="btn btn-primary" href="select.do">목록으로</a>
		    	<a class="btn btn-primary" href="update.do"><button class="btn btn-primary">글수정</button></a>
		    	<form action="delete.do" method="post"
				style="display: inline-block;">
				<input type="hidden" name="no" value="${brd.no}" class="btn btn-primary" /> <input type="submit"
				value="삭제" />
				</form>
		    	<c:if test="${prev > 0}">
		    	<a href="selectone.do?no=${prev}" onclick="ajaxUpdateHit('${prev}')"><button class="btn btn-primary">이전글</button></a>
		    	</c:if>
		    	<c:if test="${next > 0}">
		    	<a href="selectone.do?no=${next}" onclick="ajaxUpdateHit('${next}')"><button class="btn btn-primary">다음글</button></a>
		    	</c:if>
		    	</div>
		  	</div>
		  	
		</div> 
	</div>	 
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.3.5/axios.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.min.js"></script>

	<script>
	async function ajaxUpdateHit(no){
		// 1. restful을 이용해서 조회수를 증가
		const url = '${pageContext.request.contextPath}/api/board/updatehit.json?no=' + no;
		const headers = {"Content-Type":"application/json"};
		
		const { data } = await axios.put(url, {}, {headers});
		
		console.log(data);
		if(data.result === 1){
		// 2. 상세화면페이지로 전환
		window.location.href='selectone.do?no=' + no;
		}
	}

	</script>

</body>
</html>