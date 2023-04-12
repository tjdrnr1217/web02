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
<title>고객용로그인</title>
</head>
<body>
	<div class="container">
        <div style="width:600px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>로그인</h3>
        	<form action="login.do"></form>  <!-- /web03/customer/여기만바뀜 -->
        	<form action="/login.do"></form> <!-- /login.do -->
        	
        	<form action="${pageContext.request.contextPath}/customer/login.do" 
        			method="post" id="form">
	            <div class="row">
	                <div class="col-sm">
		                <div class="form-floating mb-2">
		                    <input type="text" name="id" id="id" class="form-control" />
		                    <label for="id" class="form-label">아이디</label>
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="password" name="pw" id="pw" class="form-control" />
		                    <label for="pw" class="form-label">암호</label>
		                </div>
		                <div>
	                    	<input type="button" value="로그인" class="btn btn-primary" 
	                    		onclick="loginAction()"/>
	                    	<a href="join.do" class="btn btn-primary">회원가입</a>	
	                    </div>
	                </div>
	            </div>
            </form>
		</div>
	</div>
	
	<hr/>
	
		<div class="container">
        <div style="width:600px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>로그인(ajax)</h3>
	            <div class="row">
	                <div class="col-sm">
		                <div class="form-floating mb-2">
		                    <input type="text" id="id1" class="form-control" />
		                    <label for="id1" class="form-label">아이디</label>
		                </div>
		                <div class="form-floating mb-2">
		                    <input type="password" id="pw1" class="form-control" />
		                    <label for="pw1" class="form-label">암호</label>
		                </div>
		                <div>
	                    	<input type="button" value="로그인1" class="btn btn-primary" 
	                    		onclick="loginAction1()"/>
	                    	<a href="join.do" class="btn btn-primary">회원가입</a>	
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
	async function loginAction1(){
		const id   = document.getElementById("id1");
		const pw   = document.getElementById("pw1");
		
		const url 		= '${pageContext.request.contextPath}/api/member/login.json';
		const headers	={"Content-Type":"application/x-www-form-urlencoded"};
		const body		={id : id.value, pw : pw.value};
		const { data } 	= await axios.post(url, body, {headers});
		console.log(data);
		if(data.ret === 1){
			alert('로그인 되었습니다,');
			window.location.href='home.do';
		}
		else{
			alert('아이디 또는 암호가 틀립니다.')
		}
	}
	
	async function loginAction(){
		const id   = document.getElementById("id");
		const pw   = document.getElementById("pw");
		
		if( id.value.length <= 0 ){
			alert('아이디를 입력하세요.');
			id.focus();
			return false; // 함수 종료, 전송하지 않음
		}
		
		if( pw.value.length <= 0 ){
			alert('암호를 입력하세요.');
			pw.focus();
			return false; // 함수 종료, 전송하지 않음
		}

		document.getElementById("form").submit();
	}
	</script>
</body>
</html>