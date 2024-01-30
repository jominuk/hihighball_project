<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../includes/header.jsp" %>
    
    <style>

    	#findForm{
    		width:400px; margin:120px auto 120px; padding:30px;
	    	border:3px solid #eee; border-radius:10px;
    	}
    		.result-box{
    		margin-top:30px; font-size:14px; text-align: center;
    	}
    	.btnggro{
    		display: flex;
  			justify-content: space-between;
  			margin-top:20px;
    	}
    	.pwdfind{
    		margin-top:10px;
    	}
    </style>

 <form id="findForm" action="/family/idfind" method="post" >
	
		<div class="form-group">
	    	<input type="text" name="name" id="name" placeholder="이름을 입력해주세요" class="join-input">
	    </div>
	    <div class="form-group">
	    	<input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" class="join-input">
	    </div>
	    <div class="btnggro">
		    <button class="btn" type="submit">아이디 찾기</button>
		    <button type="button" class="btn" onclick="window.location.href='/family/login'">로그인</button>
	    </div>

	<div class="result-box">
		<c:choose>
			<c:when test="${empty findId}">
			<p class="inquiry">조회결과가 없습니다.</p>
			</c:when>
	        <c:otherwise>
	            <p>ID : ${findId.id}</p>
	            <button type="button" class="btn pwdfind" onclick="window.location.href='/family/pwdfind'">비밀번호 찾기</button>
	        </c:otherwise>
		</c:choose>
	</div>
	
</form>    
    




<%@ include file="../includes/footer.jsp" %>