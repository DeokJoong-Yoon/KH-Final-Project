<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/admin/common/common.jspf"%>

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

		<div class="pagetitle">
			<h1>Dashboard</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-8">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">notice board</h5>
							<table class="table table-danger">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">Title</th>
										<th scope="col">AdminName</th>
										<th scope="col">RegisterDate</th>
										<th scope="col">ReadCount</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty noticeBoardList}">
											<c:forEach var="notice" items="${noticeBoardList}" varStatus="statusNumber">
												<c:if test="${statusNumber.index < 5}">
													<tr data-num="${statusNumber.index + 1}">
														<th scope="row">${notice.commonNo}</th>
														<td>${notice.commonTitle}</td>
														<td>${notice.commonNickname}</td>
														<td>${notice.commonRegisterDate}</td>
														<td>${notice.commonReadcnt}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5">조건에 맞는 공지가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">matching board</h5>
							<table class="table table-primary">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">Student</th>
										<th scope="col">RegisterDate</th>
										<th scope="col">Comment</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty matchingBoardList}">
											<c:forEach var="match" items="${matchingBoardList}" varStatus="statusNumber">
												<c:if test="${statusNumber.index < 5}">
													<tr data-num="${statusNumber.index + 1}">
														<th scope="row">${match.matchingNo}</th>
														<td>${match.personalId}</td>
														<td>${match.matchingRegisterDate}</td>
														<td>${match.commentCnt}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="4">조건에 맞는 공지가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">free board</h5>
							<table class="table table-warning ">
								<thead>
									<tr>
										<th scope="col">No</th>
										<th scope="col">Title</th>
										<th scope="col">Personal Id</th>
										<th scope="col">RegisterDate</th>
										<th scope="col">ReadCount</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty freeBoardList}">
											<c:forEach var="free" items="${freeBoardList}" varStatus="statusNumber">
												<c:if test="${statusNumber.index < 5}">
													<tr data-num="${statusNumber.index + 1}">
														<th scope="row">${free.commonNo}</th>
														<td>${free.commonTitle}</td>
														<td>${free.personalId}</td>
														<td>${free.commonRegisterDate}</td>
														<td>${free.commonReadcnt}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="5">조건에 맞는 공지가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- End Default Table Example -->
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<h4>recent subscription member</h4>
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">peronsal member</h5>
							<!-- Table with stripped rows -->
							<table class="table table-striped">
								<thead>
									<tr>
										<th scope="col">personalId</th>
										<th scope="col">Name</th>
										<th scope="col">Join Date</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${not empty personalAdminList}">
											<c:forEach var="personal" items="${personalAdminList}" varStatus="statusNumber">
												<c:if test="${statusNumber.index < 5}">
													<tr data-num="${statusNumber.index + 1}">
														<th scope="row">${personal.personalId}</th>
														<td>${personal.personalName}</th>
														<td>${personal.personalJoinDate}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3">조건에 맞는 공지가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- End Table with stripped rows -->
						</div>
						<div class="card-body">
							<h5 class="card-title">academy member</h5>
							<!-- Table with hoverable rows -->
							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">Academy Id</th>
										<th scope="col">Name</th>
										<th scope="col">Join Date</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
										<c:when test="${not empty academyAdminList}">
											<c:forEach var="academy" items="${academyAdminList}" varStatus="statusNumber">
												<c:if test="${statusNumber.index < 5}">
													<tr data-num="${statusNumber.index + 1}">
														<th scope="row">${academy.academyId}</th>
														<th>${academy.academyName}</th>
														<td>${academy.academyJoinDate}</td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3">조건에 맞는 공지가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
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
	<!-- Template Main JS File -->
	<script src="/resources/include/admin/admin/assets/js/main.js"></script>
	<!-- <script src="/resources/include/admin/js/adminBoard.js"></script> -->
</body>
</html>