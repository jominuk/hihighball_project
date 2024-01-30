<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="../includes/header.jsp" %>


	<style>
        
		.my-postList {
			height: 100px; 
			margin-bottom: 20px; padding: 0 10px; background: #eee;
		}
		.my-postList > li:nth-child(1){
			display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
			height : 70%; padding: 0 10px;
		}
        
	@media screen and (min-width:650px) {
		.my-postListCon { width:600px;  margin:80px auto; }
		.my-postList {
			display: flex; align-items: center; height: 100px; 
			margin-bottom: 20px; padding: 0 10px; background: #eee;
			border-radius:10px;
		}
		.my-postList > li {
			display: flex; align-items: center; overflow: hidden;
		}
		.my-postList > li:nth-child(1){ width:20%; }
        .my-postList > li:nth-child(2){height: 80%; border: 1px solid #ccc; margin: 0 20px;}
		.my-postList > li:nth-child(3){
			display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;
			width:65%; height : 70%; 
		}
	}
	@media screen and (max-width:649px) {
		.my-postListCon { width:300px;  margin:80px auto; }
		.my-postList > li:nth-child(1){ width:80%; }
		.my-postList > li:nth-child(3){ display: none; }
	}
		
	</style>
	
	<div class="bn bn-board">
	  <div class="dark"></div>
	  <h2>Board LIST</h2>
	</div>
	
	<div class="my-postListCon">
		<c:forEach items="${mypostlist}" var="mylist">
			<ul class="my-postList">
				<li><a href="/board/read?no=${mylist.bnum}" >${mylist.subject}</a></li>
				<li></li>
				<li><p>${mylist.contents}</p></li>
			</ul>
		</c:forEach>
	</div>
<%@ include file="../includes/footer.jsp" %>
























