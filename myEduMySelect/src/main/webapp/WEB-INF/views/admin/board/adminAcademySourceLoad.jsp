<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<section>
	<jsp:include page="/WEB-INF/views/admin/common/section.jsp" />
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
										<th scope="col">synchronize</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th id="curCount"></th>
										<th id="progressRate"></th>
										<th id="totalCount"></th>
										<th id="synchronize">
										<button class="btn btn-primary" type="button"
												id="synchronizeBtn" name="synchronizeBtn">
												synchronize</button>
										</th>
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
										<th colspan="1">
											
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
	<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
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
			document.getElementById('synchronizeBtn').addEventListener('click', function() {
				 window.location.reload();
			});
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
			
			document.getElementById('completeBtn').style.display = 'none';
			// loadingBtn 표시
			document.getElementById('loadingBtn').style.display = 'inline-block';
			
/* 			var xhr2 = new XMLHttpRequest();
			xhr2.open('GET', '/data/getAcademySourceCount',true);
			xhr2.onreadystatechange = function() {};
			xhr2.send(); */
			fetchDataPeriodically();
		});
		
		function fetchDataPeriodically() {
		    var intervalId = setInterval(function() {
			        // AJAX를 사용하여 특정 URL 호출
			        var xhr3 = new XMLHttpRequest();
			        xhr3.open('GET', '/data/insertAcademySource', true);
			        xhr3.onreadystatechange = function() {
			            /* if (xhr3.readyState === 4 && xhr3.status === 200) {
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
			            } */
			        };
			        xhr3.send();
			    }); // 3초마다 호출 (단위: 밀리초)
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