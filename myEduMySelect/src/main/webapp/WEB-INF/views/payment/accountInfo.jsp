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
								<h1>계좌이체 안내</h1>
								<div class="box">
									<h3>결제 내역</h3>
									<ul>
										<li class="bx bx-check">account bank name: KH Bank</li>
										<li class="bx bx-check">account manager name : Yoon DJ</li>
										<li class="bx bx-check">account number :
											9391-1939-4847-5390</li>
										<li class="bx bx-check">account amount : ￦199,000 per
											month</li>
										<li class="bx bx-check">24시간 이내로 처리 예정</li>
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

<!-- JS Files -->
<script src="/resources/include/assets/vendor/aos/aos.js"></script>
<script	src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script	src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script	src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script	src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script	src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script	src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

<script src="/resources/include/payment/js/paySuccess.js"></script>

</body>
</html>