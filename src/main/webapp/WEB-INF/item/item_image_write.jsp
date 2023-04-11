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
<title>${title}</title>
</head>
<body>
   <div class="container">
      <div class="row">
         <div class="col">
            <h3>${title}</h3>
            <!-- 주소창을 바꾸고 정보는 숨겨서, 정보의 내용중에는 파일도 있음. -->
            <form id="form" action="imagewrite.do" method="post" enctype="multipart/form-data">
               <input type="text" value="${ino}" name="ino" class="form-control" readonly /><br />
               <div>
                  <img id="img" src="${pageContext.request.contextPath}/resource/images/default.jpg" style="cursor:pointer;" onclick="clickImage()" >               
                  <input type="file" name="file" id="file" class="form-control" style="display:none;" onchange="imageChange(this)" /><br />
               </div>
               <input type="button" value="이미지등록" class="btn btn-primary" onclick="insertImageItem()" />
               <a href="select.do" class="btn btn-primary">목록</a>
            </form>
         </div>
      </div>
      <form id="form1" action="imagewritebatch.do?ino=${ino}" method="post" enctype="multipart/form-data">
         <c:forEach var="idx" begin="1" end="3" step="1">
            <img class="imgs" src="${pageContext.request.contextPath}/resource/images/default.jpg" style="cursor:pointer;">               
            <input type="file" name="file[]" class="form-control" style="display:block;" onchange="imageChangeBatch(this, '${idx-1}')" /><br />
         </c:forEach>
         <input type="button" value="이미지일괄등록" class="btn btn-primary" onclick="insertImageBatch()" />
         <a href="select.do" class="btn btn-primary">목록</a>
      </form>
      등록된 이미지 목록<br />   
      <c:forEach var="obj" items="${itemno}" >
      	${obj.no} =>
         <img src="${pageContext.request.contextPath}/item/image?no=${obj.no}" style="width:100px; height:100px">
         <input class="btn btn-danger" type="button" value="이미지삭제" onclick="itemImageDelete('${obj.no}', '${ino}')"/>
         <input class="btn btn-warning" type="button" value="이미지수정" onclick="itemUpdateModal('${obj.no}', '${ino}')"/>
         <br/>
      </c:forEach>
   </div>
   
   <!--  이미지 수정 모달창 -->
   <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<form action="imageUpdate.do" method="post" enctype="multipart/form-data">
 	 <div class="modal-dialog">
    	<div class="modal-content">
      	<div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">이미지수정</h5>
        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      	</div>
      	<div class="modal-body">
        	이미지번호 : <input type="text" name="imageNo" id="modal_image_no" readonly /><br/>
        	현재이미지 :	 <img src="" style="width:100px; height:100px" id="modal_image_src"/><br/>
        	<input type="hidden" name="ino" value="${ino}"/>
        	변경이미지 :	 <input type="file" name="file" id = "modal-image_file"/>
      	</div>
      	<div class="modal-footer">
      		<input type="submit" class="btn btn-primary" value="이미지변경">
        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        
      </div>
    </div>
  </div>
  </form>
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
   //   document.getElementById("아이디"); id가 일치하는 1개 찾기
   //   document.getElementsByName("name값"); name값이 일치하는 n개 찾기
   //   document.getElementsByClassName("class값"); class값이 일치하는 n개 찾기
   //   document.getElementsByTagName("img"); 태그가 img인 n개 찾기
   
      const imgs = document.getElementsByClassName("imgs"); // <img src class="imgs" />
      const files = document.getElementsByName("file[]"); // <input type="file" name="file[]" />
      
      function itemUpdateModal(no, ino) { // 이미지번호, 물품번호
    	  const imageNo   = document.getElementById("modal_image_no");
    	  const imageSrc  = document.getElementById("modal_image_src");
    	  const imageFile = document.getElementById("modal_image_file");
    	  
    	  imageNo.value = no;
    	  imageSrc.src = '${pageContext.request.contextPath}/item/image?no=' + no;
    	  
    	  const modal = new bootstrap.Modal(document.getElementById("exampleModal"),{});
    	  modal.show();
      }
      
      
      function itemImageDelete(no, ino){ // 삭제할 이미지번호, 물품번호
         const ret = confirm('삭제할까요?');
         if(ret === true) {
            // <form action="imagedelete.do" method="post" style="display:none;">
            var form = document.createElement("form");
            form.setAttribute("action", "imagedelete.do");
            form.setAttribute("method", "post");
            form.style.display="none";
            
            // <input type="hidden" name="imageno" value="삭제할번호"/>
            var input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", "imageno");
            input.setAttribute("value", Number(no));
            
            // <input type="hidden" name="imageno" value="삭제할번호"/>
            var input1 = document.createElement("input");
            input1.setAttribute("type", "hidden");
            input1.setAttribute("name", "ino1");
            input1.setAttribute("value", Number(ino));
            
            
            // form 태그에 추가
            form.appendChild(input);
            form.appendChild(input1);
            
            // body에 추가
            document.body.appendChild(form);
            
            // form 전송
            form.submit();
         }
      }
      function clickImage(){
         document.getElementById("file").click();      
      }
      function imageChange(e){
         const img = document.getElementById("img");
         console.log(e.files);
         if(e.files.length > 0) { // 첨부
            // 파일을 첨부하면 크롬에서 blob:http://1.237.... 와 같은 가상의 url을 추가해준다.
            console.log(URL.createObjectURL(e.files[0]));
            img.src = URL.createObjectURL(e.files[0]); // 가상의 url정보를 생성해서 취함.
         }
         else { // 취소
            img.src="${pageContext.request.contextPath}/resource/images/default.jpg"
            
         }
      }
      
      function insertImageItem(){
         var imagefile = document.getElementById("file");
         // 유효성 검사 한 후
         if(imagefile.value.length <= 0){
            alert("이미지 파일을 삽입하세요");
            return false;
         }
         //전송
         document.getElementById("form").submit();
      }
      
      function imageChangeBatch(e, idx){
         if(e.files.length>0) {
            imgs[ Number(idx) ].src=URL.createObjectURL( e.files[0] );
         }
         else{
            imgs[ Number(idx) ].src="${pageContext.request.contextPath}/resource/images/default.jpg"
         }
         console.log(imgs);
         console.log(imgs.length);
         console.log(e.files);
         console.log(idx);

      }
      function insertImageBatch() {
         //유효성 검사
         var chk=0;
         for(let i=0;i<files.length;i++) { // files 전체 반복
            console.log(imgs[i]);
            if(files[i].value.length <= 0) { // 첨부하지 않은것을 발견
               alert("이미지 파일을 삽입하세요"); // 알림창 표시
               chk = 1; 
               break; // 반복문 종료
            }
         }
         if(chk===0){ // if문을 한번도 수행하지 않았다면 form 전송
            document.getElementById("form1").submit(); 
         }
      }
   
   </script>
</body>
</html>