<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/resources/include/admin/image/admin.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="/resources/include/admin/admin/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/include/admin/admin/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/resources/include/admin/admin/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/include/admin/admin/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="/resources/include/admin/admin/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="/resources/include/admin/admin/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="/resources/include/admin/admin/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/admin/admin/assets/css/style.css"
	rel="stylesheet">

<style>
.table {
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}

#loadingBtn {
	display: none; /* 처음에는 숨겨진 상태로 설정 */
}
</style>

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="/admin/login" class="logo d-flex align-items-center"> <img
				src="/resources/include/admin/image/admin.png" alt=""> <span
				class="d-none d-lg-block">Admin - ${adminLogin.adminName}</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="/admin/search">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a> <!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="/resources/include/admin/admin/assets/img/messages-1.jpg"
								alt="" class="rounded-circle">
								<div>
									<h4>Maria Hudson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="/resources/include/admin/admin/assets/img/messages-2.jpg"
								alt="" class="rounded-circle">
								<div>
									<h4>Anna Nelson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="/resources/include/admin/admin/assets/img/messages-3.jpg"
								alt="" class="rounded-circle">
								<div>
									<h4>David Muldon</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a></li>

					</ul> <!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->
				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="/resources/include/admin/image/admin.png" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">${adminLogin.adminName}</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>${adminLogin.adminName}</h6> <span>Administrator</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="myPage dropdown-item d-flex align-items-center"
							href="/admin/myPage"> <!-- <form id="myPageForm" style="display: none;"></form> -->
								<i class="bi bi-person"></i> <span>My Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="./users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="./pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="/admin/logout"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
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

					<li class="nav-item"><a class="nav-link " href="/admin/login">
							<i class="bi bi-grid"></i> <span>Dashboard main</span>
					</a></li>
					<!-- End Dashboard Nav -->
					<hr>
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/notice"> <i
							class="bi bi-layout-text-window-reverse"></i><span>notice
								board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/free"> <i
							class="bi bi-layout-text-window-reverse"></i><span>free
								board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/matching"> <i
							class="bi bi-layout-text-window-reverse"></i><span>matching
								board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/advertise"> <i
							class="bi bi-layout-text-window-reverse"></i><span>advertisement
								board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Tables Nav -->
					<hr>
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/payment"> <i class="bi bi-gem"></i><span>payment
								board</span><i class="ms-auto"></i>
					</a></li>
					<!-- End Icons Nav -->
					<hr>
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/personal"> <i class="bi bi-person"></i> <span>personal
								member</span>
					</a></li>
					<!-- End Profile Page Nav -->

					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/academy"> <i class="bi bi-person"></i> <span>academy
								member</span>
					</a></li>
					<!-- End Profile Page Nav -->

					<hr>
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/academySource"> <i class="bi bi-card-list"></i>
							<span>all academy member</span>
					</a></li>
					<!-- End Register Page Nav -->

					<hr>
					<li class="nav-item"><a class="nav-link collapsed"
						href="/adminBoard/academySourceLoad"> <i
							class="bi bi-menu-button-wide"></i> <span>academy source
								load</span>
					</a></li>

					<hr>
					<li class="nav-item"><a class="nav-link collapsed"
						href="/admin/accountCreate"> <i
							class="bi bi-box-arrow-in-right"></i> <span>admin account
								create</span>
					</a></li>
					<!-- End Login Page Nav -->
				</ul>
			</aside>
			<!-- End Sidebar-->
		</div>
	</section>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Academy Source Load</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
					<li class="breadcrumb-item active">Academy Source Load</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Load board</h5>
							<table class="table table-primary">
								<thead>
									<tr>
										<th scope="col">current count</th>
										<th scope="col">progress rate</th>
										<th scope="col">total count</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th id="curCount"></th>
										<th id="progressRate"></th>
										<th id="totalCount"></th>
									</tr>
									<tr>
										<th colspan="1">
											<button class="btn btn-primary" type="button"
												id="startLoadBtn" name="startLoadBtn">academy
												source Load start</button>
										</th>
										<th colspan="1">
											<button class="btn btn-primary" type="button" id="loadingBtn"
												name="loadingBtn" disabled>
												<span class="spinner-grow spinner-grow-sm" role="status"
													aria-hidden="true"></span> Loading...
											</button>
										</th>
										<th colspan="1">
											<button class="btn btn-primary" type="button"
												id="completeBtn" name="completeBtn" disabled>
												Complete</button>
										</th>
									</tr>
								</tbody>
							</table>
							<!-- End Default Table Example -->
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
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
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

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<script>
		let academySourceTotal = 0;
		let academySourceCurr = 0;
		let progressRage = 0.0;
		window.onload = function() {
			fetchDataAndUpdateButtons(academySourceTotal, academySourceCurr);

		};

		// 페이지가 로드될 때 실행할 코드
		function fetchDataAndUpdateButtons(academySourceTotal, academySourceCurr) {
			var xhr1 = new XMLHttpRequest();
			xhr1.open('GET', '/data/getAcademySourceCount', true);
			xhr1.onreadystatechange = function() {
				if (xhr1.readyState === 4 && xhr1.status === 200) {
					var responseArray = JSON.parse(xhr1.responseText);
					academySourceTotal = responseArray[0];
					academySourceCurr = responseArray[1];
					updateValues(academySourceCurr, academySourceTotal);
					if (academySourceTotal == academySourceCurr) {
						document.getElementById('startLoadBtn').style.display = 'inline-block';
						document.getElementById('completeBtn').style.display = 'inline-block';
					} else {
						document.getElementById('startLoadBtn').style.display = 'inline-block';
						document.getElementById('completeBtn').style.display = 'none';
					}
				};
			};
			xhr1.send();
		}
		
		function updateValues(academySourceCurr, academySourceTotal) {
		    document.getElementById('curCount').textContent = academySourceCurr;
		    document.getElementById('totalCount').textContent = academySourceTotal;
		    var progressRate = Math.round((academySourceCurr / academySourceTotal) * 100);
		    document.getElementById('progressRate').textContent = progressRate + '%';
		}

		// startLoadBtn 클릭 이벤트 처리
		document.getElementById('startLoadBtn').addEventListener('click', function() {
			// startLoadBtn 숨기기
			document.getElementById('startLoadBtn').style.display = 'none';
			document.getElementById('completeBtn').style.display = 'none';
			// loadingBtn 표시
			document.getElementById('loadingBtn').style.display = 'inline-block';
			
			var xhr2 = new XMLHttpRequest();
			xhr2.open('GET', '/data/getAcademySourceCount',true);
			xhr2.onreadystatechange = function() {};
			xhr2.send();
			fetchDataPeriodically();
		});
		
		function fetchDataPeriodically() {
		    var intervalId = setInterval(function() {
			        // AJAX를 사용하여 특정 URL 호출
			        var xhr3 = new XMLHttpRequest();
			        xhr3.open('GET', '/data/insertAcademySource', true);
			        xhr3.onreadystatechange = function() {
			            if (xhr3.readyState === 4 && xhr3.status === 200) {
			            	var responseArray = JSON.parse(xhr3.responseText);
							academySourceTotal = responseArray[0];
							academySourceCurr = responseArray[1];
							updateValues(academySourceCurr, academySourceTotal);
							
			                // academySourceCurr, academySourceTotal 값이 같은지 확인
			                if (academySourceCurr === academySourceTotal) {
								document.getElementById('startLoadBtn').style.display = 'inline-block';
								document.getElementById('completeBtn').style.display = 'inline-block';
								document.getElementById('loadingBtn').style.display = 'none';
			                    clearInterval(intervalId); // 인터벌 종료
			                }
			            }
			        };
			        xhr3.send();
			    }, 3000); // 3초마다 호출 (단위: 밀리초)
			}

	</script>

	<!-- Vendor JS Files -->
	<script
		src="/resources/include/admin/admin/assets/vendor/apexcharts/apexcharts.min.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/chart.js/chart.umd.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/echarts/echarts.min.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/quill/quill.min.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/simple-datatables/simple-datatables.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/tinymce/tinymce.min.js"></script>
	<script
		src="/resources/include/admin/admin/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="http://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
	<!-- Template Main JS File -->
	<script src="/resources/include/admin/admin/assets/js/main.js"></script>
	<script src="/resources/include/admin/js/adminAcademySourceLoad.js"></script>
</body>
</html>