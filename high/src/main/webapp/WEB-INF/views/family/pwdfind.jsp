<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
	
	#findForm{
   		width:400px; margin:120px auto 120px; padding:30px;
    	border:3px solid #eee; border-radius:10px;
   	}
   	.btnggro{
		display: flex;
  			justify-content: space-between;
  			margin-top:20px;
   	}
 	.newpwd {
		margin-top:30px; text-align:center; font-size:14px;
 	}
</style>

 <form id="findForm" action="/family/pwdfind" method="post" >
	<div class="form-group">
    	<input type="text" name="id" id="id" placeholder="id를 입력해주세요" class="join-input">
    </div>
    <div class="form-group">
    	<input type="text" name="name" id="name" placeholder="이름을 입력해주세요" class="join-input">
    </div>
    <div class="btnggro">
    	<button type="submit" class="btn">임시 비밀번호 발급</button>
    	<button type="button" class="btn" onclick="window.location.href='/family/login'">로그인</button>
    </div>
    
 
    <div class="newpwd">
    	<c:choose>
			<c:when test="${empty newPwd}">
			<p class="inquiry">조회결과가 없습니다.</p>
			</c:when>
	        <c:otherwise>
	            <p class="title">임시 비밀번호 : ${newPwd}</p>
	        </c:otherwise>
		</c:choose>
    	
	</div>
	 
</form>





<%@ include file="../includes/footer.jsp" %>