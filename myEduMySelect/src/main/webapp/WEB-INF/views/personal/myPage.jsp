<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이 페이지</title>
<link rel="stylesheet" href="/resources/include/css/style.css">
</head>
<body>
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


<script src="/resources/include/personal/jquery-3.7.1.min.js"></script>
<script src="/resources/include/personal/myPage.js"></script>
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
					<li><a class="nav-link scrollto" href="#contact">Contact</a></li>
					<li><a class="getstarted scrollto" href="/signUp">로그인/회원가입</a></li>

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
					<h1>마이페이지</h1>
					<h2></h2>


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


	<!-- 여기서부터 마이페이지 -->
	<form id="updateForm" action="/personalUpdate" method="POST"
		style="max-width: 600px; margin: auto;">
		<h1 class="title" style="text-align: center;">나의 정보</h1>
		<div class="sign-form">
			<!-- 아이디 -->
			<div class="form-group row">
				<label for="personalId" class="col-sm-3 col-form-label">아이디</label>
				<div class="col-sm-9">
					<input type="text" value="${personalLogin.personalId}"
						id="personalId" name="personalId" class="form-control" disabled>
				</div>
			</div>
			<br />

			<!-- 이름 -->
			<div class="form-group row">
				<label for="personalName" class="col-sm-3 col-form-label">이름</label>
				<div class="col-sm-9">
					<input type="text" value="${personalLogin.personalName}"
						id="personalName" name="personalName" class="form-control"
						disabled>
				</div>
			</div>
			<br />

			<!-- 비밀번호 -->
			<!--	<div class="form-group row">
				<label for="personalPasswd" class="col-sm-3 col-form-label">비밀번호</label>
				<div class="col-sm-9">
					<input type="password" id="personalPasswd" name="personalPasswd"
						class="form-control" required> <small
						class="form-text text-muted">정보를 수정하려면 반드시 비밀번호를 입력하세요.</small>  --><a
						href="/newPasswd" class="btn btn-primary">비밀번호 변경페이지로 이동</a>
				</div>
			<br />
			


			<!-- 이메일 -->
			<div class="form-group row">
				<label for="personalEmail" class="col-sm-3 col-form-label">이메일</label>
				<div class="col-sm-7">
					<input type="email" value="${personalLogin.personalEmail}"
						id="personalEmail" name="personalEmail" class="form-control"
						readonly>
					<button type="button" class="btn btn-primary"
						onclick="showChangeEmail()">이메일 변경</button>
					<button type="button" class="btn btn-primary"
						id="duplicateCheckBtn" style="display: none;"
						onclick="checkEmail()">중복확인</button>
				</div>

			</div>
			<br />


			<!-- 생년월일 -->
			<div class="form-group row">
				<label for="personalBirth" class="col-sm-3 col-form-label">생년월일</label>
				<div class="col-sm-9">
					<input type="text" value="${personalLogin.personalBirth}"
						id="personalBirth" name="personalBirth" class="form-control"
						disabled>
				</div>
			</div>
			<br />

			<!-- 현재주소 -->
			<div class="form-group row">
				<label for="personalAddress" class="col-sm-3 col-form-label">현재
					주소</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						value="${personalLogin.personalAddress}" readonly />
				</div>
				<br /> <br /> <br />

			<!-- 주소 변경하기 -->
				<div class="form-group row">
					<label for="personalAddress" class="col-sm-3 col-form-label">주소변경하기</label>
					<div class="col-sm-9">
						<input id="personal_post" name="personalAddress" type="text"
							class="form-control" placeholder="우편번호" readonly /> <input
							id="personal_addr" name="personalAddress" type="text"
							class="form-control" placeholder="주소" readonly  /> <input
							type="text" class="form-control" id="personalAddress"
							name="personalAddress" placeholder="상세주소입력" onclick="findAddr()" />
						<button type="button" class="btn btn-primary" name="" onclick="findAddr()">주소찾기</button>
					</div>
				</div>
			</div>
				<br /><br />



				<!-- 전화번호 -->
				<div class="form-group row">
					<label for="personalPhone" class="col-sm-3 col-form-label">전화번호</label>
					<div class="col-sm-9">
						<input type="text" value="${personalLogin.personalPhone}"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
							id="personalPhone" name="personalPhone" class="form-control"
							maxlength="11">
					</div>
				</div>
				<br />


				<!-- 수정 버튼 -->
				<div class="form-group row">
					<div class="col-sm-9 offset-sm-3">
						<button type="submit" id="personalUpdateBtn"
							class="btn btn-success btn-sm">수정하기</button>
					</div>
				</div>

				<br />

				<!-- 메시지 표시 영역 -->
				<div id="message" style="text-align: center;"></div>

				<!-- 매칭게시판에서 내가 쓴 글 목록 보기 -->
				<div class="form-group row">
					<div class="col-sm-9 offset-sm-3">
						<a href="/personalMatchingList" class="btn btn-primary">매칭게시판에서
							내가 쓴 글 목록 보기</a>
					</div>
				</div>

	</form>
	<script>
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							console.log(data);

							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var jibunAddr = data.jibunAddress; // 지번 주소 변수
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('personal_post').value = data.zonecode;
							if (roadAddr !== '') {
								document.getElementById("personal_addr").value = roadAddr;
							} else if (jibunAddr !== '') {
								document.getElementById("personal_addr").value = jibunAddr;
							}
						}
					}).open();
		}
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>







	<!-- 마이페이지 끝 -->
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
	<script src="/resources/include/assets/js/main.js"></script>



</body>

</html> 