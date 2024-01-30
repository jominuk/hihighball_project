<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../includes/header.jsp" %>

<style>
    .kakao {
        margin-top: 100px;
    }
</style>

<a class="kakao" href="https://kauth.kakao.com/oauth/authorize?client_id=5333275e13f509e7d6bfa4bf7b2a093c&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Ffamily%2Flogin%2Foauth2%2Fkakao&response_type=code">
    Kakao 로그인
</a>

<%@ include file="../includes/footer.jsp" %>
