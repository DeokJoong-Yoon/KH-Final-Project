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
	
  <!-- <link rel="stylesheet" type="text/css" href="/resources/include/assets/css/academySignUp.css"> -->

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
	          <li><a class="nav-link scrollto active" href="/">홈</a></li>
	          <li><a class="nav-link scrollto" href="#about">About</a></li>
	          <li><a class="nav-link scrollto" href="#team">Team</a></li>
	          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
	            <ul>
	              <li><a href="/free/freeList">자유게시판</a></li>
	            <li><a href="/advertiseBoardList">홍보게시판</a></li>
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
	
	
	<!-- <script>
		window.onload = function(){
			let confirmMsg = "${confirmMsg}";
			if(confirmMsg) {
				let result = confirm(comfirmMsg);
				if(result) {
					window.location.href= "/useraccount/login";
				} else {
					window.location.href= "/matching/boardList";
				}
			}
		}
	</script> -->

  

  <!-- ======= 설명 영역 ======= -->
  <section class="mcHero d-flex align-items-center">

    <div class="container">
      <div class="row" >
		<div class="col-12 text-center mcBanner">
            내가 쓴 글 목록(홍보 게시판)<br/>
            <div class="mcDescBox">
            	<p>내가 쓴 글이 뭐가있을까?</p>
            </div>
        </div>  
      </div>
    </div>
   </section><!-- 설명영역 끝 -->

 
  <main id="main" class="main">
		<form id="detailForm">
			<input type="hidden" id="commonNo" name="commonNo" />
		</form>
		<form id="advertiseForm" name="advertiseForm">
			<input type="hidden" name="pageNum" id="pagenum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

			<!-- <div class="pagetitle">
				<h1>Advertise Board</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
						<li class="breadcrumb-item active">advertise board</li>
					</ol>
				</nav>
			</div>
			End Page Title -->

			<section class="section">

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="row g-2 align-items-center">
									<div class="col-auto">
										<label for="search" class="card-title">search</label>
									</div>
									<div class="col-auto">
										<select id="search" name="search" class="form-select form-select-sm">
											<option value="all">All</option>
											<option value="common_title">Title</option>
											<option value="common_content">Content</option>
										</select>
									</div>
									<div class="col-auto">
										<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요" class="form-control form-control-sm" />
									</div>
									<div class="col-auto">
										<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
									</div>
								</div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty advertiseBoardList}">
												<c:forEach var="advertise" items="${advertiseBoardList}" varStatus="statusNumber">
													<%-- <c:if test="${statusNumber.index < 20}"></c:if> --%>
														<tr data-num="${advertise.commonNo}">
															<th scope="row">${advertise.commonNo}</th>
															<th class="goDetail text-start">${advertise.commonTitle}</th>
															<td class="goDetail text-start">${advertise.commonNickname}</td>
															<td class="goDetail text-start">${advertise.commonRegisterDate}</td>
															<td class="goDetail text-start">${advertise.commonReadcnt}</td>
														</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5">조건에 맞는 게시글이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<%-- ======================== 페이징 출력 시작 ========================--%>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a href="${pageMaker.startPage - 1}" class="page-link">Previous</a> <!-- <a href="${pageMaker.startPage - 10}" class="page-link">Previous</a> --></li>
									</c:if>

									<!-- 바로가기 번호 출력 -->
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}"><a href="${num}" class="page-link">${num}</a></li>
									</c:forEach>
									<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
									<c:if test="${pageMaker.next}">
										<li class="page-item"><a href="${pageMaker.endPage + 1}" class="page-link">Next</a></li>
									</c:if>

								</ul>

							</nav>

						</div>
					</div>
				</div>
			</section>
		</form>
	</main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>MyEduMySelect</h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
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
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/matching/js/matchingBoard.js"></script>
  
  
  <script>
  
/*   	$(function() {
  		let word = "<c:out value='${matchingBoard.keyword}' />";
  		let value ="";
  		
  		if(word != "") {
			$("#keyword").val("<c:out value='${boardVO.keyword}' />");
			value = "#mcBoardList tr td.mbdLink";
			console.log($(value + ":contains('" + word + "')").html());
			$(value + ":contains('" + word + "')").each(function(){
				let regex = new RegExp(word, 'gi');
				$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
			})
  		}
  	}) */
  </script>

</body>

</html>