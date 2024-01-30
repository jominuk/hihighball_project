<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false" %>
<%@ page import="org.hihigh.domain.FamilyVO"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
   HttpSession session = request.getSession();
    String id = (String) session.getAttribute("idKey");
    
    String filename = (String) session.getAttribute("profileImg");
%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>hi! High!</title>

    <link rel="shortcut icon" type="/resources/imgs/ico" href="/resources/imgs/favicon.jpg">
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    >
    <link rel="stylesheet" href="../resources/css/reset.css">
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/index.css">
    <link rel="stylesheet" href="../resources/css/event.css">
    <link rel="stylesheet" href="../resources/css/about.css">
    <link rel="stylesheet" href="../resources/css/products.css">
    <link rel="stylesheet" href="../resources/css/recipeintro.css">
    <link rel="stylesheet" href="../resources/css/joinForm.css">
    <link rel="stylesheet" href="../resources/css/adm-familyList.css">
    <link rel="stylesheet" href="../resources/css/mypage.css">
    <link rel="stylesheet" href="../resources/css/rcpostForm.css">
    <link rel="stylesheet" href="../resources/css/blist.css">
    <link rel="stylesheet" href="../resources/css/read.css">

    <script src="https://kit.fontawesome.com/11390cb447.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="../resources/js/common.js"></script>
    <script src="../resources/js/subscript.js"></script>
    <script src="../resources/js/rule.js"></script>
  </head>

<script>
    var message = "${msg}";

    if (message === "logout") {
        alert("logout 성공!");
        <% session.removeAttribute("message"); %>
    }
    
    
    $(function () {
        $('.dropdown').click(function(e) {
            $(this).toggleClass('dropdown-active');
        })
    })
    
</script>

