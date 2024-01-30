<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../includes/header.jsp" %>
   

<script>
   var result = "${meg}";
   if (result) {
       alert("게시물 등록되었습니다!");
       <% session.removeAttribute("result"); %>
   }
   
   
   var updateNo ="${updateNo}"
   if (updateNo !== "") {alert(updateNo);}
   
   
   // 삭제에 대한 alert창
   var YES = "${YES}"
   var NO = "${NO}"
   if (YES !== "") {alert(YES);} 
   else if (NO !== "") {alert(NO);}
</script>

<style>
   .profile-img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}


</style>
     <div class="bn bn-board">
     <div class="dark"></div>
     <h2>Board LIST</h2>
   </div>
    
      <form name="searchForm" action="/board/search" method="post">
      <div class="rc-radioBun">
         <input id="subject" type="radio" name="keyfield" value="subject" checked>
         <label for="subject">제 목</label>
         <input id="contents" type="radio" name="keyfield" value="contents">
         <label for="contents">내 용</label>
      </div>
      <div class="searchBtn">
         <input type="text" name="keyword" placeholder="검색어 입력" class="join-input searchIn">
         <button onclick="keywordCheck()" class="btn">검 색</button>
         <button class="btn">초기화</button>
      </div>
   </form>
   
    <div class="postgru">
      <p>전체 게시물 수량 : ${totalPosts}</p>
      <% if (id != null) { %>
      <a href="postform" class="btn"><span>글쓰기</span></a>
      <% } %>
   </div>

    <div class="container">
       <c:forEach items="${blist}" var="blist">
          <ul class="rc-card">
             <a href="${path}/board/read?no=${blist.bnum}">
                  <li>
                     <c:if test="${not empty blist.postfile}">
                          <img src="/resources/upload/${blist.postfile}" alt="Image" class="rc-card-img">
                      </c:if>
                      <c:if test="${empty blist.postfile}">
                          <img src="/resources/imgs/noPhoto.jpg" alt="No Photo" class="rc-card-img">
                      </c:if>
                  </li>
                  <li><h6>${blist.subject}</h6></li>
                  <li><p class="rc-card-txt">${blist.contents }</p></li>
                  <li class="rc-card-num">
                <c:if test="${not empty blist.profile}">
                     <img src="/resources/profile/${blist.profile}" alt="Profile Image" class="profile-img">
                 </c:if>
                 <c:if test="${empty blist.profile}">
                     <img src="/resources/imgs/noPhoto.jpg" alt="Default Profile Image" class="profile-img">
                 </c:if>
                     <p class="postId">${blist.id }</p>
                      <p>${blist.count}</p>
                  </li>
               </a>
            </ul>
       </c:forEach>
    </div>



    <%@ include file="../includes/footer.jsp" %>
    
    
    
    
    
    
    
    
    
    
    
    
    
    