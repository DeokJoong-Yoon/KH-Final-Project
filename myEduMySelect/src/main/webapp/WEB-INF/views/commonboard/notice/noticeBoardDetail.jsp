<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
.table {
	background-color: #48d1cc; /* 연한 teal 색상으로 배경색 지정 */
	width: 100%; /* 테이블이 부모 요소에 가득 차도록 너비 지정 */
	border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}

.table td, .table th {
	border: 5px solid #48d1cc; /* 선의 두께와 파란색으로 테두리 지정 */
	padding: 8px; /* 셀 안의 여백 조정 */
	text-align: center; /* 셀 내용 가운데 정렬 */
	border-right: none; /* 세로선 제거 */
	border-left: none;
}

/* 테이블 헤더를 스타일링하려면 이를 추가하세요 */
.table thead th {
	background-color: #48d1cc; /* 파란색으로 헤더 배경색 지정 */
	color: white; /* 헤더 텍스트 색상 지정 */
}

.btn {
	height: 35px;
	padding: 5px 15px;
	background-color: #48d1cc;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
	font-weight: 600;
	margin-left: 5px;
	float: right;
}
</style>
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>Notice</h1>
					<h2>교육은 여러분의 선택이지만, 공지는 필수입니다.</h2>
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">
		<form name="f_data" id="f_data">
			<input type="hidden" name="commonNo" id="commonNo"
				value="${detail.commonNo}" /> <input type="hidden"
				name="commonFile" id="commonFile" value="${detail.commonFile}" />
		</form>
		<!-- ======= 매칭게시판 목록 ======= -->
		<section class="section">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<!-- Table with stripped rows -->
						<form id="f_writeForm">
							<table class="table table-striped">
								<tbody>
									<tr>
										<td>
											<div class="md-3 row">
												<label class="col-sm-10 mt-2 mb-2"><h3>notice</h3></label>
												<div class="col-sm-2 mt-2 mb-2">
													<button type="button" id="boardListBtn"
														class="btn btn-primary btn-sm">목록</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="commonNo" class="col-sm-2 col-form-label">No</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.commonNo}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="boardName" class="col-sm-2 col-form-label">Name</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.commonNickname}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="commonTitle" class="col-sm-2 col-form-label">Title</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.commonTitle}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="commonContent" class="col-sm-2 col-form-label">Content</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.commonContent}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="commonEdit" class="col-sm-2 col-form-label">Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">
													<c:choose>
														<c:when test="${empty detail.commonEdit}">
														${detail.commonRegisterDate}
													</c:when>
														<c:otherwise>
														${detail.commonEdit}
													</c:otherwise>
													</c:choose>
												</div>
											</div>
										</td>
									</tr>
									<c:if test="${not empty detail.commonFile}">
										<tr>
											<td>
												<div class="md-3 row">
													<label for="commonContent" class="col-sm-2 col-form-label">image</label>
													<div class="text-start col-sm-10 mt-2 mb-2">
														<img src="/uploadStorage/board/${detail.commonFile}"
															class="rounded" style="max-width: 100%; height: auto;" />
													</div>
												</div>
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->
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
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/assets/js/noticeBoardDetail.js"></script>
	
</body>

</html>