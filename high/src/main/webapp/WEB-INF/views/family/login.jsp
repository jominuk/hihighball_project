<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
	.bn-login {
	    background: url(../../../resources/imgs/join-bg.jpg) no-repeat center center;
	    background-size: cover;
	    background-attachment: fixed;
	}
	#loginForm {
	    width:400px; margin:120px auto 120px; padding:30px;
	    border:3px solid #eee; border-radius:10px;
	}
	.join-input {
	    width: 100%; height: 35px; margin-top: 20px; padding-left: 10px;
	    border-bottom: 1px solid rgba(195, 195, 195, 0.5);
	    outline: none; border-width: 0 0 1px;
	}
	.join-input:focus {
	    border-bottom: 2px solid rgb(63, 140, 255);
	    background: none;
	}
	.loginBtnGrp {
	    display: flex; justify-content: space-between;
	    margin: 50px 0 20px 0 ;
	}
	.findInfor {display:flex; justify-content:space-between; font-size:14px;}
	
	@media screen and (max-width : 649px) {
	    #loginForm { width: 340px; border: none;}
	}
</style>

<script>
$(function () {
 
    $("#loginBtn").click(function () {
        var userid = $("#userid").val();
        var passwd = $("#passwd").val();

        if (userid == "") {
            alert("아이디를 입력하세요");
            $("#userid").focus();
            return;
        }

        if (passwd == "") {
            alert("비밀번호를 입력하세요");
            $("#passwd").focus();
            return;
        }
        document.loginForm.submit();
    }); 
});

	<c:if test="${message == 'error'}">
		alert("아이디와 비밀번호를 확인하세요");
	</c:if>
	
	var msg = "${joinMeg}";
	if (msg) {
		alert(msg);
		<% session.removeAttribute("joinMeg"); %>
	}
</script>


	<div class="bn bn-login">
        <div class="dark"></div>
        <h2>Hihigh! LOGIN</h2>
    </div>

	<form name="loginForm" action="/family/login" method="post">
		<ul id="loginForm">
			<li><input type="text" name="id" id="userid" placeholder="아이디 입력" autofocus class="join-input"></li>
			<li><input type="password" name="pwd" id="passwd" placeholder="비밀번호 입력" class="join-input"></li>
			<li>
                <div class="loginBtnGrp">
                    <button type="submit" id="loginBtn" class="btn">로그인</button>
                    <button type="button" onclick="location.href='/family/joinForm'" class="btn">회원 가입</button>
                </div>
			</li>
			
			<li>
				<div class="findInfor">
					<a href="/family/idfind">아이디 찾기</a>
					<a href="/family/pwdfind">비밀번호 찾기</a>
				</div>
			</li>
		</ul>
	</form>

<%@ include file="../includes/footer.jsp" %>