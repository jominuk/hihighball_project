<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
   @media screen and (min-width: 650px) {
      .updateCon {
         width: 500px; 
         margin: 80px auto 0; padding: 30px 0;
         border: 2px solid rgb(206,226,255); text-align: center;
      }
      .upIn { font-size: 28px; }
      .upArea{
         width: 77%; height: 500px; border: 2px solid #c7c7c7;
         resize: none; margin: 30px 0; padding: 20px; border-radius: 20px;
      }
      .upBut {
         display:flex;  justify-content: center;
         margin:30px 0;
      }
      button { margin:0 30px; }
   }
   
   @media screen and (max-width: 649px) {
      .updateCon {
         width: 340px;
         margin: 80px auto 0; padding: 30px 0;
         border: 2px solid rgb(206,226,255); text-align: center;
      }
      .upIn {   width:77%; font-size: 28px;}
      .upIn1{width: 77%;}
      .upArea{
         width: 77%; height: 500px; border: 2px solid #c7c7c7;
         resize: none; margin: 30px 0; padding: 20px; border-radius: 20px;
      }
      .upBut {
         display:flex;  justify-content: center; 
         margin:30px 0;
      }
   }
   
</style>

   <div class="bn bn-board"> 
        <div class="dark"></div>
        <h2>Detail</h2>
    </div>
   
   <form class="updateCon" action="/board/postupdate" method="post" enctype="multipart/form-data">
      <input type="hidden" name="bnum" value="${param.bnum}">
      <input type="hidden" name="profile" value="<%=filename %>">
      <ul>
         <li><input type="text" name="subject" value="${board.subject}" class="join-input upIn" placeholder="${post.subject}"></li>
         <li>
            <div class="filebox">
                   <label for="postfile" class="btn"><span>파일 찾기</span></label>
                   <input id="postfile" type="file" name="postfile" onchange="previewImage(this)">
                   <div id="imagePreview"></div>
                   <c:if test="${not empty board.image}">
                        <img src="<c:url value='/resources/upload/${post.postfile}'/>" alt="Current Image">
                    </c:if>
               </div>
         </li>
         <li><textarea name="contents" class="upArea" placeholder="${post.contents}">${board.contents}</textarea></li>
         <li>
            <div class="upBut">
               <button type="submit" class="btn">수정 완료</button> 
               <button type="button" onclick="window.history.back();" class="btn">취 소</button>
            </div>
         </li>
      </ul>
   </form>



<%@ include file="../includes/footer.jsp" %>




