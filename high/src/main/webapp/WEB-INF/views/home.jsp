<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<%@ include file="includes/header.jsp" %>

<script>
    var message = "${message}";

    if (message === "suc") {
        alert("환영합니다 :)");
        <% session.removeAttribute("message"); %>
    } else if (message === "error") {
        alert("로그인에 실패하였습니다. 다시 시도해주세요.");
        <% session.removeAttribute("message"); %>
    }
</script>

<div id="idxIntro">

 	<div class="introbg"></div>
    <div class="introbg1"></div>

    <div class="introtxt">
        <div>
            <p>h</p>
            <p>i</p>
            <p>!</p>
        </div>
        <div class="t">
            <p>h</p>
            <p>i</p>
            <p>g</p>
            <p>h</p>
            <b>b</b>
            <p>a</p>
            <p>l</p>
            <p>l</p>
        </div>
    </div> 

 	<video muted autoplay  loop class="main-video">
      <source src="../resources/media/mainMedia.mp4" type="video/mp4" />
    </video>
	
    <div class="main-dark1"></div>
    <div class="main-dark2"></div>
    <div class="main-dark3"></div>

      <div class="main-title">
        <div class="main-title1">highball</div>
        <div class="main-title2">let's drink!</div>
      </div>
</div>

    <ul class="bntGrp">
      <li><a href="serve/aboutus" class="main-btn">about cocktails</a></li>
      <li><a href="serve/recipeintro" class="main-btn">recipe introduction</a></li>
      <li><a href="serve/products" class="main-btn">products</a></li>
      <li><a href="serve/event" class="main-btn">event</a></li>
    </ul>   
