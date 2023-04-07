<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>게시글 수정</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
   <!--Bootstrap 용 CSS CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
       integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
</head>
<body>      
   <div class="container">
      <div style="width:700px; border:1px solid #cccccc; margin :0px auto;padding:40px;">
      <h2>게시글수정</h2>
      <br />
         <form action="update.do" method="post">
         <div class="mb-3 row">
             <label for="staticEmail" class="col-sm-2 col-form-label">글번호</label>
             <div class="col-sm-10">
                  <input type="text" class="form-control" value="${obj.no}" readonly />
             </div>
           </div>
        
           <div class="mb-3 row">
             <label for="inputPassword" class="col-sm-2 col-form-label">제목</label>
             <div class="col-sm-10">
            <input type="text" class="form-control" value="${obj.title}" name="title" />
             </div>
           </div>
           
           <div class="mb-3 row">
             <label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
             <div class="col-sm-10">
                  <textarea class="form-control" rows="6" name="content" >${obj.content}</textarea>
             </div>
           </div>
           
           <div class="mb-3 row">
             <label for="inputPassword" class="col-sm-2 col-form-label">작성자</label>
             <div class="col-sm-10">
                  <input type="text" class="form-control" value="${obj.writer}" name="writer" />
             </div>
           </div>
           
           <div class="mb-3 row">
             <label for="inputPassword" class="col-sm-2 col-form-label">조회수</label>
             <div class="col-sm-10">
                  <input type="text" class="form-control" value="${obj.hit}" readonly />
             </div>
           </div>
           
           <div class="mb-3 row">
             <label for="inputPassword" class="col-sm-2 col-form-label">날짜</label>
             <div class="col-sm-10">
                  <input type="text" class="form-control" value="${obj.regdate}" readonly />
             </div>
           </div>
           <br />
           
           <div class="mb-3">
              <div class="col-sm-10">
             <button type="submit" class="btn btn-primary">수정하기</button>
             <a class="btn btn-primary" href="selectone.do?no=${obj.no}">목록으로 이동</a>
             </div>
          </div>
           </form>
      </div> 
   </div>    
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js" 
        integrity="sha512-frFP3ZxLshB4CErXkPVEXnd5ingvYYtYhE5qllGdZmcOlRKNEPbufyupfdSTNmoF5ICaQNO6SenXzOZvoGkiIA==" 
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</body>
</html>
