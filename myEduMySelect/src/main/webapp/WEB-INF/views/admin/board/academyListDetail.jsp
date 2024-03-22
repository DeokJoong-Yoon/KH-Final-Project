<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
.table {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}
</style>

<%@ include file="/WEB-INF/views/common/common.jspf"%>

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
	<script src="/resources/include/admin/js/academyListDetail.js"></script>

</body>
</html>