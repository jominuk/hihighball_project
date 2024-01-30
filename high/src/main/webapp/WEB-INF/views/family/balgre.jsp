<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
    .balgreBox {
        display: flex;
    }
    table { margin:30px auto; }
    .bn-balgre-bg  {
    background: url("/resources/imgs/balgre-member-bg.jpg")no-repeat center center;
    background-size:cover;
    backgfound-attachment:fixed;
    }
    .pass {
    	height: 30px; line-height: 34px;
    }
</style>

<div class="bn bn-balgre-bg">
    <div class="dark"></div>
    <h2>List</h2>
</div>

<h3>Balgre 예약 명단</h3>
<table>
      <tr>
             <th>아이디</th>
             <th>이 름</th>
             <th>전화번호</th>
             <th>인원수</th>
             <th>날짜</th>
             <th>예약상태</th>
             <th>승인/거절</th>
         </tr>


        <c:forEach var="event" items="${events}">
           <tr>
               <td>${event.id}</td>
               <td>${event.name } </td>
               <td>${event.tel }</td>
               <td>${event.num}</td>
               <td>${event.datech}</td>
               <td>${event.reservation == '1' ?  '예약 완료' : '예약 대기'}</td>
               <td class="admin_board_content_nm">
                    <button 
                    data-id="${event.id}" 
                    type="button" 
                    value="승인" 
                    class="btn pass" 
                    onclick="approveReservation('${event.id}', '${event.company}')"
                    style="${event.reservation == '1' ? 'display:none;' : ''}"
                >
                    승인
                </button>
                <button 
                    data-id="${event.id}" 
                    type="button" 
                    value="삭제" 
                    class="btn pass" 
                    onclick="rejectReservation('${event.id}', '${event.company}')"
                    style="${event.reservation == '1' }"
                >
                    삭제
                </button>
                  </td>
           </tr>
       </c:forEach>
</table>

<script>
    function approveReservation(id, company) {
        $.ajax({
            type: 'POST',
            url: '/family/approveEvent',
            data: {
                id: id,
                company: company,
                action: '승인'
            },
            success: function(response) {
                location.reload();
            },
            error: function(error) {
                console.error('Error during reservation update:', error);
            }
        });
    }
    
    function rejectReservation(id) {
        if (confirm('정말로 이 예약을 삭제하시겠습니까?')) {
            $.ajax({
                type: 'POST',
                url: '/family/rejectEvent',
                data: {id: id},
                success: function(response) {
                    location.reload();
                },
                error: function(error) {
                    console.error('Error during reservation rejection:', error);
                }
            });
        }
    }
</script>

<%@ include file="../includes/footer.jsp" %>

