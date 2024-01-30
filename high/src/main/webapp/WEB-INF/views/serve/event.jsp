<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>


   <script>
	function scrollToReservationForm() {
	    var reservationForm = document.getElementById('reservation');
	    
	    if (reservationForm) {
	        reservationForm.scrollIntoView({ behavior: 'smooth' });
	    }
	}
</script>
    
    
  <div class="bn bn-ev-bg">
    <div class="dark"></div>
    <h2>Highball class</h2>
  </div>
  
  <h3><span>ONEDAY</span> CLASS</h3>
  <p class="sub-title">각 매장의 대표적인 하이볼을 시음하고 만들어볼 수 있는 체험을 운영하고 있습니다.</p>

  <div class="container-ev">
    <input id="tab-1" type="radio" name="radio-set" class="tab-selector-1" checked="checked">
    <label for="tab-1" class="tab-label-1">Balgre</label>
    <input id="tab-2" type="radio" name="radio-set" class="tab-selector-2">
    <label for="tab-2" class="tab-label-2">Fuzzy</label>
    <input id="tab-3" type="radio" name="radio-set" class="tab-selector-3">
    <label for="tab-3" class="tab-label-3">Pimlico</label>


    <div class="ev-cnt">
      <div class="ev-cnt-bal">
        <div class="ev-cnt-bg"></div> 
        <div class="ev-cnt-txt">
          <h4>발그레</h4>
          <p>다양한 종류의 하이볼을 경험해 보세요. 시그니처 메뉴를 시음하고 만들어보는 체험의 시간을 가질 수 있습니다.</p>
          <div class="ev-cnt-info">
            <div><i class="fa-solid fa-calendar-days"></i><span class="ev-dd">월 ~ 금 (주말 / 공휴일 제외)</span></div>
            <div><i class="fa-regular fa-clock"></i><span class="ev-dd">오후 2시 ~ 오후 4시 (2시간)</span></div>
            <div><i class="fa-solid fa-user"></i><span class="ev-dd">최대 10명</span></div>
            <div><i class="fa-solid fa-user-xmark"></i><span class="ev-ff">미성년자 참여 불가</span></div>
            <button class="btn reserbtn" onclick="scrollToReservationForm()">예약</button>

          </div>
        </div>                      
      </div> 

      <div class="ev-cnt-fuz">
        <div class="ev-cnt-bg"></div>
        <div class="ev-cnt-txt">
          <h4>퍼지</h4>
          <p>다양한 종류의 하이볼을 경험해 보세요. 시그니처 메뉴를 시음하고 만들어보는 체험의 시간을 가질 수 있습니다.</p>
          <div class="ev-cnt-info">
            <div><i class="fa-solid fa-calendar-days"></i><span class="ev-dd">월 ~ 금 (주말 / 공휴일 제외)</span></div>
            <div><i class="fa-regular fa-clock"></i><span class="ev-dd">오후 2시 ~ 오후 4시 (2시간)</span></div>
            <div><i class="fa-solid fa-user"></i><span class="ev-dd">최대 10명2</span></div>
            <div><i class="fa-solid fa-user-xmark"></i><span class="ev-ff">미성년자 참여 불가</span></div>
            <button class="btn reserbtn" onclick="scrollToReservationForm()">예약</button>
          </div>
        </div>                      
      </div> 

      <div class="ev-cnt-pim">
        <div class="ev-cnt-bg"></div>
        <div class="ev-cnt-txt">
          <h4>핌리코</h4>
          <p>다양한 종류의 하이볼을 경험해 보세요. 시그니처 메뉴를 시음하고 만들어보는 체험의 시간을 가질 수 있습니다.</p>
          <div class="ev-cnt-info">
            <div><i class="fa-solid fa-calendar-days"></i><span class="ev-dd">월 ~ 금 (주말 / 공휴일 제외)</span></div>
            <div><i class="fa-regular fa-clock"></i><span class="ev-dd">오후 2시 ~ 오후 4시 (2시간)</span></div>
            <div><i class="fa-solid fa-user"></i><span class="ev-dd">최대 10명3</span></div>
            <div><i class="fa-solid fa-user-xmark"></i><span class="ev-ff">미성년자 참여 불가</span></div>
            <button class="btn reserbtn" onclick="scrollToReservationForm()">예약</button>
          </div>
        </div>    
      </div>
    </div>
  </div>

  <h3><span>CLASS</span> APPLICATION</h3>
  <p class="sub-title">가족, 연인, 친구와 함께 색다른 체험을 경험해보세요.</p>
  
  <div class="container-lg-ev">
    <div class="container-ev-flex">
      <div class="ev-contact">
        <h4>Contact us</h4>
        <p>경상북도 영천시 금호읍 원기리 414-2<br>
          vincoree@naver.com<br>
          054-333-3010<br>
          평일 10:30 ~ 20 : 30</p>
      </div>
 
	<form name="eventForm" action="/serve/event"  method="post" id="reservation">
		<input type="hidden" name="id" value="<%=id %>">
      <div class="ev-contact-form">
      	  <div class="join-radio ev-raGrp">
		    <div class="join-radioGrp">
		        <input id="ev-res1" type="radio" name="company" value="발그레" checked >
		        <label for="ev-res1">발그레</label>
		    </div>
		     <div class="join-radioGrp">
		        <input id="ev-res2" type="radio" name="company" value="퍼지"  >
		        <label for="ev-res2">퍼지</label>
		    </div>
		    <div class="join-radioGrp">
		        <input id="ev-res3" type="radio" name="company" value="핌리코" >
		        <label for="ev-res3">핌리코</label>
		    </div>
		    <div class="join-radioGrp">
		        <input id="ev-res4" type="radio" name="company" value="네셔널" >
		        <label for="ev-res4">네셔널</label>
		    </div>
		    <div class="join-radioGrp">
		        <input id="ev-res5" type="radio" name="company" value="지오" >
		        <label for="ev-res5">지오</label>
		    </div>
		  </div>
		  	
        <ul class="ev-contact-info">
          <li><input type="text" name="name" placeholder="신청자 이름 입력" class="join-input" required></li>
          <li><input type="tel" name="tel" placeholder="전화번호 입력" class="join-input" required></li>
          <li><input type="text" name="num" placeholder="신청 인원 (최대10명)" class="join-input"></li>
          <li><input type="date" name="datech" data-placeholder="예약일" required aria-required="true" class="join-input"></li>
          <li><button type="submit"  class="btn ev-btn"><span>예약하기</span></button></li>
        </ul>
      </div>
      </form>
    </div>  
  </div>


<script>
    var flashMessage = "${meg}";
    if (flashMessage) {
        alert(flashMessage);
    }
</script>


<%@ include file="../includes/footer.jsp" %>