<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>게시판 글쓰기</title>
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
   <div class="container">
      <div class="row">
         <div class="col-sm">
            <h1>게시판 글쓰기</h1>
            <form action="/board/Write.do" >
               <div class="form-floating mb-2">
                        <input type="text" id="title" class="form-control" autofocus required >
                        <label for="title" class="form-label">제목</label>
                    </div>
                    
                    <div class="mb-2">
                       <div id="editor" style="height:300px;">
                    <p>Hello World!</p>
                    <p>Some initial <strong>bold</strong> text</p>
                    <p><br></p>
                  </div>
                    </div>
                    
                    <div class="form-floating mb-2">
                        <input type="text" id="writer" class="form-control" required >
                        <label for="writer" class="form-label">작성자</label>
                    </div>
                    
               <input type="submit" value="글쓰기" class="btn btn-primary" 
               onclick="getEditorContent()">
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
      
      // 위쪽에 있는 태그중에서 id가 editor인것을 찾아서 toolbar는 toolbaroptions의 값으로 대체하고 테마를 snow로 해서 변경
      const quill = new Quill('#editor', {
           modules: {
             toolbar: toolbarOptions
           },
           theme: 'snow'
      });
      
      function getEditorContent(){
   		  const title		=document.getElementById('title');
   		  const writer		=document.getElementById('writer');
   		  const content		=quill.root.innerHTML; //위쪽의 editor객체를 통해서 가져오기
   		  
	   		console.log(title.value);
	   		console.log(writer.value);
	   		console.log(content.value);
   	  }
   </script>
   <!-- 2. Bootstrap용 js는 body에 위치해야 함! -->
   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
      crossorigin="anonymous"></script>
</body>
</html>