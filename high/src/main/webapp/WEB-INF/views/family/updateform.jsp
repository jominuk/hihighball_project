<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%@ include file="../includes/header.jsp" %>
    
    <style>
      #joinFormBox {text-align: center;}
      .bn-update {
         background: url("/resources/imgs/update.jpg")no-repeat center center;
           background-size: cover;
           background-attachment: fixed;
      }
      
      #imagePreview{
         width:100px; height:100px;
         border-radius:30px;
      }
      .btn-up{
         margin:0 auto;
      }
   
   </style>
   
   <script>
   
   </script>
   <div class="bn bn-update">
        <div class="dark"></div>
        <h2>MyPage UPDATE</h2>
    </div>
    
    
    <form name="updateForm" action="/family/updateform" method="post" enctype="multipart/form-data">
       <input type="hidden" name="id" value="<%=id %>">
       
        <ul id=joinFormBox>
           <li class="filebox">
                <label for="filename" class="btn btn-up"><span>프로필 등록</span></label>
                <input id="filename" type="file" name="filename" onchange="previewImage(this)">
                <div id="imagePreview"></div>
            </li>
            <li>
               <label>비밀번호 : </label>
                <input type="password" name="pwd" value="${family.pwd}"  class="join-input mbJoinInp" required>
            </li>
            <li>
                <label>전화번호 : </label>
                <input type="tel" name="tel" value="${family.tel}" class="join-input mbJoinInp" placeholder="${myInfo.tel}" required>
            </li>
            <li>
                <label>이메일 : </label>
                <input type="email" name="email" value="${family.email}" class="join-input mbJoinInp" placeholder="${myInfo.email}" required>
            </li>
         <li></li>
            <li>
                <div class="join-btnGrp">                    
                    <button type="submit" class="btn">정보 수정</button>
               <button class="btn" onclick="window.history.back();">취 소</button>
                </div>
         </li>
        </ul>
    </form>    
    
    
    <%@ include file="../includes/footer.jsp" %>