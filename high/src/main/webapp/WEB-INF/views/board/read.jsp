<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
   .bn-detail{
      background: url("/resources/imgs/detail.jpg")no-repeat center center;
        background-size: cover;
        background-attachment: fixed;
   }
</style>


   <div class="bn bn-detail"> 
        <div class="dark"></div>
        <h2>Detail</h2>
    </div>

<div class="Contai">
   <div class="heart1">
       <img id="heart" src="/resources/imgs/like_off.png" alt="안좋아요" onclick="toggleLike()">
       <div class="heartLine"></div>
       <p>like</p>
   </div>
      
    <ul id="re-container">
        <li>${board.subject}</li>
        <li>
            <span>${board.id}</span>
            <span><fmt:formatDate pattern="yyyy-MM-dd " value="${board.re_date}" /></span>
        </li>

        <li>
           <div class="rc-detailbtn">
               <a href="/board/blist" class="btn">목 록</a>
              <a onclick="updatePost(${board.bnum})" class="btn">수 정</a>
              <a onclick="deletePost(${board.bnum})" class="btn">삭제</a>
         </div>
        </li>
        
        <li>
          <c:choose>
              <c:when test="${not empty board.postfile}">
                  <img src="/resources/upload/${board.postfile}" alt="Image" class="re-img">
              </c:when>
              <c:otherwise>
                  <img src="/resources/imgs/noPhoto.jpg" alt="Image" class="re-img">
              </c:otherwise>
          </c:choose>
      </li>

      <div class="heart2">
          <img id="heart" src="/resources/imgs/like_off.png" alt="안좋아요" onclick="toggleLike()">
      </div>

       <li style="white-space: pre-line;">${board.contents}</li>

    </ul>
    </div>
