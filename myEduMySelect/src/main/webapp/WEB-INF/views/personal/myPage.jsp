<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<li><a href="/myPage">마이페이지</a></li>
						</ul></li>
					<li><a class="nav-link scrollto" href="#contact">Contact</a></li>
					<c:choose>
						<c:when test="${not empty commonLogin}">
							<li><a class="nav-link scrollto"> <c:if
										test="${commonLogin.memberTypeId == 1}">회원 </c:if> <c:if
										test="${commonLogin.memberTypeId == 2}">학원 </c:if>
									${commonLogin.name}님 환영합니다.
							</a></li>
							<li>
								<form
									action="${pageContext.request.contextPath}/useraccount/logout"
									method="POST">
									<button class="getstarted scrollto btn btn-aquamarine"
										type="submit">로그아웃</button>
								</form>
							</li>
						</c:when>
						<c:otherwise>
							<li><a class="getstarted scrollto"
								href="${pageContext.request.contextPath}/loginselect">로그인/회원가입</a></li>
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
	<form:form id="updateForm" action="/personalUpdate" modelAttribute="personalLoginVO" method="POST" name="personalMyPage">
    <br></br>
    <h1 class="title">나의 정보</h1>
    <div class="sign-form">
        <!-- 아이디 -->
        <div class="form-group">
            <label for="personalId">아이디</label>
            <form:input path="personalId" type="text" value="${personalLoginVO.personalId}" id="personalId" name="personalId" class="form-control" style="width: 250px;" disabled="true" />
        </div>
        <br />
        <!-- 이름 -->
        <div class="form-group">
            <label for="personalName">이름</label>
            <form:input path="personalName" type="text" value="${personalLoginVO.personalName}" id="personalName" name="personalName" class="form-control" style="width: 250px;" disabled="true" />
        </div>
        <!-- 이메일 -->
        <div class="form-group">
            <label for="personalEmail">이메일</label>
            <form:input path="personalEmail" type="email" value="${personalLoginVO.personalEmail}" id="personalEmail" name="personalEmail" class="form-control" style="width: 250px;" />
        </div>
        <br />
        <!-- 생년월일 -->
        <div class="form-group">
            <label for="personalBirth">생년월일</label>
            <form:input path="personalBirth" type="text" value="${personalLoginVO.personalBirth}" id="personalBirth" name="personalBirth" class="form-control" style="width: 250px" disabled="true" />
        </div>
        <br />
        <!-- 주소 -->
        <div class="form-group">
            <label for="personalAddress">주소</label>
            <form:input path="personalAddress" type="text" value="${personalLoginVO.personalAddress}" id="personalAddress" name="personalAddress" class="form-control" style="width: 250px" />
        </div>
        <br />
        <!-- 전화번호 -->
        <div class="form-group">
            <label for="personalPhone">전화번호</label>
            <form:input path="personalPhone" type="text" value="${personalLoginVO.personalPhone}" id="personalPhone" name="personalPhone" class="form-control" style="width: 250px" />
        </div>
        <br /> <br /> <br /> <br /> <br />
        <!-- 수정 버튼 -->
        <button type="submit" id="personalUpdateBtn" class="btn btn-success btn-sm">수정하기</button>
        <!-- 메시지 표시 영역 -->
        <div id="message"></div>
        <!-- 매칭 게시판에서 내가 쓴 글 목록 보기 -->
        <a href="/personalMatchingList" class="btn btn-primary">매칭 게시판 내가 쓴 글 목록</a>
        
    </div>
</form:form>


<form id="deleteForm" action="/withdrawal/personal" method="post">
    <button type="submit" onclick="return confirm('정말 회원탈퇴를 하시겠습니까?')">회원탈퇴</button>
</form>


<button id="changePasswdBtn" class="btn btn-primary">비밀번호 수정</button>

<script>
    $(function() {
        $("#updateForm").on("submit", function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            // 수정 여부를 사용자에게 확인하기 위해 알림창을 표시합니다.
            if (confirm("개인 정보를 수정하시겠습니까?")) {
                // 사용자가 확인을 누른 경우, AJAX를 통해 서버로 업데이트 요청을 전송합니다.
                $.ajax({
                    url: "/personalUpdate",
                    type: "POST",
                    data: $(this).serialize(),
                    success: function(response) {
                        // 서버에서 성공적인 응답을 받았을 때 실행되는 부분
                        alert("개인 정보가 성공적으로 업데이트되었습니다.");
                        // 성공한 경우 페이지를 새로고침하여 변경된 정보를 반영할 수 있도록 한다.
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        alert("개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
                        console.error(xhr.responseText);
                    }
                });
            } else {
                return false;
            }
        });

        $("#changePasswdBtn").on("click", function() {
            // 사용자에게 비밀번호를 수정할 것인지 묻는 알림
            if (confirm("비밀번호를 수정하시겠습니까?")) {
                window.location.href = "/newPasswd";
            } else {
                // 사용자가 취소를 누른 경우 아무 동작 없음
            }
        });
    });
</script>

















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