<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>

<style>
.profile{
	width:130px; height:100px;
	border-radius:50px;
}
</style>

<script>
function deleteCheck() {
    var result = confirm('정말로 회원 탈퇴 하시겠습니까?');
    if (result) {
        var form = document.createElement("form");
        form.method = "post";
        form.action = "deletemember";
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = "id";
        input.value = '${myInfo.id}';
        form.appendChild(input);
        document.body.appendChild(form);
        form.submit();
    } else {
        location.href='mypage';
    }
}
</script>

    <div class="bn bn-my-bg"> 
        <div class="dark"></div>
        <h2>my page</h2>
    </div>
    
    <ul class="my-info">
    	<li>
    		<c:if test="${not empty myInfo.filename}">
            	<img src="/resources/profile/${myInfo.filename}" alt="Image" class="rc-card-img profile">
            </c:if>
            <c:if test="${empty myInfo.filename}">
                <img src="/resources/imgs/noPhoto.jpg" alt="No Photo" class="rc-card-img profile">
            </c:if>
        </li>
        <li><span>이 름 : </span>${myInfo.name}</li>
        <li><span>전화 번호 : </span> ${myInfo.tel} </li>
        <li><span>이메일 : </span> ${myInfo.email} </li>
        <li><span>작성 일 : </span><fmt:formatDate pattern="yyyy-MM-dd" value="${myInfo.reg_date}" /></li>
    </ul>
    
    <div class="my-btnGrp">
        <a href="updateform" class="btn"><span>정보 수정</span></a>
        <a href="javascript:deleteCheck()" class="btn"><span>회원 탈퇴</span></a>
    </div>    
    
    
    <%@ include file="../includes/footer.jsp" %>
    
    
    
    
    