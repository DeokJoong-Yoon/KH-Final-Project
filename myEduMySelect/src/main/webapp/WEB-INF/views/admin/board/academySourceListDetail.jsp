<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/admin/common/common.jspf"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/include/admin/image/admin.png" rel="icon">
<link href="/resources/include/admin/image/admin.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/include/admin/admin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/include/admin/admin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/admin/admin/assets/css/style.css" rel="stylesheet">

<style>
.table {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}
</style>

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<section>
	<jsp:include page="/WEB-INF/views/admin/common/section.jsp" />
	</section>

	<main id="main" class="main">
		<form name="f_data" id="f_data">
			<input type="hidden" name="academyNumber" id="academyNumber" value="${detail.academyNumber}" />
		</form>
		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
					<li class="breadcrumb-item active">Academy Source Detail</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title md-6 row">Academy Source detail</h5>

						<!-- Table with stripped rows -->
						<form id="f_writeForm">
							<table class="table table-striped">
								<tbody>
									<tr>
										<td>
											<div class="col-md-12 text-end">
												<button type="button" id="academySourceListBtn" class="btn btn-primary btn-sm">목록</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyNumber" class="col-sm-2 col-form-label">No</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.academyNumber}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyName" class="col-sm-2 col-form-label">Name</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.academyName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyGuAddress" class="col-sm-2 col-form-label">Gu</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.academyGuAddress}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyRoadAddress" class="col-sm-2 col-form-label">Road</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyRoadAddress}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyDongAddress" class="col-sm-2 col-form-label">Dong</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyDongAddress}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyFieldName" class="col-sm-2 col-form-label">Field</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyFieldName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyCurriculumSeriesName" class="col-sm-2 col-form-label">Curriculum Series</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyCurriculumSeriesName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyCurriculumListName" class="col-sm-2 col-form-label">Curriculum List</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyCurriculumListName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyCurriculumName" class="col-sm-2 col-form-label">Curriculum</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyCurriculumName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyTotalCapacity" class="col-sm-2 col-form-label">Total Capacity</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyTotalCapacity}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyTotalCapacityPerDay" class="col-sm-2 col-form-label">Total Capacity (PerDay)</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyTotalCapacityPerDay}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyTuitionPerPerson" class="col-sm-2 col-form-label">Tuition Per Person</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyTuitionPerPerson}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyTuitionOpenStatus" class="col-sm-2 col-form-label">Tuition Open Status</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyTuitionOpenStatus}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyDormitoryAcademyStatus" class="col-sm-2 col-form-label">Dormitory Status</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyDormitoryAcademyStatus}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyRoadPostalNumber" class="col-sm-2 col-form-label">Road Postal Number</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyRoadPostalNumber}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyRegisterStatusName" class="col-sm-2 col-form-label">Register Status</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyRegisterStatusName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyRegisterDate" class="col-sm-2 col-form-label">Register Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyRegisterDate}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyClosedStartDate" class="col-sm-2 col-form-label">Closed Start Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyClosedStartDate}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyClosedEndDate" class="col-sm-2 col-form-label">Closed End Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyClosedEndDate}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyOpenDate" class="col-sm-2 col-form-label">Open Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyOpenDate}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyLoadingDateTime" class="col-sm-2 col-form-label">Loading Date Time</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyLoadingDateTime}</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/resources/include/admin/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/chart.js/chart.umd.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/echarts/echarts.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/quill/quill.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/php-email-form/validate.js"></script>
	<script src="http://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/admin/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<!-- Template Main JS File -->
	<!-- <script src="/resources/include/admin/admin/assets/js/main.js"></script> -->
	<script src="/resources/include/admin/js/academySourceListDetail.js"></script>

</body>
</html>