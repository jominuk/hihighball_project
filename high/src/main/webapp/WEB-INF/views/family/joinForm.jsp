<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<script>
	$(document).ready(function() {
	    $("#id").on("focusout", function() {
	        var id = $("#id").val();
	
	        if (id == '' || id.length == 0) {
	        	$("#label1").css({"color": "red","font-size": "12px"}).text("id를 입력해주세요");
	        } else {
	            $.ajax({
	                url: '/family/idcheckes',
	                data: { id: id },
	                type: 'POST',
	                dataType: 'text',
	                success: function(result) {
	                    console.log("Success. Result:", result);
	                    $("#label1").css({
	                	    "color": "red",
	                	    "font-size": "12px"
	                	}).text(result);
	                },
	                error: function(xhr, status, error) {alert("id를 다시 입력해 주세요")}
	            });
	        }
	    });
	});
 
</script>

	<form name="joinForm" method="post">			 
        <ul id="joinFormBox">
            <li>
                <input id="id" class="join-input mbJoinInp"  name="id"  type="text" placeholder="아이디입력" autofocus required>
				<p id="label1"></p>
                <p id="warning">영문(대,소문자)과 숫자로만 입력해주세요</p>
            </li>
            <li>
                <input id="pwd-check" type="password" name="pwd" placeholder="비밀번호 입력" class="join-input" required>
                <p id="warning2">영문,숫자,특수문자(!@#%^*-)로 이루어진 8~15내로 입력해주세요</p>
            </li>

    		<li><input type="text" name="name" placeholder="이름 입력" class="join-input" required></li>
    		<li>
   				<div class="ageChose">
	   				<div>
	   					<input id="twenty"  type="radio" name="age" value="20대"  checked >
	                    <label for="twenty">20대</label>
	   				</div>
	   				<div>
	   					<input id="thirty"  type="radio" name="age" value="30대"  >
	                    <label for="thirty">30대</label>
	   				</div>
	   				<div>
	   					<input id="forty"  type="radio" name="age" value="40대"  >
	                    <label for="forty">40대</label>
	   				</div>
	   				<div>
	   					<input id="fifty"  type="radio" name="age" value="50대"  >
	                    <label for="fifty">50대</label>
	   				</div>
	   				<div>
	   					<input id="sixty"  type="radio" name="age" value="60대"  >
	                    <label for="sixty">60대</label>
	   				</div>
   				</div>
   			</li>
   			
            <li>
                <input id="tel-check" type="tel" name="tel" placeholder="전화번호 입력" class="join-input" >
                <p id="warning5">' - ' 없이 11자로 입력해주세요</p>
            </li>
            <li>
                <input id="email-check" type="email" name="email" placeholder="이메일 입력" class="join-input">
                <p id="warning4">이메일을 확인해주세요</p>
            </li>
            <li>
                <div class="join-btnGrp">
					<button type="button" onclick="location.href='/family/login'" class="btn">로그인</button>
					<button type="submit" class="btn">회원 가입</button>
                </div>
			</li>
        </ul>
    </form>


<%@ include file="../includes/footer.jsp" %>















