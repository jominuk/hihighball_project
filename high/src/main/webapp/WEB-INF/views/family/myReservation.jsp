<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
	 
	 <style>
	 .bn-reservation{
	 	background: url("/resources/imgs/reservation.jpg")no-repeat center center;
        background-size: cover;
        background-attachment: fixed;
	 }
		@media screen and (min-width:650px) {
			.my-postListCon { width: 600px; display: flex; flex-wrap: wrap; margin:80px auto; }
			.my-postList {
				height: 160px; width: 180px; text-align: center;
				margin: 0 20px 20px 0; padding: 30px; background: #eee; border-radius:10px;
			}
			.my-postList > li {
				overflow: hidden;
			}
	        .my-postList > li:nth-child(2){
	            margin-top: 10px;
	        }
		}
		
		@media screen and (max-width:649px) {
			.my-postListCon { width:300px;  margin:80px auto; }
			.my-postList > li:nth-child(1){ width:80%; }
			.my-postList > li:nth-child(2){ display: none; }
		}
	</style>
	<div class="bn bn-reservation">
	  <div class="dark"></div>
	  <h2>Reservation LIST</h2>
	</div>
	
	<div class="my-postListCon">
		<c:forEach items="${ReserList}" var="Relist">
			<ul class="my-postList">
				<li><span>지원 회사 </span><p>${Relist.company }</p></li>
				<li><span>인원 : </span><span>${Relist.num }</span></li>
				<li>${Relist.datech }</li>
			</ul>
		</c:forEach>
	</div>
		
		
<%@ include file="../includes/footer.jsp" %>







