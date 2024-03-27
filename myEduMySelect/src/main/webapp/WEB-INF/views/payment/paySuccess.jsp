<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link href="/resources/include/payment/css/style.css" rel="stylesheet">

<style>
/* 스타일 추가 */
.bx-check {
	font-weight: bold;
	border: 2px solid #28a745; /* 진한 녹색 테두리 색상 */
	padding: 8px; /* 내부 여백 */
	margin: 5px 0; /* 외부 여백 */
	display: block; /* 한 줄씩 표시 */
}
</style>

<section id="hero" class="d-flex align-items-center">

	<div class="container">
		<div class="row">
			<div
				class="col-lg-12 d-flex flex-column justify-content-center pt-0 pt-lg-0 order-2 order-lg-10"
				data-aos="fade-up" data-aos-delay="200">
				<div class="d-flex justify-content-center justify-content-lg-start">
					<section id="pricing" class="pricing">
						<div class="container" data-aos="fade-up">
							<div class="row" data-aos="fade-up" data-aos-delay="100">
								<h1>결제 완료</h1>
								<div class="box">
									<h3>결제 내역</h3>
									<ul>
										<li class="bx bx-check">pay id : ${paymentVO.paymentId}</li>
										<li class="bx bx-check">pg : ${paymentVO.pg}</li>
										<li class="bx bx-check">pay method :
											${paymentVO.payMethod}</li>
										<li class="bx bx-check">merchant id :
											${paymentVO.merchantUid}</li>
										<li class="bx bx-check">pay name : ${paymentVO.name}</li>
										<li class="bx bx-check">pay amount : ￦199,000</li>
										<li class="bx bx-check">academy id :
											${paymentVO.academyId}</li>
										<li class="bx bx-check">academy number :
											${paymentVO.academyNumber}</li>
										<li class="bx bx-check">academy name :
											${paymentVO.academyName}</li>
										<li class="bx bx-check">academy manager : name ${paymentVO.academyManagerName}</li>
										<li class="bx bx-check">academy manager email : ${paymentVO.academyManagerEmail}</li>
										<li class="bx bx-check">academy
											managerphone : ${paymentVO.academyManagerPhone}</li>
										<li class="bx bx-check">payment
											date : ${paymentVO.paymentDate}</li>
									</ul>
								<a href="/">Home</a>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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

<script src="/resources/include/payment/js/paySuccess.js"></script>


</body>
</html>