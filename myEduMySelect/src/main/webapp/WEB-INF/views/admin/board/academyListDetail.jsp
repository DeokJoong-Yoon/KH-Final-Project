<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/common/common.jspf" %>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin</title>
<meta content="" name="description">
<meta content="" name="keywords">



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
<!-- Favicons -->
<link href="/resources/include/admin/image/admin.png" rel="icon">
<link href="/resources/include/admin/image/admin.png" rel="apple-touch-icon">
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
			<input type="hidden" name="academyId" id="academyId" value="${detail.academyId}" />
		</form>
		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
					<li class="breadcrumb-item active">Personal Detail</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title md-6 row">personal detail</h5>

						<!-- Table with stripped rows -->
						<form id="f_writeForm">
							<table class="table table-striped">
								<tbody>
									<tr>
										<td>
											<div class="col-md-12 text-end">
												<button type="button" id="academyDeleteBtn" class="btn btn-primary btn-sm">삭제</button>
												<button type="button" id="academyListBtn" class="btn btn-primary btn-sm">목록</button>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyId" class="col-sm-2 col-form-label">ID</label>
												<div class="col-sm-10 mt-2 mb-2">${detail.academyId}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyNumber" class="col-sm-2 col-form-label">Number</label>
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
												<label for="academyJoinDate" class="col-sm-2 col-form-label">Join Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyJoinDate}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyGuAddress" class="col-sm-2 col-form-label">Gu</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyGuAddress}</div>
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
												<label for="academyRoadAddress" class="col-sm-2 col-form-label">Road Address</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyRoadAddress}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyPhone" class="col-sm-2 col-form-label">Tel</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyPhone}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyManagerName" class="col-sm-2 col-form-label">Manager</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyManagerName}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyManagerName" class="col-sm-2 col-form-label">Manager Phone</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyManagerPhone}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyPasswdChangeDate" class="col-sm-2 col-form-label">Password Change Date</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyPasswdChangeDate}</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="md-3 row">
												<label for="academyLoginFailCount" class="col-sm-2 col-form-label">Login Fail Count</label>
												<div class="text-start col-sm-10 mt-2 mb-2">${detail.academyLoginFailCount}</div>
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
	<script src="/resources/include/admin/js/academyListDetail.js"></script>

</body>
</html>