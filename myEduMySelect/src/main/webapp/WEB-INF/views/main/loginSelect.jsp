<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

  <!-- Template Main CSS File -->
  <link href="/resources/include/assets/css/loginSelect.css" rel="stylesheet">

    <style>
        .error { display: block; padding: 10px 0px; font-size: 18px; color: #dc3545; }
    </style>

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="100">
          <h1>LOG IN</h1>
          <h2>다시 만나 반갑습니다!</h2>
			<div>
		        <button type="button" id="userLoginBtn" onclick="window.location.href='/personal/login'">개인 회원으로 로그인</button>
		        <button type="button" id="academyLoginBtn" onclick="window.location.href='/academy/login'">학원 회원으로 로그인</button>
		        <form action="/useraccount/join" id="joinForm">
					<button class="join-button" type="submit">회원가입</button>
				</form>
		    </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="100">
          <img src="/resources/include/assets/img/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>
   </section><!-- End Hero -->
   
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />	

  <!-- Vendor JS Files -->
  <script src="/resources/include/assets/vendor/aos/aos.js"></script>
  <script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/include/academy/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/academy/academyLogin.js"></script>
	
	
	<script>
  	window.onload = function() {
  		var confirmMessage = "${confirmMessage}";
  		if (confirmMessage) {
  			var result = confirm(confirmMessage);
  			if(result) {
  				window.location.href = "/"; // 확인 눌렀을 경우 로그인 페이지로 이동
  			} else {
  				window.location.href = "/";
  			}
  		}
  	};
  </script>
	
</body>

</html>