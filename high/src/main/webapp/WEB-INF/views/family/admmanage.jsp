<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<%@ include file="../includes/header.jsp" %>

<style>
      .container{padding:0px;}
      .tabBox{ margin: 0 auto;}
        .tab{
            width: 815px; margin:20px auto 0;
        }
        .tabnav{ width:815px; border:1px solid #ddd;}
        .tabnav li{
            display: inline-block; height:46px;
            text-align:center; border-right:1px solid #ddd;
        }
        .tabnav li a:before{
            content:""; position:absolute; left:0; top:0px; width:100%; height:3px;
        }
        .tabnav li a.active:before{background:#7ea21e;}
        .tabnav li a.active{border-bottom:1px solid #fff;}
        .tabnav li a{
            position:relative; display:block;
            background: #f8f8f8; color: #000; padding:0 30px; line-height:46px;
            text-decoration:none; font-size:16px;
        }
        .tabnav li a:hover,
        .tabnav li a.active{background:#fff; color:#7ea21e; }
        .tabcontent{padding: 20px; height:244px; border:1px solid #ddd; border-top:none;}

        .ageGraph { display: flex; margin-bottom: 15px;}
        .chat {
            position: relative; width: 0; height: 30px; margin-left: 20px;
            border-radius: 10px; background: #bee0ff; overflow: hidden;
            transition: 0.8s width 2s;
       }
       .chat > p {
          position: absolute; top: 50%; right: 5px; padding-right:5px;
           color: #414141; font-size: 14px; transform: translateY(-50%);
        }
        
   
   .g-list {width:100%; border-collapse:collapse; white-space: nowrap;}
   .g-list th, .g-list td {padding:5px 10px; text-align:center; overflow: hidden; text-overflow: ellipsis;}
   .g-list th {background:#eee;}
   .g-list td {background:#f8f8f8; border-bottom:1px solid #ccc; max-width: 200px;}
   
   
   .g-register {width:340px; margin:0 auto; padding:20px; background:#f2f2f2; border-radius:10px;}
   .g-register li {padding:5px 0;}
   .g-register li:last-child {display:flex; justify-content:center; padding-top:30px;}
   
   
   .adm-container {display:flex; flex-wrap:wrap; justify-content:center;}
      
   #g-search, #b-search, #re-search {
      display:block; width:300px; height: 40px; margin:30px auto;
      border-radius: 10px; padding-left:20px;
      }
   .adm-wrap {width:70%; overflow:hidden; paddi }
   
   
   .g-list a, .b-list a, .m-list a, .re-list a {color:#0652DD;}
        
        
    .pagenation {display:flex; justify-content:center; margin-top:50px; width:100%;}
   .pagenation a {padding:10px 15px; background:#eee;}
   .pagenation a.active {color:#f6f6f6; background:#44bd32;}
   .pagenation a.prev, .pagenation a.next {color:#f6f6f6; background:#487eb0;}
   .pagenation a.prev {border-radius:10px 0 0 10px;}
   .pagenation a.next {border-radius:0 10px 10px 0;}
   
   .table{
      margin: 20px 0 ;
   }
    </style>

    <script>
    
   function admDeleteCheck() {
       var selectId = document.querySelector('input[name="id"]:checked');
       console.log('Selected ID:', selectId ? selectId.value : 'None');
       if (selectId) {
           var result = confirm('정말로 회원을 추방하시겠습니까?');
           if (result) {
               document.infoDeleteForm.id.value = selectId.value;
               console.log('Form ID Value:', document.infoDeleteForm.id.value);
               document.infoDeleteForm.action = 'admDelete';
               document.infoDeleteForm.submit();
           } else {
               location.href='family/admfamilyList';
           }
       } else {
           alert('회원을 선택해주세요.');
       }
   }
   
   
   
    $(function(){
        $('.tabcontent > div').hide();
        $('.tabnav a').click(function () {
            $('.tabcontent > div').hide().filter(this.hash).fadeIn();
            $('.tabnav a').removeClass('active');
            $(this).addClass('active');

            $('.ageGraph .chat').each(function () {
                var count = parseInt($(this).text());
                var maxWidth =1500;
                var width = (count / 100) * maxWidth;
                $(this).css('width', width + 'px');
            });
        
            return false;
        }).filter(':eq(0)').click();
        
    });
   
    $(function(){
      $('#g-search').keyup(function(){
         var value = $(this).val().toLowerCase();
         
         $('#g-row > tr').filter(function(){
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      });
      
      $('#b-search').keyup(function(){
         var value = $(this).val().toLowerCase();
         
         $('#b-row > tr').filter(function(){
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      });
      
      $('#re-search').keyup(function(){
         var value = $(this).val().toLowerCase();
         
         $('#re-row > tr').filter(function(){
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      });
      
      $('#m-search').keyup(function(){
         var value = $(this).val().toLowerCase();
         
         $('#m-row > tr').filter(function(){
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
         });
      });
   });
    </script>


  <div class="bn bn-login-bg"> 
    <div class="dark"></div>
    <h2>ManageMent</h2>
  </div>

<h3>예약통계</h3>
  <div class="tabBox">

   <div class="tab">
        <ul class="tabnav">
          <li><a href="#tab01">예약 연령</a></li>
          <li><a href="#tab02">발그레 연령</a></li>
          <li><a href="#tab03">퍼지 연령</a></li>
          <li><a href="#tab04">핌리코 연령</a></li>
          <li><a href="#tab05">네셔널 연령</a></li>
          <li><a href="#tab06">지오 연령</a></li>
        </ul>

        <div class="tabcontent">
           <div id="tab01">
               <c:forEach var="entry" items="${ageCounts}">
                <div class="ageGraph">
                    <p>${entry['ageGroup']}</p>
                    <div class="chat">
                        <p>${entry['count']}</p>
                    </div>
                </div>
            </c:forEach>
          </div>
      

          <div id="tab02">
            <div class="ageGraph">
                <p>20대</p>
                <div class="chat">
                    <p>${Balgre20}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>30대</p>
                <div class="chat">
                   <p>${Balgre30}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>40대</p>
                <div class="chat chat3">
                   <p>${Balgre40}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>50대</p>
                <div class="chat chat4">
                   <p>${Balgre50}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>60대</p>
                <div class="chat chat5">
                   <p>${Balgre60}</p>
                </div>
            </div>
          </div>

          <div id="tab03">
             <div class="ageGraph">
                <p>20대</p>
                <div class="chat">
                    <p>${Perge20}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>30대</p>
                <div class="chat">
                   <p>${Perge30}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>40대</p>
                <div class="chat chat3">
                   <p>${Perge40}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>50대</p>
                <div class="chat chat4">
                   <p>${Perge50}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>60대</p>
                <div class="chat chat5">
                   <p>${Perge60}</p>
                </div>
            </div>
          </div>
          
          <div id="tab04">
             <div class="ageGraph">
                <p>20대</p>
                <div class="chat">
                    <p>${Fimrico20}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>30대</p>
                <div class="chat">
                   <p>${Fimrico30}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>40대</p>
                <div class="chat chat3">
                   <p>${Fimrico40}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>50대</p>
                <div class="chat chat4">
                   <p>${Fimrico50}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>60대</p>
                <div class="chat chat5">
                   <p>${Fimrico60}</p>
                </div>
            </div>
          </div>
          
          <div id="tab05">
             <div class="ageGraph">
                <p>20대</p>
                <div class="chat">
                    <p>${National20}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>30대</p>
                <div class="chat">
                   <p>${National30}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>40대</p>
                <div class="chat chat3">
                   <p>${National40}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>50대</p>
                <div class="chat chat4">
                   <p>${National50}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>60대</p>
                <div class="chat chat5">
                   <p>${National60}</p>
                </div>
            </div>
          </div>
           
           
          <div id="tab06">
             <div class="ageGraph">
                <p>20대</p>
                <div class="chat">
                    <p>${Geo20}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>30대</p>
                <div class="chat">
                   <p>${Geo30}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>40대</p>
                <div class="chat chat3">
                   <p>${Geo40}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>50대</p>
                <div class="chat chat4">
                   <p>${Geo50}</p>
                </div>
            </div>
            <div class="ageGraph">
                <p>60대</p>
                <div class="chat chat5">
                   <p>${Geo60}</p>
                </div>
            </div>
          </div>

        </div>
      </div>
</div>


<h3>관리자 회원 목록</h3>
    <div class="container">
       <table  class="table">
          <tr>
             <th>선 택</th>
               <th>아이디</th>
               <th>이 름</th>
               <th>전화번호</th>
               <th>이메일</th>
               <th>연 령</th>
               <th>가입일</th>
           </tr>

           <c:forEach items="${list}" var="list">
                 <tr>
               <td><input id="sel-id" type="radio" name="id" value="${list.id}"></td>
                  <td>${list.id }</td>
                  <td>${list.name } </td>
                  <td>${list.tel }</td>
                  <td>${list.email }</td>
                  <td>${list.age }</td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${list.reg_date}" /></td>
              </tr>
           </c:forEach>
      </table>

   <a href="javascript:admDeleteCheck()" class="btn">회원 추방</a>
   
   <ul class="pagenation">
      <c:if test="${page.prev}">
         <li><a href="/family/admmanage?num=${page.startPageNum - 1}" class="prev">이전</a></li>
      </c:if>
   
      <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
         <li>
            <c:if test="${select != num}">
               <a href="/family/admmanage?num=${num}">${num}</a>
            </c:if>
            <c:if test="${select == num}">
               <a href="" class="active"><strong>${num}</strong></a>
            </c:if>
         </li>
      </c:forEach>
   
      <c:if test="${page.next}">
         <li><a href="/family/admmanage?num=${page.endPageNum + 1}" class="next">다음</a></li>
      </c:if>
   </ul>
   
   <form name="infoDeleteForm" method="post">
       <input type="hidden" name="id">
   </form>

</div>

    
    
    <div class="adm-container">
      <div class="adm-wrap">
         <h3>예약 목록</h3>
         <input type="search" id="re-search" class="valueform" placeholder="검색어 입력" class="searchform">
         <div id="g-table-container" style="height:220px; overflow-x:hidden; overflow-y:scroll;">
            <table class="g-list">
               <thead>
                   <tr>
                        <th>아이디</th>
                        <th>지원 회사</th>
                        <th>이 름</th>
                        <th>번 호</th>
                        <th>인원 수</th>
                        <th>신청 날짜</th>
                        <th>예약 현황</th>
                    </tr>
               </thead>
               
               <tbody id="re-row">
                  <c:forEach items="${elist}" var="elist">
                          <tr>
                             <td>${elist.id }</td>
                           <td>${elist.company }</td>
                           <td>${elist.name } </td>
                           <td>${elist.tel }</td>
                           <td>${elist.num }</td>
                           <td>${elist.datech }</td>
                           <td>${elist.reservation == '0' ? '예약 대기' : '예약 승인'}</td>
                       </tr>
                    </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>



      
      




   <div class="adm-container">
      <div class="adm-wrap">
         <h3>웹 게시물 목록</h3>
         <input type="search" id="g-search" class="valueform" placeholder="검색어 입력" class="searchform">
         <div id="g-table-container" style="height:220px; overflow-x:hidden; overflow-y:scroll;">
            <table class="g-list">
               <thead>
                  <tr>
                     <th>id</th>
                     <th>제목</th>
                     <th>내용</th>
                  </tr>
               </thead>
               
               <tbody id="g-row">
                  <c:forEach items="${blist}" var="blist">
                     <tr>
                        <td><a href="/board/read?no=${blist.bnum}">${blist.id }</a></td>
                        <td>${blist.subject }</td>
                        <td>${blist.contents }</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>
   
   
   <div class="adm-container">
      <div class="adm-wrap">
         <h3>웹 댓글 목록</h3>
         <input type="search" id="b-search" class="valueform" placeholder="검색어 입력" class="searchform">
         <div id="g-table-container" style="height:220px; overflow-x:hidden; overflow-y:scroll;">
            <table class="g-list">
               <thead>
                  <tr>
                     <th>아이디</th>
                     <th>댓글 내용</th>
                     <th>게시물 번호</th>
                  </tr>
               </thead>
               
               <tbody id="b-row">
                  <c:forEach items="${replyli}" var="replyli">
                     <tr>
                        <td><a href="/board/read?no=${replyli.bnum}">${replyli.id }</a></td>
                        <td>${replyli.recontents }</td>
                        <td>${replyli.bnum }</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
         </div>
      </div>
   </div>


<%@ include file="../includes/footer.jsp" %>