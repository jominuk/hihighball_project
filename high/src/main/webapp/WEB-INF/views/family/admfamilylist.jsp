<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="../includes/header.jsp" %>

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
</script>


<style>
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

  <div class="bn bn-login-bg"> 
    <div class="dark"></div>
    <h2>Member List</h2>
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
			<li><a href="/family/admfamilylist?num=${page.startPageNum - 1}" class="prev">이전</a></li>
		</c:if>
	
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<li>
				<c:if test="${select != num}">
					<a href="/family/admfamilylist?num=${num}">${num}</a>
				</c:if>
				<c:if test="${select == num}">
					<a href="" class="active"><strong>${num}</strong></a>
				</c:if>
			</li>
		</c:forEach>
	
		<c:if test="${page.next}">
			<li><a href="/family/admfamilylist?num=${page.endPageNum + 1}" class="next">다음</a></li>
		</c:if>
	</ul>
	
	<form name="infoDeleteForm" method="post">
	    <input type="hidden" name="id">
	</form>

</div>

<%@ include file="../includes/footer.jsp" %>











