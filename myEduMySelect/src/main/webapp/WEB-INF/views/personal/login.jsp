<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="kr">

<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>MyEduMySelect </title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	
	<!-- Favicons -->
	<link href="/resources/include/assets/img/favicon.png" rel="icon">
	<link href="/resources/include/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
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
	<link href="/resources/include/assets/css/login.css" rel="stylesheet">
	
	<!-- =======================================================
	  * Template Name: MyEduMySelect
	  * Updated: Jan 29 2024 with Bootstrap v5.3.2
	  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
	  * Author: BootstrapMade.com
	  * License: https://bootstrapmade.com/license/
	  ======================================================== -->
	
	
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/personal/joinForm.js"></script>
	<script src="/resources/include/js/common.js"></script>
	
	<script>
	$(function() {
	    $("#loginBtn").on("click", function() {      
	        if (!chkData("#id","아이디를")) return;
	        else if (!chkData("#passwd","비밀번호를")) return;
	        else {          
	            $("#loginForm").attr({
	                "method":"post", 
	                "action":"/useraccount/login"      
	            });                     
	            $("#loginForm").submit();      
	        }
	    });
	    
	    $("#logoutBtn").on("click", function() {
	        location.href = "/useraccount/logout"
	    });
	});
	
	    </script>
	
	
	<script>
	    window.onload = function() {
	        var confirmMessage = "${confirmMessage}";
	        if (confirmMessage) {
	            alert(confirmMessage);
	        }
	    };
	</script>


</head>
<body>


	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo me-auto">
				<a href="/">MyEdu<br />MySelect
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
							<li><a href="/matching/">매칭게시판</a></li>
							<li><a href="#">문의게시판</a></li>
							<li><a href="/myPage">마이페이지</a></li>
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
				<c:if test="${empty commonLogin}">
					<div class="loginClass col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
						<h1>PERSONAL LOGIN</h1>
						<h2>개인 회원이신가요?</h2>
					</div>
					<div class="loginZone"  data-aos="fade-up" data-aos-delay="200">
						<form id="loginForm">
							<input type="hidden" name="memberTypeId" id="memberTypeId" value="1">
							<table>
								<tr>
									<th><label for="id">아이디</label></th>
									<td><input type="text" name="id" id="id" placeholder="아이디를 입력해 주세요"></td>
								</tr>
								<tr>
									<th><label for="passwd">비밀번호</label></th>
									<td><input type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해 주세요"></td>
								</tr>
							</table>
							<button type="button" id="loginBtn">로그인</button>
						</form> <br>
						
						<div class="buttons">
							<form action="/useraccount/join" id="joinForm">
								<button class="join-button" type="submit">회원가입 하러 가기</button>
							</form>
			
							<form action="/" class="homeForm">
								<button class="home-button" type="submit">홈으로 가기</button>
							</form>
						</div>
					</div>
					<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
						data-aos-delay="200">
						<img src="/resources/include/assets/img/hero-img.png"
							class="img-fluid animated" alt="">
					</div>
				</c:if>
				
				<c:if test="${not empty commonLogin}">
					<div>
						<h2>MyEduMySelect</h2>
						<h1>${commonLogin.name} 님 환영합니다.</h1> <br>
						<div class="buttons">
							<button type="button" id="logoutBtn">로그아웃</button>
							<form action="/" class="homeForm">
								<button class="home-button" type="submit">홈으로 가기</button>
							</form>
						</div>
					</div>
				</c:if>
				
				
				
				
			</div>
			
		</div>
	</section>
	<!-- End Hero -->




	<main>
		
	</main>

	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/personalLogin.js"></script>
	<script>
    $(function() {
        let errorMsg = "${errorMsg}";
        if(errorMsg) {
            alert(errorMsg);
            errorMsg = "";
        }
    });
    
    $(function() {
        
        if (${not empty personalLogin}) {
           
            let personalName = "${commonLogin.name}";

         
            alert("환영합니다! ${commonLogin.name}님 MyEduMySelect 입니다");
        }
    });
    

   


</script>




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
