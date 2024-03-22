<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MyEduMySelect</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/include/assets/img/favicon.png" rel="icon">
<link href="/resources/include/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/include/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
	
  <link rel="stylesheet" type="text/css" href="/resources/include/assets/css/join.css">

  
  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
	    <div class="container d-flex align-items-center">
	
	      <h1 class="logo me-auto"><a href="/">MyEdu<br />MySelect</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li><a class="nav-link scrollto active" href="#hero">홈</a></li>
	          <li><a class="nav-link scrollto" href="#about">About</a></li>
	          <li><a class="nav-link scrollto" href="#team">Team</a></li>
	          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
	            <ul>
	              <li><a href="/free/freeList">자유게시판</a></li>
	            <li><a href="#">홍보게시판</a></li>
	            <li><a href="/matching/">매칭게시판</a></li>
	            <li><a href="/notice/boardList">공지게시판</a></li>
	            <c:if test="${personalLogin.memberTypeId == 1}">
	               <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">개인회원 마이페이지</a></li>
	            </c:if>
	            <c:if test="${academyLogin.memberTypeId == 2}">
	               <li><a href="${pageContext.request.contextPath}/academy/mypage" id="mypageBtn">학원회원 마이페이지</a></li>
	            </c:if>
	            </ul>
	          </li>
	          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
	          <c:choose>
	          <c:when test="${not empty personalLogin}">
	              <li><a class="nav-link scrollto">[개인]&nbsp&nbsp${personalLogin.personalName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:when test="${not empty academyLogin}">
	              <li><a class="nav-link scrollto">[학원]&nbsp&nbsp${academyLogin.academyName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/academy/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:otherwise>
	              <li><a class="getstarted scrollto" href="${pageContext.request.contextPath}/loginselect">로그인/회원가입</a></li>
	          </c:otherwise>
	        </c:choose>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
  	</header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>비밀번호 변경페이지</h1>
        </div>
        <div class="col-lg-6 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="/resources/include/assets/img/hero-img.png" class="img-fluid animated" alt="" style="max-height:300px;">
        </div>
      </div>
    </div>
   </section><!-- End Hero -->
	
	<main id="main">

    <!-- ======= academyPassWd Update Form ======= -->   
    
    <form action="/passwdChange" id="changePasswdForm" name="changePasswdForm" method="POST">
      <div class="input_group">
	    <label for="academyPasswd">기존 비밀번호</label>
	    <input type="password" name="academyPasswd" id="academyPasswd" maxlength="20" placeholder="기존 비밀번호 입력">	    
	    <span id="password-check-message"></span>
	  </div>
	  <br />
	  	      
	  <div class="input_group">
	    <label for="newPasswd">새 비밀번호</label>
	    <input type="password" name="newPasswd" id="newPasswd" maxlength="20" placeholder="새 비밀번호 입력"/>
	    <label class="require">(최소 하나의 대문자/소문자/숫자/특수문자 포함  8~20자 이내로 입력) </label>
	    <span id="new_password-check-message"></span>
	  </div>
	  <br />
	  
	  <div class="input_group">
	    <label for="newPasswd2">새 비밀번호 확인</label>
	    <input type="password" name="newPasswd2" id="newPasswd2" maxlength="20" onkeyup="checkPassword()"/>
	    <span id="new_passwd-check-message"></span>
	  </div>
	  <br />
	  <button type="button" id="changePasswdBtn" class="btn btn-primary">비밀번호 변경</button>
	</form>
	
	<!-- <script>
	function checkPassword() {
	    var newPassword = document.getElementById("newPasswd").value;
	    var confirmPassword = document.getElementById("newPasswd2").value;
	    var errorMessage = "";

	    // 비밀번호가 최소 요구 사항을 충족하는지 확인
	    var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
	    if (!regex.test(newPassword)) {
	        errorMessage = "새로운 비밀번호는 최소 하나의 대문자, 소문자, 숫자, 특수문자를 포함하고 8~20자 이내여야 합니다.";
	    }

	    // 비밀번호 확인과 일치하는지 확인
	    if (newPassword !== confirmPassword) {
	        errorMessage = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
	    }

	    // 에러 메시지를 표시
	    document.getElementById("password-check-message").innerText = errorMessage;
	    // 비밀번호가 유효하면 버튼 활성화
	    var changePasswdBtn = document.getElementById("changePasswdBtn");
	    if (errorMessage === "") {
	        changePasswdBtn.disabled = false;
	    } else {
	        changePasswdBtn.disabled = true;
	    }
	}

	// 페이지 로드 시 이벤트 리스너 등록
	document.addEventListener("DOMContentLoaded", function() {
	    var newPasswordInput = document.getElementById("newPasswd");
	    var confirmPasswordInput = document.getElementById("newPasswd2");
	    if (newPasswordInput && confirmPasswordInput) {
	        newPasswordInput.addEventListener("keyup", checkPassword);
	        confirmPasswordInput.addEventListener("keyup", checkPassword);
	    }
	});

	</script> -->
	
	
    <!-- ======= Contact Section ======= -->  	
  </main><!-- End #main -->

  	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>MyEduMySelect</h3>
						<p> 
							서울특별시 강남구 테헤란로14길 6 <br> 남도빌딩 2F, 3F, 4F, 5F, 6F <br> 대한민국 <br>
							<br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
							info@example.com<br>
						</p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Social Networks</h4>
						<p>Cras fermentum odio eu feugiat lide par naso tierra videa
							magna derita valies</p>
						<div class="social-links mt-3">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
								href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
							<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
							<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="container footer-bottom clearfix">
			<div class="copyright">
				&copy; Copyright <strong><span>MyEduMySelect</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

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
	<script src="/resources/include/academy/newPasswd.js"></script>
  	<!-- <script src="/resources/include/assets/js/academy.js"></script>
  	<script src="/resources/include/academy/academyJoin.js"></script>
	<script src="/resources/include/academy/common.js"></script> -->
	<script src="/resources/include/assets/js/main.js"></script>
	<!-- <script src="/resources/include/academy/mypage.js"></script> -->

</body>

</html>