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
<title>고객회원가입</title>
</head>
<body>
	<div class="container">
		<div
			style="width: 600px; margin: 0 auto; padding: 50px; border: 1px solid #efefef;">
			<h3>회원가입</h3>
			<hr />
			<div class="row">
				<div class="col-sm">
					<div class="form-floating mb-2">
						<input type="text" id="id" class="form-control"
							onkeyup="ajaxIDCheck(this)"> <label for="id"
							id="lbl_check" class="form-label">아이디</label>
					</div>

					<div class="form-floating mb-2">
						<input type="password" id="pass" class="form-control"> <label
							for="pass" class="form-label">암호</label>
					</div>

					<div class="form-floating mb-2">
						<input type="password" id="pass2" class="form-control"> <label
							for="pass2" class="form-label">암호확인</label>
					</div>

					<div class="form-floating mb-2">
						<input type="text" id="name" class="form-control"> <label
							for="name" class="form-label">이름</label>
					</div>

					<div class="form-floating mb-2">
						<input type="text" id="age" class="form-control" /> <label
							for="age" class="form-label">나이</label>
					</div>

					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기"><br> <input type="text"
						id="sample6_address" placeholder="주소"><br> <input
						type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">

					<div>
						<input type="submit" value="회원가입" class="btn btn-primary" />
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
	async function ajaxIDCheck(e){
		console.log(e.value);
		if(e.value.length>0){
			
		// rest api 호출
			const url = '${pageContext.request.contextPath}/api/member/idcheck.json?id='+e.value;
			const headers={"Content-Type":"application/json"}
			const {data} = await axios.get(url,{headers});
			//결과값 받기
			console.log(data);
			if(data.ret === 1){
				//사용불가
				document.getElementById("lbl_check").innerText='사용불가';
			}
			else if(data.ret === 0){
				//사용가능
				document.getElementById("lbl_check").innerText='사용가능';
				}
		
			else{
				document.getElementById("lbl_check").innerText='아이디';
			}
		}
			
	}
			
	</script>
</body>
</html>