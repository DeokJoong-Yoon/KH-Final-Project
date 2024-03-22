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
<link href="/resources/include/board/free/css/freeUpdate.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

    <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto">
      	<a href="/">MyEdu<br />MySelect</a>
      </h1>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/">홈</a></li>
          <li><a class="nav-link scrollto" href="/">About</a></li>
          <li><a class="nav-link scrollto" href="/">Team</a></li>
          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              	<li><a href="/notice/boardList">공지사항</a></li>
				<li><a href="/matching/">맞춤형 검색</a></li>
				<li><a href="/matching/boardList">매칭 게시판</a></li>
				<li><a href="/advertise/advertiseBoardList">학원 홍보 게시판</a></li>
				<li><a href="/free/freeList">자유 게시판</a></li>
				<c:if test="${commonLogin.memberTypeId == 1}">
				    <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">마이페이지</a></li>
				</c:if>
                         <c:if test="${commonLogin.memberTypeId == 2}">
                             <li><a href="${pageContext.request.contextPath}/academyaccount/mypage" id="mypageBtn">학원마이페이지</a></li>
                         </c:if>
			</ul>
		  </li>
			<li><a class="nav-link scrollto" href="/">Pricing</a></li>
			<c:choose>
                     <c:when test="${not empty commonLogin}">
                         <li><a class="nav-link scrollto">
                            <c:if test="${commonLogin.memberTypeId == 1}">[개인] </c:if>
                            <c:if test="${commonLogin.memberTypeId == 2}">[학원] </c:if>
                            ${commonLogin.name}님 환영합니다.</a></li>
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
  </header><!-- End Header -->
  
  <!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="commonNo" name="commonNo" />
				</form>

				<div class="col-12 text-center banner">
		            자유 게시판<br/>
		            <div class="descBox">
		            	자유롭게 글을 작성할 수 있는 <b>자유게시판</b>입니다.<br>
		            	질문, 후기, 정보 등 도움이 될 만한 다양한 글을 남겨주세요!
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->


	
	<!-- ======= 게시판 수정 영역 ======= -->
	<main id="main">
	
		<section id="form">
			<div class="container">

				<form id="updateForm" name="updateForm">
					<input type="hidden" id="commonNo_hidden" name="commonNo" value="${freeUpdateData.commonNo}" />
					<input type="hidden" id="commonFile" name="commonFile" value="${freeUpdateData.commonFile}" />"
							
					<div class="boardDetail">		
						<table>
							<tr>
								<th>글 번호</th>
								<td>${freeUpdateData.commonNo} (조회수 : ${freeUpdateData.commonReadcnt})</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${freeUpdateData.personalId}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${freeUpdateData.commonRegisterDate}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" id="commonTitle" name="commonTitle" value="${freeUpdateData.commonTitle}" placeholder="제목을 입력해 주세요" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="commonContent" id="commonContent" placeholder="내용을 입력해주세요." rows="20">${freeUpdateData.commonContent}</textarea></td>
							</tr>
							<tr>
								<th>이미지 파일</th>
								<td>
									<input type="file" name="file" id="file" class="form-control" />
								</td>
							</tr>
						</table>
					</div>
				</form>
				
				<div class="detailButtons">
					<button type="submit" id="freeUpdateBtn" class="btn btn-primary btn-sm" >수정</button>
					<button type="button" id="freeCancelBtn" class="btn btn-primary btn-sm">취소</button>
					<button type="button" id="freeListBtn" class="btn btn-primary btn-sm">목록</button>
				</div>
			</div>
		</section>


	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
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
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/board/free/js/freeUpdate.js"></script>
	<script src="/resources/include/board/common/main.js"></script>
	<script>
		$(function() {
			let errorMsg = "${errorMsg}";
			if (errorMsg != "") {
				alert(errorMsg);
			}
		});

	</script>
</body>

</html>