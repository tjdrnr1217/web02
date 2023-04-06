<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>게시판글쓰기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet" />
</head>

<body>
	<div class="container">
        <div style="width:800px; margin:0 auto; padding: 50px; border:1px solid #efefef;">
        	<h3>게시판글쓰기</h3>
        	<hr />
            <div class="row">
                <div class="col-sm">
	                <div class="form-floating mb-2">
	                    <input type="text" id="title" class="form-control" autofocus required />
	                    <label for="title" class="form-label">제목</label>
	                </div>
	                
					<div style="margin-bottom:5px;">
	                    <div id="editor" style="height:300px;">
						  <p>Hello World!</p>
						  <p>Some initial <strong>bold</strong> text</p>
						  <p><br></p>
						</div>
	                </div>
	                
	                <div class="form-floating mb-2">
	                    <input type="text" id="writer" class="form-control" required />
	                    <label for="writer" class="form-label">작성자</label>
	                </div>

	                <div>
                    	<input type="submit" value="글쓰기" class="btn btn-primary" onclick="getEditorContent()"/>
                    </div>
                </div>
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
	
		// 위쪽에 있는 태그중에서 id가 editor인것을 찾아서 toolbar는 toolbarOptions의 값으로 대체하고 태마를 snow로 해서 변경
		const quill = new Quill('#editor', {
			modules: {
				toolbar: toolbarOptions
			},
			theme: 'snow'
		});
		
		function getEditorContent() {
			const title 	= document.getElementById("title");
			const writer 	= document.getElementById("writer");
			const content 	= quill.root.innerHTML; //위쪽의 editor객체를 통해서 가져오기
			
			
			//유효성 검사
			if(title.value.length <= 0){
				alert('제목을 입력하세요.');
				title.focus();
				return false // 아래쪽 소스코드를 수행하지 않음. 함수가 종료됨.
			}
			
			if(writer.value.length < 1){
				alert('작성자를 입력하세요.');
				title.focus();
				return false; // 함수 종료
			}
			
			//<form action="write.do" method="post">
				//<input type="text" name="title" value="">
			//</form>
			var form = document.createElement("form");
			form.action = "Write.do";
			form.method = "post";
			form.style.display="none";
			
			
			var input1 = document.createElement("input");
			input1.type = "text";
			input1.name = "title";
			input1.value = title.value;
			form.appendChild(input1);
			
			var input2 = document.createElement("input");
			input2.type = "text";
			input2.name = "content";
			input2.value = content;
			form.appendChild(input2);
			
			var input3 = document.createElement("input");
			input3.type = "text";
			input3.name = "writer";
			input3.value = writer.value;
			form.appendChild(input3);
			
			document.body.appendChild(form);
			form.submit();
			
			
			console.log(title.value);
			console.log(writer.value);
			console.log(content.value);
		}
	</script>
</body>
</html>