<%
   if(id != null){
%>
     <form id="re-container" action="/board/read"  onsubmit="return submitReplyForm();">
       <input type="hidden" name="bnum" value="${board.bnum}">
       <input type="text" name="id" value="<%= id %>" readonly class="re-input">
       <textarea id="replyContents" name="recontents" placeholder="댓글을 입력해주세요"  class="reply-in"  required></textarea>
       <button type="submit" class="btn btn-rePost" >작 성</button>
   </form>
   <% } else { %>
    <div></div>
   <% } %>   
   
    <div id="commentList"></div>
   
   <script>
      $(document).ready(function () {
          var initialBnum = "${board.bnum}";
          fetchComments(initialBnum);
      });
      
      function deletePost(bnum) {
          var result = confirm("삭제하시겠습니까?");
          
          if (result) {
              window.location.href = "/board/deletepost?bnum=" + bnum;
          }
      }
      
      function updatePost(bnum) {
         var result = confirm("수정하시겠습니까?")
         
         if(result){
            window.location.href = "/board/postupdate?bnum=" + bnum;
         }
         
      }
   
      
      
      
   // 댓글 입력 ajax 
      function submitReplyForm() {
          var bnum = "${board.bnum}";
          var id = "<%= id %>";
          var recontents = document.getElementsByName("recontents")[0].value;
      
          var data = {
              "bnum": bnum,
              "id": id,
              "recontents": recontents
          };
   
          $.ajax({
              type: "POST",
              contentType: "application/json",
              url: "/board/read",
              data: JSON.stringify(data),
              success: function (response) {
                  if (response === "success") {
                     $('#replyContents').val('')
                     fetchComments(bnum);
                     // 성공했을 때 GET 비동기를 호출
                  }
              },
              error: function (error) { alert("댓글을 다시 확인해주세요", error); }
          });
          return false;
      }
      

       // 댓글 목록 ajax 
       function fetchComments(bnum) {
           $.ajax({
               type: "GET",
               url: "/board/getReplies",
               data: { bnum: bnum },
               success: function (comments) {
                   var html = "";
                   for (var i = 0; i < comments.length; i++) {
                       var comment = comments[i];
                       var Date = formatDate(comment.redate);

                       html +=
                          "<div id='reply' data-renum='" + comment.renum + "'>" +
                          "<div class='reply-da'>" +
                          "<input type='text' name='id' value='" + comment.id + "' readonly class='re-in'>" +
                          "<p>" + Date + "</p>" +
                          "</div>" +
                          // 수정버튼을 눌렀을 때 input값을 불러오는 로직  
                          (comment.isUpdating ? "<input type='text' class='update-input' value='" + comment.recontents + "'>"
                                : "<p class='reply-content'>" + comment.recontents + "</p>") +
                          "<div class='reply-Btn'>" +
                          (comment.isUpdating ? "<button onclick='confirmUpdate(" + comment.renum + ")' class='replyDeBtn'>완 료</button>"
                                : "<button onclick='replyUpdate(" + comment.renum + ")' class='replyDeBtn'>수 정</button>") +
                          "<button onclick='deleteReply(" + comment.renum + ")' class='replyDeBtn'>삭 제</button>" +
                          "</div>" +
                          "</div>";
                   }
                   $("#commentList").html(html);
               },
               error: function (error) { console.log("Error fetching comments:", error); }
           });
       }
       // 날짜와 시간을 추출하기 위한 코드 
      function formatDate(dateString) {
          var date = new Date(dateString);
          var year = date.getFullYear();
          var month = ('0' + (date.getMonth() + 1)).slice(-2);
          var day = ('0' + date.getDate()).slice(-2);
          var hours = ('0' + date.getHours()).slice(-2);
          var minutes = ('0' + date.getMinutes()).slice(-2);
   
          return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes;
      }
       // 수정버튼을 누르면 새로운 input이 튀어나오게 만듬
       function replyUpdate(renum) {
          var ReplyList = $("#commentList").find("[data-renum='" + renum + "']");
          var existingContent = ReplyList.find(".reply-content").text();
          ReplyList.find(".reply-content").html("<input type='text' class='update-input' value='" + existingContent + "'>");
          ReplyList.find(".reply-Btn").html(
                "<button onclick='confirmUpdate(" + renum + ")' class='replyDeBtn'>확 인</button>" +
                "<button onclick='updateCancle()' class='replyDeBtn'>취 소</button>"
                );
          ReplyList.find(".update-input").addClass("join-input");
      }
       
       // 수정 취소 버튼을 누르면 복구
       function updateCancle(renum) {fetchComments("${board.bnum}"); }      
   
      // 댓글 수정 ajax
      function confirmUpdate(renum) {
         var ReplyList = $("#commentList").find("[data-renum='" + renum + "']");
         var id = ReplyList.find("[name='id']").val();
         var bnum = "${board.bnum}";
         var recontents = ReplyList.find(".update-input").val();

          var updatedata = {
              "renum": renum,
              "id": id,
              "bnum": bnum,
              "recontents": recontents
          };
          
           $.ajax({
               type: "PUT",
               url: "/board/" + renum,
               data: JSON.stringify(updatedata),
               contentType : "application/json;",
               success: function (response) {
                   if (response === "success") {
                       console.log("Update successful");
                       ReplyList.find(".reply-content").text(recontents);
                       ReplyList.find(".reply-Btn").html(
                           "<button onclick='replyUpdate(" + renum + ")' class='replyDeBtn'>수 정</button>" +
                           "<button onclick='deleteReply(" + renum + ")' class='replyDeBtn'>삭 제</button>"
                       );
                   } else {
                       console.log("Update failed");
                   }
               },
               error: function (error) {
                   console.log("Error:", error);
               }
           });
       }
   
      // 댓글 삭제 ajax 
      function deleteReply(renum) {
          var confirmed = confirm("삭제하실래요?");
          
          if(confirmed) {
             $.ajax({
                  type: "DELETE",
                  url: "/board/" +renum,
                  data : {renum : renum},
                  success: function (response) {
                        if (response === "success") {
                           $("#commentList").find("[data-renum='" + renum + "']").remove();
                        } else {
                            alert("Error deleting reply. Please try again");
                        }
                    },
                    error: function (error) {
                        console.log("Error:", error);
                    }
               })
          }
      }

       
       

       function toggleLike() {
           var boardId = "${board.id}";
           var boardNum = "${board.bnum}";

           $.ajax({
               type: "POST",
               url: "/board/toggleLike",
               data: { id: boardId, bnum: boardNum },
               success: function(result) {
                   updateLikeStatus(); // 좋아요 상태 갱신
               },
               error: function(err) {
                   console.log("Error: " + err);
               }
           });
       }

       // 좋아요 상태 갱신 함수
       function updateLikeStatus() {
           var boardId = "${board.id}";
           var boardNum = "${board.bnum}";

           $.ajax({
               type: "GET",
               url: "/board/getLikeStatus",
               data: { id: boardId, bnum: boardNum },
               success: function(result) {
                   if (result === "liked") {
                       $("#heart").attr("src", "/resources/imgs/like_on.png");
                   } else {
                       $("#heart").attr("src", "/resources/imgs/like_off.png");
                   }
               },
               error: function(err) {
                   console.log("Error: " + err);
               }
           });
       }

       // 페이지 로드 시 좋아요 상태 초기화
       $(document).ready(function() {
          updateLikeStatus();
       });

   </script>

<%@ include file="../includes/footer.jsp" %>


   

