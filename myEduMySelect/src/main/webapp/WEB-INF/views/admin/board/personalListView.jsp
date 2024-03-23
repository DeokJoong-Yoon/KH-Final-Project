<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/admin/common/common.jspf"%><!DOCTYPE html>
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
		<form id="detailForm">
			<input type="hidden" id="personalId" name="personalId" />
		</form>
		<form id="personalForm" name="personalForm">
			<input type="hidden" name="pageNum" id="pagenum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

			<div class="pagetitle">
				<h1>Personal List</h1>
				<nav>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/admin/login">Home</a></li>
						<li class="breadcrumb-item active">personal list</li>
					</ol>
				</nav>
			</div>
			<!-- End Page Title -->

			<section class="section">

				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="row g-2 align-items-center">
									<div class="col-auto">
										<label for="search" class="card-title">search</label>
									</div>
									<div class="col-auto">
										<select id="search" name="search" class="form-select form-select-sm">
											<option value="all">All</option>
											<option value="personal_id">Personal Id</option>
											<option value="personal_name">Personal Name</option>
										</select>
									</div>
									<div class="col-auto">
										<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력해주세요" class="form-control form-control-sm" />
									</div>
									<div class="col-auto">
										<button type="button" id="searchData" class="btn btn-primary btn-sm">검색</button>
									</div>
								</div>
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">personalId</th>
											<th scope="col">personalName</th>
											<th scope="col">personalPhone</th>
											<th scope="col">personalEmail</th>
											<th scope="col">personalJoinDate</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${not empty personalAdminList}">
												<c:forEach var="personal" items="${personalAdminList}" varStatus="statusNumber">
														<tr data-num="${personal.personalId}">
															<th scope="row">${personal.personalId}</th>
															<th class="goDetail text-start">${personal.personalName}</th>
															<td class="goDetail text-start">${personal.personalPhone}</td>
															<td class="goDetail text-start">${personal.personalEmail}</td>
															<td class="goDetail text-start">${personal.personalJoinDate}</td>
														</tr>
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
							</div>
							<%-- ======================== 페이징 출력 시작 ========================--%>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
									<c:if test="${pageMaker.prev}">
										<li class="page-item"><a href="${pageMaker.startPage - 1}" class="page-link">Previous</a> <!-- <a href="${pageMaker.startPage - 10}" class="page-link">Previous</a> --></li>
									</c:if>

									<!-- 바로가기 번호 출력 -->
									<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
										<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}"><a href="${num}" class="page-link">${num}</a></li>
									</c:forEach>
									<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
									<c:if test="${pageMaker.next}">
										<li class="page-item"><a href="${pageMaker.endPage + 1}" class="page-link">Next</a></li>
									</c:if>

								</ul>

							</nav>

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
	<script>
      	$(function() {
      		/* 검색 후 검색 대상과 검색 단어 출력 */
      		let word="<c:out value='${personalAdminVO.keyword}' />";
      		let value ="";
      		if (word != "") {
      			$("#keyword").val("<c:out value='${personalAdminVO.keyword}' />");
      			$("#search").val("<c:out value='${personalAdminVO.search}' />");
      			
      			if ($("#search").val() != 'personal_id') {
      				if($("#search").val() == 'personal_name') value = "#list tr td.goDetail";
      				console.log($(value + ":contains('" + word + "')").html());
      				$(value + ":contains('" + word +"')").each(function() {
      					let regex = new RegExp(word, 'gi');
      					$(this).html($(this).html().replace(regex, "<span class='required'>" + word + "</span>"));
      				});
      			}
      		}
      	});
      </script>
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
	<!-- <script src="/resources/include/admin/admin/assets/js/main.js"></script> -->
	<script src="/resources/include/admin/js/personalListView.js"></script>
</body>
</html>