<style>
      .profileimg{
         width:45px; height: 45px; margin-left:25px;
         border-radius: 20px; 
         cursor: pointer;
      }
        .profileimg2{
         width:60px; height:60px; margin-left:25px;
         border-radius: 18px; 
         cursor: pointer;  margin:0 auto;
      }
       .profileimg3 {
       	width:20px; height:20px;
       	cursor: pointer; margin: 0 10px 0 33%;
       }
		.linka {width:50%;}
      
      .bi-mypage{font-size: 26px;}
        .dropdown {position: relative; display: inline-block; color:}
        .dropbtn {cursor: pointer;}
        .dropdown-content {
        	margin-top:15px;
          position: absolute; display: none; color: white;
          left:-200px;  
          z-index: 1; 
          width: 300px; text-align: center; border-radius:20px;
          background: #D3E6ED;  
        }
        .dropdown-content a {
          padding: 10px; color: #333;
          text-decoration: none;
          border-bottom: 1px solid white;
          color: black;
        }
  
       .dropdown-active .dropdown-content {
	        display: block;
	        opacity: 1;
	        color: white;
	    }
        .dropdown-content a:hover {background: #C3EE41; }
  		.dropImg {display:flex;}
  		.logout1 {display:flex; height:40px; border-radius:0 0 20px 20px;}
  		.firstpro:hover { background: #C3EE41; border-radius: 20px 20px 0 0; }
  		
</style>


  <body >
     <header>
         <nav>
           <a href="/" class="logo">hi:<span>high</span></a>

           <a href="#" id="trigger">
             <span></span>
             <span></span>
             <span></span>
           </a>
           
           <ul id="main-menu">
             <li><a href="/serve/aboutus">1. 하이볼 유래</a></li>
             <li>
               <a href="#">2. 하이볼 레시피 소개</a>
               <ul class="sub-menu">
                 <li><a href="/serve/recipeintro">01. 하이볼 레시피</a></li>
                 <li><a href="/board/blist">02. 레시피 목록</a></li>
               </ul>
             </li>
             <li>
               <a href="#">3. 하이볼 용품</a>
               <ul class="sub-menu">
                 <li><a href="/serve/products">01. 컵</a></li>
                 <li><a href="/serve/products">02. 시럽</a></li>
                 <li><a href="/serve/products">03. 부속품</a></li>
               </ul>
             </li>
             <li><a href="/serve/event">4. 이벤트</a></li>
           </ul>
         <%if(id != null) { %>
               <ul class="top-menu dt">
                   <% if(id.equals("admin")) { %>
                       <!-- <li><a href="/family/admfamilylist">회원목록</a></li>  -->
                       <!-- <li><a href="/family/admmanage">관리자 모드</a></li>  -->
                       <li><a href="/family/admmanage">관리자 모드</a></li>
                       <li><a href="/family/logout">로그아웃</a></li>
                   <% } else { %>
                       <% if(id.equals("balgre")) { %>
                          <li><a href="/family/balgre">예약명단</a></li>
                           <li><a href="/family/logout">로그아웃</a></li>
                       <% } else { %>
                           <li><span><%=id %>님</span></li>
                           <!-- 
                           <li><a href="/family/mypage">내정보</a></li>
                           <li><a href="/family/myPostList">내게시물</a></li>
                           <li><a href="/family/myReservation">예약현황</a></li>
                           <li><a href="/family/logout">로그아웃</a></li>
                           <li>
                            	<% if(filename != null) { %>
                                 <img src="/resources/profile/<%= filename %>" alt="Profile Image" class="profileimg">
                                 <% } else { %>
                                 <img src="/resources/imgs/noPhoto.jpg" alt="noimge" class="profileimg">
                                 <% } %>
                            </li>
                             -->


                          <li class="dropdown">
                              <span class="dropbtn">
                                 <% if(filename != null) { %>
                                 <img src="/resources/profile/<%= filename %>" alt="Profile Image" class="profileimg">
                                 <% } else { %>
                                 <img src="/resources/imgs/noPhoto.jpg" alt="noimge" class="profileimg">
                                 <% } %>
                              </span>
                              
                              <div class="dropdown-content">
                              
                                <a href="/family/mypage" class="firstpro">
                                	<span class="dropbtn">
		                                 <% if(filename != null) { %>
		                                 <img src="/resources/profile/<%= filename %>" alt="Profile Image" class="profileimg profileimg2">
		                                 <% } else { %>
		                                 <img src="/resources/imgs/noPhoto.jpg" alt="noimge" class="profileimg profileimg2">
		                                 <% } %>
	                               </span>
	                               <p>내 정보</p>
                                </a>
                                
                                <div class="dropImg">
	                                <a href="/family/myPostList" class="linka">
	                                	<img src="/resources/imgs/agenda.png" alt="게시물" class="profileimg2">
	                                	<p>내 게시물</p>
	                                </a>
                                
                                	<a href="/family/myReservation" class="linka">
                                		<img src="/resources/imgs/reserva.png" alt="예약" class="profileimg2">
                                		<p>예약 현황</p>
                                	</a>
                                </div>
                                
                                <a href="/family/logout" class="logout1">
                                	<img src="/resources/imgs/logout.png" alt="로그아웃" class="profileimg3">
                                	<p>로그 아웃</p>
                                </a>
                                
                              </div>
                            </li>
                            
                             
                       <% } %>
                   <% } %>
               </ul>

         <ul class="top-menu mb">
            <% if(id.equals("admin")) { %>
               <li><a href="/family/login.jsp"><i class="bi bi-person-circle"></i></a></li>
            <% } else { %>
               <li><a href="/family/mypageSelect.jsp"><i class="bi bi-person-badge"></i></a></li>
                   <li><a href="/family/logout.jsp"><i class="bi bi-person-dash-fill"></i></a></li>
            <% } %>
         </ul>
   <% } else { %>
         <ul class="top-menu dt">
            <li><a href="/family/login">로그인</a></li>
            <li><a href="/family/joinForm">회원가입</a></li>
         </ul>
         
         <ul class="top-menu mb">
             <li><a href="../family/login.jsp"><i class="bi bi-person-circle"></i></a></li>
             <li><a href="../family/joinForm.jsp"><i class="bi bi-person-plus-fill"></i></a></li>
        </ul>
   <% } %>


         </nav>
   </header>

   
   