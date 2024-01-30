<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<script>
   $(window).resize(function(){ location.reload(); });
</script>


  <div class="bn bn-rc-bg">
    <div class="dark"></div>
    <h2>Highball Recipe</h2>
  </div>

  <h3><span>POPULAR</span> RECIPE</h3>
  <p class="sub-title">하이볼은 여러분의 즐거운 음주문화를 응원합니다.</p>

  <div class="rc-ac-container">
    <figure>
      <img src="../../../resources/imgs/rc-ac-container1.jpg" alt="True Colors">
      <input type="radio" name="radio-set" checked>
      <figcaption><span>하이볼과 아름답게</span></figcaption>

        <figure>
          <img src="../../../resources/imgs/rc-ac-container2.jpg" alt="Honest Light">
          <input type="radio" name="radio-set">
          <figcaption><span>하이볼과 고요하게</span></figcaption>

            <figure>
              <img src="../../../resources/imgs/rc-ac-container3.jpg" alt="Silent Serenity">
              <input type="radio" name="radio-set">
              <figcaption><span>하이볼과 차분하게</span></figcaption>

                <figure>
                  <img src="../../../resources/imgs/rc-ac-container4.jpg" alt="Warm Welcome">
                  <input type="radio" name="radio-set">
                  <figcaption><span>하이볼과 기분좋게</span></figcaption>

                    <figure>
                      <img src="../../../resources/imgs/rc-ac-container5.jpg" alt="Sensible Magic">
                      <input type="radio" name="radio-set">
                      <figcaption><span>하이볼과 편안하게</span></figcaption>
                    </figure>
                  </figure>
              </figure>
          </figure>
      </figure>
  </div>

  <div class="Fa-out">
  	<a href="../board/blist" class="btn rc-middle-btn"><span>레시피 목록</span></a>
  </div>
  
  <ul class="container-lg-rc container-lg-rc-bg-1">
    <li class="rc-txt rc-txt1">
      <h4>하이볼</h4>
      <p>하이볼은 가볍게 즐기기 좋은 술이다.</p>
      <a href="#" class="btn"><span>자세히 보기</span></a>
    </li>
    <li class="rc-bg rc-bg1"></li>
  </ul>
  <ul class="container-lg-rc container-lg-rc-bg-2">
    <li class="rc-txt rc-txt2">
      <h4>하이볼</h4>
      <p>하이볼은 가볍게 즐기기 좋은 술이다.</p>
      <a href="#" class="btn"><span>자세히 보기</span></a>
    </li>
    <li class="rc-bg rc-bg2"></li>
  </ul>
  <ul class="container-lg-rc container-lg-rc-bg-3">
    <li class="rc-txt rc-txt3">
      <h4>하이볼</h4>
      <p>하이볼은 가볍게 즐기기 좋은 술이다.</p>
      <a href="#" class="btn"><span>자세히 보기</span></a>
    </li>
    <li class="rc-bg rc-bg3"></li>
  </ul>
  
  <%@ include file="../includes/footer.jsp" %>