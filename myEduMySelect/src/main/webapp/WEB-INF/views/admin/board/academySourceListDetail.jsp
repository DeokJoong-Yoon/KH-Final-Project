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
			<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/advertisement"> <i class="bi bi-layout-text-window-reverse"></i><span>advertisement board</span><i class="ms-auto"></i>
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
			<li class="nav-item"><a class="nav-link collapsed" href="/adminBoard/academySource"> <i class="bi bi-card-list"></i> <span>all academy source</span>
			</a></li>
			<!-- End Register Page Nav -->

			<hr>
			<li class="nav-item"><a class="nav-link collapsed" href="/admin/accmountCreate"> <i class="bi bi-box-arrow-in-right"></i> <span> Admin Account Create</span>
			</a></li>
			<!-- End Login Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->

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
	<script src="/resources/include/admin/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<!-- Template Main JS File -->
	<!-- <script src="/resources/include/admin/admin/assets/js/main.js"></script> -->
	<script src="/resources/include/admin/js/academySourceListDetail.js"></script>

</body>
</html>