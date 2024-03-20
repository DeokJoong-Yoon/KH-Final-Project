<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
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
  <link href="/resources/include/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

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
  <!-- <link rel="stylesheet" type="text/css" href="/resources/include/assets/css/academy.css"> -->
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh3E263XmFcJlSAwiqF/X57qzdN1yW+i" crossorigin="anonymous"> -->
    <style>
        .error { display: block; padding: 10px 0px; font-size: 18px; color: #dc3545; }
    </style>

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
              <li><a href="#">자유게시판</a></li>
              <li><a href="#">홍보게시판</a></li>
              <li><a href="/matching/">매칭게시판</a></li>
              <li><a href="#">문의게시판</a></li>
              <li><a href="/academyaccount/mypage">마이페이지</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <c:choose>
              <c:when test="${not empty commonLogin}">
                  <li><a class="nav-link scrollto">
                  <c:if test="${commonLogin.memberTypeId == 1}">[개인]&nbsp&nbsp</c:if>
                  <c:if test="${commonLogin.memberTypeId == 2}">[학원]&nbsp&nbsp</c:if>
                  ${commonLogin.name} 님 환영합니다.</a></li>
                  <li>
                      <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
                          <button class="getstarted  btn btn-aquamarine"type="submit">로그아웃</button>
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
      	<c:if test="${empty commonLogin}">
	        <div class="loginClass col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
	          <h1>ACADEMY LOGIN</h1>
	          <h2>학원 회원이신가요?</h2>
	        </div>
	        <div class="loginZone"  data-aos="fade-up" data-aos-delay="200">
	        	<form:form id="loginForm" action="/academyaccount/login" modelAttribute="loginVo" method="POST">
		            <!-- memberTypeId -->
	                <input type="hidden" name="memberTypeId" value="2">
	                
	                <!-- 글로벌 에러 출력 -->
		            <spring:hasBindErrors name="userAccountLoginDto">
		                <c:forEach var="error" items="${errors.globalErrors}">
		                    <p class="error">${error.defaultMessage}</p>
		                </c:forEach>
		            </spring:hasBindErrors>
	                
	                <table>
	                	<tr>
	                		<th>
	                			<label for="id">아이디</label>
	                		</th>
	                		<td>
	                			<form:input path="id" type="text" name="id" id="id" placeholder="아이디를 입력해주세요"/>
	                			<form:errors path="id" cssClass="error" />     
	                		</td>
	                	</tr>
	                	<tr>
	                		<th>
	                			<label for="passwd">비밀번호</label>
	                		</th>
	                		<td>	
	                			<form:input path="passwd" type="password" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요"/>
		               			<form:errors path="passwd" cssClass="error" />
	                		</td>
	                	</tr>
	                </table>
	                <button type="submit" id="loginBtn">로그인</button>	
				</form:form> <br>
		                
		        <div class="buttons">
		        	<form method="GET" action="/academyaccount/join" id="joinForm">
						<button type="submit" class="join-button">회원가입 하러 가기</button>
					</form>
					<form method="GET" action="/" id="homeForm">
						<button type="submit" class="home-button">홈으로 가기</button>
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
        		<h1>${commonLogin.name} 님 환영합니다.</h1><br>
        		<div class="buttons">
        			<form method="POST" action="/useraccount/logout" id="joinForm">
			            <button type="submit" id="logoutBtn" class="btn btn-primary btn-sm" >로그아웃</button>
			        </form>
			        <form action="/" class="homeForm">
						<button class="home-button" type="submit">홈으로 가기</button>
					</form>
        		</div>
        	</div>
        </c:if>
      </div>
    </div>
   </section><!-- End Hero -->

  <main id="main">


  </main><!-- End #main -->

	<!-- <script>
	  $(document).ready(function() {
	    let errorMsg = "${errorMsg}";
	    if (errorMsg) {
	        alert(errorMsg);
	        errorMsg = "";
	    }
	    
	    if (${not empty personalLogin}) {
	        let personalName = "${commonLogin.name}"; 
	        alert("환영합니다! ${commonLogin.name}님 MyEduMySelect 입니다");
	    }
	  });
	</script> -->
	
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
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>MyEduMySelect</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
  <script src="/resources/include/academy/academyLogin.js"></script>  
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
  
  <script>
    $(function() {
        let errorMsg = "${errorMsg}";
        if(errorMsg) {
            alert(errorMsg);
            errorMsg = "";
        }
    });
    
    $(function() {
        if (${not empty academyLogin}) {           
            let academyManagerName = "${commonLogin.name}";
            alert("환영합니다! ${commonLogin.name}님 MyEduMySelect 입니다");
        }
    });

</script>
	
</body>

</html>