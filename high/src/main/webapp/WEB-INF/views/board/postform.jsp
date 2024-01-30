<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

   <div class="bn bn-login-bg">
     <div class="dark"></div>
     <h2>Writing RECIPE</h2>
   </div>
   
   <form action="postForm" enctype="multipart/form-data" method="post" class="container">

      <input type="hidden" name="id" value="<%=id %>">
      <input type="hidden" name="profile" value="<%=filename %>">
      
        <div id="boardForm1">
            <input type="text" name="subject" placeholder="제목을 입력해 주세요" required class="postIn rcTitle">
            <div class="filebox">
                <label for="postfile" class="btn"><span>파일 찾기</span></label>
                <input id="postfile" type="file" name="postfile" onchange="previewImage(this)">
                <div id="imagePreview"></div>
            </div>
        </div>

        <div id="boardForm2">
            <textarea class="teArea" name="contents" placeholder="내용을 입력해 주세요"></textarea>
            <div class="rcBtnGrp">
                <button type="submit" class="btn rcBtn">등 록</button>
                <button class="btn rcBtn" onclick="window.history.back();">취 소</button>
            </div>
        </div>
   </form>

<%@ include file="../includes/footer.jsp" %>

