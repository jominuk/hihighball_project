<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@ include file="../includes/header.jsp" %>


	<style>
	@media screen and (min-width:1450px) {
		#myInfo-list {
			display:flex; justify-content: space-around; 
			width:1000px; margin: 80px auto 0;
		}
		.Se-card{
			width: 300px; height: 300px;
            border-radius: 10px;
            transition: transform 0.4s ease;
		}
		.Se-card:hover {
		    transform: translateY(-30px);
		}
		.selecImg {
			width:100%; height: 100%; border-radius: 10px;
            background-size: cover;
		}
		.SeBox {
			position:absolute; top:0;
		  	width:300px; height:300px;
		  	transition:all 0.4s ease; opacity:0;
	  	}
	  	.mySel:hover > .SeBox{
			 background: rgba(0,0,0,0.6); opacity:1; border-radius:10px;
		}
	  	.SeBox > p {
	  		position:absolute; top:0; left:50%;
	  		font-size:26px; color:#f6f6f6;
	  		transform: translate(-50%); transition:all 0.4s ease;
	  	}
	  	.mySel:hover > .SeBox > p { top:130px;	}
	}
	
	@media screen and (min-width:1050px) and (max-width:1449px) {
		#myInfo-list {
			display:flex; justify-content: space-around; 
			width:900px; margin: 80px auto 0;
		}
		.Se-card{
			width: 250px; height: 300px;
            border-radius: 10px;
            transition: transform 0.4s ease;
		}
		.Se-card:hover {
		    transform: translateY(-30px);
		}
		.selecImg {
			width:100%; height: 100%; border-radius: 10px;
            background-size: cover;
		}
		.SeBox {
			position:absolute; top:0;
		  	width:250px; height:300px;
		  	transition:all 0.4s ease; opacity:0;
	  	}
	  	.mySel:hover > .SeBox{
			 background: rgba(0,0,0,0.4); opacity:1; border-radius:10px;
		}
	  	.SeBox > p {
	  		position:absolute; top:0; left:50%;
	  		font-size:26px; color:#f6f6f6;
	  		transform: translate(-50%); transition:all 0.4s ease;
	  	}
	  	.mySel:hover > .SeBox > p { top:130px;	}
	}
	
	@media screen and (min-width: 650px) and (max-width : 1049px) {
		#myInfo-list {
			width: 300px; margin: 80px auto 0;
		}
		.Se-card{
			width: 300px; height: 400px;
            border-radius: 10px; margin-top: 30px;
		}
		.selecImg {
			width:100%; height: 100%; border-radius: 0 0 10px 10px;
            background-size: cover;
		}
		
	  	.SeBox > p {
	  		font-size:26px; text-align: center;
	  		margin-top: 100px;
	  	}
	}
	@media screen and (max-width : 649px) {
		#myInfo-list {
			width: 300px; margin: 80px auto 0;
		}
		.Se-card{
			width: 300px; height: 400px;
            border-radius: 10px; margin-top: 30px;
		}
		.selecImg {
			width:100%; height: 100%; border-radius: 0 0 10px 10px;
            background-size: cover;
		}
		
	  	.SeBox > p {
	  		font-size:26px; text-align: center;
	  		margin-top: 100px;
	  	}
	}
	</style>
	<div class="bn bn-my-bg"> 
        <div class="dark"></div>
        <h2>my page</h2>
    </div>
    
    <ul id="myInfo-list">
    	<li>
    		<a href="/family/admfamilylist" class="Se-card mySel">
    			<div class="SeBox">
    				<p>회원 목록</p>
    			</div>
    			<img src="/resources/imgs/memlist.jpg" alt="Image" class="selecImg">
    		</a>
   		</li>
   		
    	<li>
    		<a href="/family/admreser" class="Se-card mySel">
    			<div class="SeBox">
    				<p>예약 목록</p>
    			</div>
    			<img src="/resources/imgs/admReservation.jpg" alt="Image" class="selecImg">
    		</a>
   		</li>
    	<li>
    		<a href="/family/admmanage" class="Se-card mySel">
    			<div class="SeBox">
    				<p>연령 통계</p>
    			</div>
    			<img src="/resources/imgs/statistics.jpg" alt="Image" class="selecImg">
    		</a>
   		</li>
    </ul>
    
    
<%@ include file="../includes/footer.jsp" %>
















