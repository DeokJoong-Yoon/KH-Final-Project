<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<title>Payment</title>
<link href="/resources/include/payment/css/style.css" rel="stylesheet">
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-0 pt-lg-0 order-2 order-lg-10"
					data-aos="fade-up" data-aos-delay="200">
					<div class="d-flex justify-content-center justify-content-lg-start">
						<section id="pricing" class="pricing">
							<div class="container" data-aos="fade-up">
								<div class="row" data-aos="fade-up" data-aos-delay="100">
									<div class="box">
										<h3>결제자 정보</h3>
										<ul class="list-group">
										    <li class="list-group-item border-0" id="academy_id"><span class="bi bi-check"></span>${academyLoginVO.academyId}</li>
										    <li class="list-group-item border-0" id="academy_number"><span class="bi bi-check"></span>${academyLoginVO.academyNumber}</li>
										    <li class="list-group-item border-0" id="academy_name"><span class="bi bi-check"></span>${academyLoginVO.academyName}</li>
										    <li class="list-group-item border-0" id="academy_status"><span class="bi bi-check"></span>0</li>
										    <li class="list-group-item border-0" id="academy_manager_name"><span class="bi bi-check"></span>${academyLoginVO.academyManagerName}</li>
										    <li class="list-group-item border-0" id="academy_manager_email"><span class="bi bi-check"></span>${academyLoginVO.academyManagerEmail}</li>
										    <li class="list-group-item border-0" id="academy_manager_phone"><span class="bi bi-check"></span>${academyLoginVO.academyManagerPhone}</li>
										</ul>
									</div>
								</div>
								<div class="row" data-aos="fade-up" data-aos-delay="100">
									<div class="box">
									<h3>결제 수단</h3>
										<ul>
											<li><i class="bx bx-check"></i>카드결제</li>
											<li>
											<i class="bx bx-check"></i><a href="/payment/accountInfo">계좌이체결제 안내페이지</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="container" data-aos="fade-up"></div>
						</section>
					</div>


				</div>
				<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
					data-aos-delay="200">
					<section id="pricing" class="pricing">
						<div class="container animated" data-aos="fade-up">
							<div class="row col-lg-10" data-aos="fade-up"
								data-aos-delay="100">
								<div class="box">
									<h3>결제내역</h3>
									<h4>
										<sup>￦</sup>199,000<span>per month</span>
									</h4>
									<ul>
										<li><i class="bx bx-check"></i> 홍보서비스 30일</li>
										<label>today : </label>
										<li ><i id="currentDate" class="bx bx-check"></i></li>
										<hr />
										<label>end day : </label>
										<li ><i id="endDate" class="bx bx-check"></i></li>
									</ul>
								</div>
							</div>
							<div class="center">
								<button type="button" id="paymentBtn" class="btn-get-started scrollto">결제하기</button>
								<button type="button" id="resetBtn"class="btn-get-started scrollto">결제취소</button>
							</div>
						</div>
					</section>
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
	<script src="/resources/include/payment/js/payMain.js"></script>
<!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src="/resources/include/payment/js/payment.js"></script>
	
	
 
  </body>
</html>