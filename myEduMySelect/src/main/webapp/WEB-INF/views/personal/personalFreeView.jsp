<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>					
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>		
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
<link href="/resources/include/board/free/css/free.css" rel="stylesheet">

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
				
       
			</ul>
		  </li>         		
			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= 게시판 영역 ======= -->
	<section id="hero" class="d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="commonNo" name="commonNo" />
				</form>

				<div class="col-12 text-center banner">
		           내가 쓴 게시글(자유 게시판)<br/>
		       </div> 
		    </div>
		</div>
	</section>
	
	<main id="main">
	<form id="detailForm">
			<input type="hidden" id="commonNo" name="commonNo" />
		</form>
		<form id="freeForm" name="freeForm">
			<input type="hidden" name="pageNum" id="pagenum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

		
			<!-- End Page Title -->

			<section class="section">

				<div class="row">
					<div class="col-lg-12">

						<div class="card">
								<div class="list">
					<table >
						<thead>
							<tr>
								<th>글번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성시간</th>
								<th>조회수</th>
								<th></th>
							</tr>
						</thead>
						<tbody id="list" >
						    <c:choose>
						        <c:when test="${not empty freeBoardList}">
						            <c:forEach var="free" items="${freeBoardList}" varStatus="status">
						                <tr data-num="${free.commonNo}">
						                    <td>${free.commonNo}</td>
						                    <td class="goDetail">${free.commonTitle}
						                        <c:if test="${free.freeReplyCnt > 0}">
													<span class="freeReplyCnt">[${free.freeReplyCnt}]</span>
												</c:if>
						                    </td>
						                    <td class="goDetail">${free.personalId}</td>
						                    <td class="text-start">${free.commonRegisterDate}</td>
						                    <td class="text-center">${free.commonReadcnt}</td>
						                    <td>
						                    <c:if test="${not empty free.commonFile}">
						                        <img src="/uploadStorage/free/${free.commonFile}" class="rounded w-50 h-50" />
						                    </c:if>
						                    <c:if test="${empty free.commonFile}">
						                        <img src="/resources/include/board/images/no-image-icon.png" class="rounded w-50 h-50" />
						                    </c:if>
						                </tr>
						            </c:forEach>
						        </c:when>
						        <c:otherwise>
						            <tr>
						                <td colspan="5">등록된 게시물이 존재하지 않습니다.</td>
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
										<li class="page-item">
											<a href="${pageMaker.startPage - 1}" class="page-link">Previous</a>
										</li>
									</c:if>

									<!-- 바로가기 번호 출력 -->
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
											<a href="${num}" class="page-link">${num}</a>
										</li>
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
	</main>


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
	<!--<script src="/resources/include/board/free/js/freeList.js"></script>-->
	<!--<script src="/resources/include/board/common/main.js"></script>-->
	<script src="/resources/include/personal/main.js"></script>
	<script src="/resources/include/personal/freeBoardPersonalView.js"></script>
	<script>
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word = "<c:out value='${FreeVO.keyword}' />";
		let value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${FreeVO.keyword}' />");
			$("#search").val("<c:out value='${FreeVO.search}' />");
			
			if ($("#search").val() != 'commonContent') {
				if ($("#search").val() == 'commonTitle')
					value = "#list tr td.goDetail";
				else if ($("#search").val() == 'personalId') value = "#list tr td.name";
				console.log($(value + ":contains('" + word + "')").html());
				$(value + ":contains('" + word + "')").each(function() {
							let regex = new RegExp(word, 'gi');
							$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
				});
			}
		}
	});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
		    // 각 게시물의 댓글 수를 가져와서 표시하는 함수
		    function updatefreeReplyCnt(commonNo) {
		        $.ajax({
		            type: 'POST',
		            url: '/freeReplyCnt',
		            data: { commonNo: commonNo },
		            success: function(data) {
		                // 성공적으로 댓글 수를 가져온 경우, 해당 게시물의 댓글 수를 업데이트
		                $('#freeReplyCnt' + commonNo).html('<b>[' + data + ']</b>');
		            },
		            error: function(xhr, status, error) {
		                console.error('댓글 갯수를 가져오는데 실패하였습니다: ' + error);
		            }
		        });
		    }
	
		    // 페이지 로드 시 각 게시물 별로 댓글 수를 업데이트
		    $('[id^=freeReplyCnt]').each(function() {
		        let commonNo = $(this).attr('id').replace('freeReplyCnt', '');
		        updatefreeReplyCnt(commonNo);
		    });
		});

	</script>
</body>

</html>