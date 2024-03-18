<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
<style>
#item-template {
	display: none;
}

.inline {
	display: inline-block;
}
</style>

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<div>
		<%-- 댓글 입력 화면 --%>
		<!-- <div>
			<form id="freereplyForm" name="freereplyForm">
				<div class="row mb-3">
					<label for="personal_id" class="col-sm-1 col-form-label">작성자</label>
					<div class="col-sm-3">
						<input type="text" name="personal_id" id="personal_id" maxlength="6" class="form-control" />
					</div>
					<button type="button" id="freereplyInsertBtn" class="btn btn-primary col-sm-1 sendBtn mx-2">저장</button>
				</div>
				<div class="row mb-3">
					<label for="common_comment_content" class="col-sm-1 col-form-label">댓글내용</label>
					<div class="col-sm-11">
						<textarea name="common_comment_content" id="common_comment_content" class="form-control" rows="3"></textarea>
					</div>
				</div>
			</form>
		</div> -->


		<div id="commentSection">
			<h2>댓글 입력</h2>
			<label for="personalId">작성자:</label>
			<input type="text" id="personalId" name="personal_id">
			<label for="commentContent">댓글 내용:</label>
			<textarea id="commentContent" name="common_comment_content"></textarea>


			<button id="saveComment">저장</button>
		</div>

		<%-- 리스트 영역 --%>
		<div id="list">
			<table class="list" id="item-template">
				<tr>
					<td class="personal_id"></td>
				</tr>
				<tr>
					<td class="common_comment_content"></td>
				</tr>
				<tr>
					<td class="common_comment_date"></td>
				</tr>
				<tr>
					<td><button type="button" id="freeDeleteBtn">삭제</button></td>
				</tr>
			</table>
		</div>

	</div>

	<main id="main"></main>
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
	<script src="/resources/include/board/common/main.js"></script>
	<script>
	$(function() {
	    /* 기본 덧글 목록 */
	    let common_no = ${detail.common_no};
	    listAll(common_no);
	});

	function listAll(common_no) {
	    let url = "/freereplies/all/" + common_no;
	    
	    $.getJSON(url, function(data) {
	        // 받아온 댓글 데이터를 반복문으로 처리하여 화면에 표시
	        $(data).each(function(index) {
	            let common_comment_no = this.common_comment_no;
	            let personal_id = this.personal_id;
	            let common_comment_content = this.common_comment_content;
	            let common_comment_date = this.common_comment_date;
	            let freereplyTotal = common_comment_content.replace(/(\r\n|\r|\n)/g, "<br />");
	            
	            // 화면에 댓글 추가하는 코드
	            let $div = $('#list');
	            let $element = $('#item-template').clone().removeAttr('id');
	            $element.attr("data-num", common_comment_no);
	            $element.addClass("freereply");
	            $element.find('.card-header .personal_id').html(personal_id);
	            $element.find('.card-header .common_comment_date').html(" / " + common_comment_date);
	            $element.find('.card-body .card-text').html(freereplyTotal);
	            
	            $div.append($element);
	        });
	    }).fail(function() {
	        alert("댓글 목록을 불러오는데 실패하였습니다. 잠시 후에 다시 시도해 주세요.");
	    });
	}

	</script>
</body>
</html>