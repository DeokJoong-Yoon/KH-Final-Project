<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
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
<link href="/resources/include/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/include/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/assets/css/join.css" rel="stylesheet">

</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo me-auto">
				<a href="index.html">MyEdu<br />MySelect
				</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="#hero">홈</a></li>
					<li><a class="nav-link scrollto" href="#about">About</a></li>
					<li><a class="nav-link scrollto" href="#team">Team</a></li>
					<li class="dropdown"><a href="#"><span>메뉴</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">홍보게시판</a></li>
							<li><a href="#">매칭게시판</a></li>
							<li><a href="#">문의게시판</a></li>
							<li><a href="#">마이페이지</a></li>
						</ul></li>
					<c:choose>
                            <c:when test="${not empty commonLogin}">
                                <li><a class="nav-link scrollto">
                                <c:if test="${commonLogin.memberTypeId == 1}">[개인]&nbsp&nbsp</c:if>
                                <c:if test="${commonLogin.memberTypeId == 2}">[학원]&nbsp&nbsp</c:if>
                                ${commonLogin.name} 님 환영합니다.</a></li>
                                <li>
                                    <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
                                        <button class="getstarted scrollto btn btn-aquamarine"type="submit">로그아웃</button>
                                    </form>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="getstarted scrollto" href="${pageContext.request.contextPath}/loginselect">로그인/회원가입</a></li>
                            </c:otherwise>
                        </c:choose>

				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>JOIN</h1>
					<h2>MyEduMySelect에 가입하여<br>더 많은 서비스를 누려 보세요!</h2>
					
					<br>
					<div class="desc">
						<p>MyEduMySelect는 두 종류의 회원으로 이용 가능합니다.
						<br>당신에게 맞는 회원 유형을 선택하세요.</p><br>
						<ul>
							<li><strong>&nbsp개인회원&nbsp</strong>
								<br>&nbsp개인적인 학습 및 성장을 추구하는 분들을 위한 회원 유형입니다.</li>
							<br>
							<li><strong>&nbsp학원회원&nbsp</strong>
								<br>&nbsp학원 또는 교육기관에 소속되어 있는 분들을 위한 회원 유형입니다.</li>
						</ul>
					</div>
					


				</div>
				<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
					data-aos-delay="200">
					<img src="/resources/include/assets/img/hero-img.png"
						class="img-fluid animated" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<!-------------------------------------- 여기부터 회원가입 입력란 시작-------------------------------------------->
	<section>
		<form action="/personalSignUp">
		  <div class="container" style="padding-top: 1rem;">
		  		<div class="section-title">
		  			<h2>개인정보 취급방침 동의</h2>
		  		</div>
		        
		        <span style="font-size: 1rem; color: blue;">* 아래 약관에 동의 후 이용 가능합니다.</span>
		        <div style="padding-top: 1rem;">
		            <textarea id="privacy_scroll" style="resize: none; width: 100%; height: 20rem; padding: 0.5rem;" readonly>
개인정보 취급방침

MyEduMySelect는 사용자의 개인정보를 매우 중요하게 생각하며, 이에 대한 보호 및 안전성 확보를 위해 최선을 다하고 있습니다. 
개인정보 취급방침은 다음과 같은 내용을 포함하고 있습니다.

[수집하는 개인정보의 항목 및 수집방법]
- 이용자로부터 직접 수집하는 정보: 이름, 전화번호, 이메일 주소 등
- 서비스 이용과정에서 자동으로 수집되는 정보: IP 주소, 쿠키, 서비스 이용기록 등
  (온라인 폼, 이메일, 서비스 이용, 이벤트 응모 등을 통해 개인정보를 수집할 수 있습니다.)

[개인정보의 이용 목적]
- 서비스 제공, 운영, 개선
- 고객상담 및 민원처리
- 마케팅 및 광고에의 활용
- 법령 및 이용약관에 따른 의무의 이행
- 개인정보의 보유 및 이용 기간
이용자가 회원가입을 탈퇴하는 경우 또는 회원의 요청에 따라 개인정보를 파기할 때까지 보유 및 이용됩니다.
다만, 관련 법령에서 정하는 바에 따라 일정 기간 동안 보존될 수 있습니다.

[개인정보의 제3자 제공]
사용자의 개인정보는 원칙적으로 외부에 제공되지 않습니다.
다만, 이용자의 동의가 있는 경우 또는 법령에 의해 요구되는 경우를 제외하고는 해당되지 않습니다.

[개인정보의 안전성 확보 조치]
개인정보 보호를 위해 다음과 같은 기술적, 관리적, 물리적 조치를 취하고 있습니다.
- 암호화 통신
- 접근 제한
- 보안 프로그램 설치 및 주기적인 점검
- 개인정보의 열람, 정정 및 삭제
이용자는 언제든지 자신의 개인정보를 열람, 정정하거나 삭제할 수 있습니다.
이를 위해서는 서비스 내의 개인정보 관리 기능을 이용하거나 개인정보 보호 담당자에게 문의하시기 바랍니다.

[개인정보 관련 문의 및 불만 처리]
개인정보 관련 문의 및 불만 사항은 서비스 내 고객센터를 통해 신속하고 정확하게 처리될 수 있도록 최선을 다하겠습니다.

[개인정보 취급방침의 변경]
개인정보 취급방침은 법령이나 서비스의 변경사항에 따라 수시로 변경될 수 있습니다.
변경된 개인정보 취급방침은 서비스 내 공지사항을 통해 공지될 예정입니다.
		            </textarea>
		        </div>
		        <div style="width: 100%; text-align: center; margin: 1rem 0;">
		            <br><p><b>개인정보 취급방침에 동의하십니까?</b></p>
		            <div class="radio-wrapper">
		                <label style="margin-left: 0.5rem; color: black;">
		                    <input type="radio" name="privacy" value="agree" checked> 동의함
		                </label>&nbsp;&nbsp;&nbsp;
		                <label style="margin-left: 0.5rem; color: black;">
		                    <input type="radio" name="privacy" value="disagree"> 동의하지 않음
		                </label>
		            </div>
		        </div>
	         
			     <!-- 버튼 컨테이너 추가 -->
				 <div class="button-container">
				 	<button type="button" id="personalJoin" onclick="window.location.href='/useraccount/join/personal'">개인 회원가입 페이지로 이동</button>
				 	<button type="button" id="academyJoin" onclick="window.location.href='/academyaccount/join'">학원 회원가입 페이지로 이동</button>
				</div>
		    </div>
	    </form>
    </section>


	<!-------------------------------------------- 회원가입 입력한 끝 ---------------------------------------------->

	<!-- ======= Footer ======= -->
	<footer id="footer">

		<div class="footer-newsletter">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-6">
						<h4>Join Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>MyEduMySelect</h3>
						<p>
							A108 Adam Street <br> New York, NY 535022<br> United
							States <br> <br> <strong>Phone:</strong> +1 5589 55488
							55<br> <strong>Email:</strong> info@example.com<br>
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
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/resources/include/assets/vendor/aos/aos.js"></script>
	<script
		src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/include/academy/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/assets/js/main.js"></script>
</body>
</html>