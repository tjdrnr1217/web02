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
<title>판매회원가입</title>
</head>
<body>
	<div class="container">
	
        <div style="width:600px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>회원가입</h3>
	            <div class="row">
	                <div class="col-sm">
		                <div class="form-floating mb-2">
		                    <input type="text" name="id" id="id" class="form-control" onkeyup="ajaxIDCheck(this)" />
		                    <label for="id" id="lbl_check" class="form-label">아이디</label>
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="password" name="pw" id="pw" class="form-control" />
		                    <label for="pw" class="form-label">암호</label>
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="password" id="pw1" class="form-control" />
		                    <label for="pw1" class="form-label">암호확인</label>
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="text" name="name" id="name" class="form-control" />
		                    <label for="name" class="form-label">이름</label>
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="number" name="age" id="age" class="form-control" />
		                    <label for="age" class="form-label">나이</label>
		                </div>
		                <div>
	                    	<input type="button" value="회원가입" class="btn btn-primary" 
	                    		onclick="joinAction()"/>
	                    </div>
	                </div>
	            </div>
		</div>            
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
	// 공통변수 모든 함수에서 사용가능함.
	
		var idcheck = 0; //1이면 사용가능 0은 사용불가
	
	async function joinAction(){
		const id   = document.getElementById("id");
		const pw   = document.getElementById("pw");
		const pw1  = document.getElementById("pw1");
		const name = document.getElementById("name");
		const age  = document.getElementById("age");
		
		const url 		= '${pageContext.request.contextPath}/api/member/join.json';
		const headers	={"Content-Type":"application/x-www-form-urlencoded"};
		const body		={id : id.value, pw : pw.value, name : name.value, age : age.value};
		const { data } 	= await axios.post(url, body, {headers});
		
		
		if( id.value.length <= 0 ){
			alert('아이디를 입력하세요.');
			id.focus();
			return false; // 함수 종료, 전송하지 않음
		}
		
		if( pw.value !== pw1.value ) {
			alert('암호가 일치하지 않습니다.');
			pw1.focus();
			return false;
		}
		
		if(idcheck === 0) {
			alert('사용가능한 아이디를 입력하세요.');
			id.focus();
			return false;
		}
		
	}
	
	
	async function ajaxIDCheck(e){
		if(e.value.length > 0) {
			
			const url 		= '${pageContext.request.contextPath}/api/member/idcheck.json?id=' + e.value;
			const headers 	= {"Content-Type":"application/json"};
			const {data} 	= await axios.get(url, {headers});
			
			console.log(data);
			if(data.ret === 1) {
				idcheck = 0;
				document.getElementById("lbl_check").innerText = '사용불가';
			}
			else if(data.ret === 0) {
				idcheck = 1;
				document.getElementById("lbl_check").innerText = '사용가능';
			}
		}
		else {
			idcheck = 0;
			document.getElementById("lbl_check").innerText = '아이디';
		}
	}		
	</script>
</body>
</html>