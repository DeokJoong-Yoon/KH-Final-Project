<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%-- <%@ include file="/WEB-INF/views/admin/common/common.jspf"%> --%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
		<form name="f_updateForm" id="f_updateForm">
			<input type="hidden" name="commonNo" id="commonNo" value="${updateData.commonNo}" />
			<input type="hidden" name="commonFile" id="commonFile" value="${updateData.commonFile}" />

			<div class="pagetitle">
				<h1>Dashboard</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
						<li class="breadcrumb-item active">Notice Update</li>
					</ol>
				</nav>
			</div>
			<!-- End Page Title -->

			<section class="section">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title md-6 row">notice update</h5>

							<!-- Table with stripped rows -->
							<form id="f_updateForm">
								<table class="table table-striped">
									<tbody>
										<tr>
											<td>
												<div class="col-md-12 text-end">
													<button type="button" id="boardUpdateBtn" class="btn btn-primary btn-sm">글수정</button>
													<button type="button" id="boardListBtn" class="btn btn-primary btn-sm">목록</button>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="md-3 row">
													<label for="boardName" class="col-sm-2 col-form-label">No</label>
													<div class="col-sm-10 mt-2 mb-2">${updateData.commonNo}</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="md-3 row">
													<label for="boardName" class="col-sm-2 col-form-label">Name</label>
													<div class="col-sm-10 mt-2 mb-2">${updateData.commonNickname}</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="md-3 row">
													<label for="commonTitle" class="col-sm-2 col-form-label">Title</label>
													<div class="col-sm-10">
														<input type="text" id="commonTitle" name="commonTitle" class="form-control" value="${updateData.commonTitle}" />
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="md-3 row">
													<label for="commonContent" class="col-sm-2 col-form-label">Content</label>
													<textarea name="commonContent" id="commonContent" class="tinymce-editor form-control" rows="8">${updateData.commonContent}</textarea>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="md-3 row">
													<label for="commonContent" class="col-sm-2 col-form-label">Date</label>
													<div class="text-start col-sm-10 mt-2 mb-2">
														<c:choose>
															<c:when test="${empty updateData.commonEdit}">
														${updateData.commonRegisterDate}
													</c:when>
															<c:otherwise>
														${updateData.commonEdit}
													</c:otherwise>
														</c:choose>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="md-3 row">
													<label for="file" class="col-sm-2 col-form-label">첨부파일</label>
													<div class="col-sm-10">
														<input type="file" id="file" name="file" class="form-control" />
													</div>
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
		</form>
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
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
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/admin/js/adminNoticeBoardUpdateForm.js"></script>

</body>
</html>