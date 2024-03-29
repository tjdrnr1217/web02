<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>물품 등록</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='main.css'>
<!-- 1. Bootstrap용 css CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<script src='main.js'></script>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<style>
.container {
	border: 1px solid #ced4da;
	padding: 50px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container space">
		<div class="row">
			<div class="col-sm">
				<h1>물품 목록</h1>
				<hr>
				<form id="form" action="write.do" method="post">
					<div class="form-floating mb-2">
                        <input type="text" name="iname" id="iname" class="form-control" autofocus required >
                        <label for="iname" class="form-label">물품명</label>
                    </div>
                    
                    <div class="mb-2">
                    	<div id="editor" style="height:300px;">
						  <p>물품설명</p>
						</div>
                    </div>
                    
                    <textarea id="icontent" name="icontent" style="display:none;"></textarea>
                    
                    <div class="form-floating mb-2">
                        <input type="number" name="iprice" id="iprice" class="form-control" required >
                        <label for="iprice" class="form-label">가격</label>
                    </div>
                    
                    <div class="form-floating mb-2">
                        <input type="number" name="iquantity" id="iquantity" class="form-control" required >
                        <label for="iquantity" class="form-label">수량</label>
                    </div>
                    
					<input type="button" value="물품등록" class="btn btn-primary" onclick="insertItem()">
				</form>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script>
		
		const toolbarOptions = [
		  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
		  ['blockquote', 'code-block'],

		  [{ 'header': 1 }, { 'header': 2 }],               // custom button values
		  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
		  [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
		  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
		  [{ 'direction': 'rtl' }],                         // text direction

		  [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
		  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

		  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
		  [{ 'font': [] }],
		  [{ 'align': [] }],

		  ['clean']                                         // remove formatting button
		];
		
		// 위쪽에 있는 태그중에서 id가 editor인것을 찾아서 toolbar는 toolbarOptions의 값으로 대체하고 테마를 snow로 해서 변경
		const quill = new Quill('#editor', {
			  modules: {
			    toolbar: toolbarOptions
			  },
			  theme: 'snow'
		});
	
		function insertItem(){
			var iname = document.getElementById("iname");
			var iprice = document.getElementById("iprice");
			var iquantity = document.getElementById("iquantity");
			
			// 정규식
			var reg = /^[0-9]+/g;
				// 유효성 검사
				if(iname.value.length <= 0){
					alert("물품명을 입력하세요");
					iname.focus();
					return false;
				}
				if(iprice.value.length <= 0){
					alert("물품가격을 입력하세요");
					iprice.focus();
					return false;
				}
				if(iquantity.value.length <= 0){
					alert("물품수량을 입력하세요");
					iquantity.focus();
					return false;
				}
				
				// div태그의 내용을 전송할 수 있게 변경
				// 게시판내용(editor) 가져오기
				const divContent = quill.root.innerHTML;
				// textarea에 그 값 넣기
				document.getElementById("icontent").value = divContent;
				// 전송시킴
				document.getElementById("form").submit();
		}
		
	</script>
	<!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
		crossorigin="anonymous"></script>
</body>
</html>