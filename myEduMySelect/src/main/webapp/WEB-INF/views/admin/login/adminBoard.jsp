<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
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

		<div class="d-flex align-items-center justify-content-between">
			<a href="/admin/login" class="logo d-flex align-items-center"> <img src="/resources/include/admin/image/admin.png" alt=""> <span class="d-none d-lg-block">Admin - ${adminLogin.adminName}</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST" action="/admin/search">
				<input type="text" name="query" placeholder="Search" title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a class="nav-link nav-icon search-bar-toggle " href="#"> <i class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i> <span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown"> <i class="bi bi-chat-left-text"></i> <span class="badge bg-success badge-number">3</span>
				</a> <!-- End Messages Icon -->

					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img src="/resources/include/admin/admin/assets/img/messages-1.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Maria Hudson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img src="/resources/include/admin/admin/assets/img/messages-2.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Anna Nelson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img src="/resources/include/admin/admin/assets/img/messages-3.jpg" alt="" class="rounded-circle">
								<div>
									<h4>David Muldon</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a></li>

					</ul> <!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->
				<li class="nav-item dropdown pe-3"><a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown"> <img src="/resources/include/admin/image/admin.png" alt="Profile" class="rounded-circle"> <span class="d-none d-md-block dropdown-toggle ps-2">${adminLogin.adminName}</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${adminLogin.adminName}</h6> <span>Administrator</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="myPage dropdown-item d-flex align-items-center" href="/admin/myPage"> <!-- <form id="myPageForm" style="display: none;"></form> --> <i class="bi bi-person"></i> <span>My Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center" href="./users-profile.html"> <i class="bi bi-gear"></i> <span>Account Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center" href="./pages-faq.html"> <i class="bi bi-question-circle"></i> <span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center" href="/admin/logout"> <i class="bi bi-box-arrow-right"></i> <span>Sign Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->


			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<section>
		<div class="container">
			<aside id="sidebar" class="sidebar">

				<ul class="sidebar-nav" id="sidebar-nav">

					<li class="nav-item"><a class="nav-link " href="/admin/login"> <i class="bi bi-grid"></i> <span>Dashboard main</span>
					</a></li>
					<!-- End Dashboard Nav -->
					<hr>
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/notice"> <i class="bi bi-layout-text-window-reverse"></i><span>notice board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/free"> <i class="bi bi-layout-text-window-reverse"></i><span>free board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/matching"> <i class="bi bi-layout-text-window-reverse"></i><span>matching board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/advertise"> <i class="bi bi-layout-text-window-reverse"></i><span>advertisement board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<hr>
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/payment"> <i class="bi bi-gem"></i><span>payment board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Icons Nav -->
					<hr>
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/personal"> <i class="bi bi-person"></i> <span>personal member</span>
					</a></li>
					<!-- End Profile Page Nav -->

					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/academy"> <i class="bi bi-person"></i> <span>academy member</span>
					</a></li>
					<!-- End Profile Page Nav -->

					<hr>
					<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/academySourceS"> <i class="bi bi-card-list"></i> <span>all academy member</span>
					</a></li>
					<!-- End Register Page Nav -->

					<hr>
					<li class="nav-item"><a class="nav-link collapsed" href="pages-login.html"> <i class="bi bi-box-arrow-in-right"></i> <span> Admin Account Create</span>
					</a></li>
					<!-- End Login Page Nav -->
				</ul>
			</aside>
			<!-- End Sidebar-->
		</div>
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
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
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