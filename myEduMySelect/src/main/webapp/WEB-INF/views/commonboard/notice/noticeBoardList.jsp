<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
.table {
	background-color: #48d1cc; /* 연한 teal 색상으로 배경색 지정 */
	width: 100%; /* 테이블이 부모 요소에 가득 차도록 너비 지정 */
	border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
	box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
}

.table td, .table th {
	border: 5px solid #48d1cc; /* 선의 두께와 파란색으로 테두리 지정 */
	padding: 8px; /* 셀 안의 여백 조정 */
	text-align: center; /* 셀 내용 가운데 정렬 */
	border-right: none; /* 세로선 제거 */
	border-left: none;
}

/* 테이블 헤더를 스타일링하려면 이를 추가하세요 */
.table thead th {
	background-color: #48d1cc; /* 파란색으로 헤더 배경색 지정 */
	color: white; /* 헤더 텍스트 색상 지정 */
}

.btn {
	height: 35px;
	padding: 5px 15px;
	background-color: #48d1cc;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 5px;
	font-size: 16px;
	font-weight: 600;
	margin-left: 5px;
	float: right;
}

.notice_p {
	padding-top: 500px;
}
</style>
<section id="hero" class="d-flex align-items-center">
	<div class="container">
		<div class="row">
			<div
				class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
				data-aos="fade-up" data-aos-delay="200">
				<h1>Notice</h1>
				<h2>교육은 여러분의 선택이지만, 공지는 필수입니다.</h2>
				<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
					data-aos-delay="200">
					<img src="/resources/include/assets/img/hero-img.png"
						class="img-fluid animated" alt="">
				</div>
			</div>
		</div>
	</div>
</section>

<main id="main">
	<form id="detailForm">
		<input type="hidden" id="commonNo" name="commonNo" />
	</form>
	<form id="noticeForm" name="noticeForm">
		<input type="hidden" name="pageNum" id="pagenum"
			value="${pageMaker.cvo.pageNum}"> <input type="hidden"
			name="amount" id="amount" value="${pageMaker.cvo.amount}">

		<section class="noticeBoard">
			<div class="container">
				<div class="mcBoardList">
					<div class="row g-2 align-items-center">
						<div class="col-auto">
							<label for="search" class="card-title">search</label>
						</div>
						<div class="col-auto">
							<select id="search" name="search"
								class="form-select form-select-sm">
								<option value="all">All</option>
								<option value="common_title">Title</option>
								<option value="common_content">Content</option>
							</select>
						</div>
						<div class="col-auto">
							<input type="text" name="keyword" id="keyword"
								placeholder="검색어를 입력해주세요" class="form-control form-control-sm" />
						</div>
						<div class="col-auto">
							<button type="button" id="searchData"
								class="btn btn-primary btn-sm">검색</button>
						</div>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">No</th>
								<th scope="col">Title</th>
								<th scope="col">AdminName</th>
								<th scope="col">RegisterDate</th>
								<th scope="col">ReadCount</th>
							</tr>
						</thead>
						<tbody id="list" class="table-group-divider">
							<c:choose>
								<c:when test="${not empty boardList}">
									<c:forEach var="notice" items="${boardList}"
										varStatus="statusNumber">
										<tr data-num="${notice.commonNo}">
											<th scope="row">${notice.commonNo}</th>
											<td class="goDetail text-center">${notice.commonTitle}</td>
											<td class="goDetail text-center">${notice.commonNickname}</td>
											<td class="goDetail text-center">${notice.commonRegisterDate}</td>
											<td class="goDetail text-center">${notice.commonReadcnt}</td>
										</tr>
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
				</div>
				<%-- ======================== 페이징 출력 시작 ========================--%>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a href="${pageMaker.startPage - 1}"
								class="page-link">Previous</a> <!-- <a href="${pageMaker.startPage - 10}" class="page-link">Previous</a> -->
							</li>
						</c:if>

						<!-- 바로가기 번호 출력 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
								<a href="${num}" class="page-link">${num}</a>
							</li>
						</c:forEach>
						<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
						<c:if test="${pageMaker.next}">
							<li class="page-item"><a href="${pageMaker.endPage + 1}"
								class="page-link">Next</a></li>
						</c:if>

					</ul>
				</nav>
			</div>
		</section>
		<!-- 매칭게시판 목록 끝 -->
	</form>
</main>
<!-- End #main -->

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	$(function() {
		/* 검색 후 검색 대상과 검색 단어 출력 */
		let word = "<c:out value='${noticeBoardVO.keyword}' />";
		let value = "";
		if (word != "") {
			$("#keyword").val("<c:out value='${noticeBoardVO.keyword}' />");
			$("#search").val("<c:out value='${noticeBoardVO.search}' />");

			if ($("#search").val() != 'common_content') {
				if ($("#search").val() == 'common_title')
					value = "#list tr td.goDetail";
				console.log($(value + ":contains('" + word + "')").html());
				$(value + ":contains('" + word + "')").each(
						function() {
							let regex = new RegExp(word, 'gi');
							$(this).html(
									$(this).html().replace(
											regex,
											"<span class='required'>" + word
													+ "</span>"));
						});
			}
		}
	});
</script>

<!-- Vendor JS Files -->
<script src="/resources/include/assets/vendor/aos/aos.js"></script>
<script
	src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
	src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script
	src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script
	src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
<script
	src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
<script
	src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->

<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
<script src="/resources/include/js/common.js"></script>
<script src="/resources/include/assets/js/noticeBoard.js"></script>

</body>

</html>