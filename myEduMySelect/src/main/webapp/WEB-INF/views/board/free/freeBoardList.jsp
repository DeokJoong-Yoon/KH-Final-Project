<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	



<link href="/resources/include/board/free/css/free.css" rel="stylesheet">
<script src="/resources/include/js/common.js"></script>
<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
</head>

<body>
	<!-- End Header -->

	<!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center justify-content-center">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center banner">
					자유 게시판<br />
					<div class="descBox">
						자유롭게 글을 작성할 수 있는 <b>자유게시판</b>입니다.<br> 질문, 후기, 정보 등 도움이 될 만한
						다양한 글을 남겨주세요!
					</div>
				</div>
			</div>
		</div>
	</section>  <!-- ======= 설명 영역 끝 ======= -->
	

	<!-- ======= 게시판 영역 ======= -->
	<main id="main">
		<form id="detailForm">
			<input type="hidden" id="commonNo" name="commonNo" />
		</form>

		<section class="board">
			<form id="freeForm" name="freeForm">
				<input type="hidden" name="pageNum" id="pagenum"
					value="${pageMaker.cvo.pageNum}"> <input type="hidden"
					name="amount" id="amount" value="${pageMaker.cvo.amount}">
				<div class="container">

					<!-- ======= 검색 영역 ======= -->
					<div id="freeSearch" >
						<div class="row g-2 alian-items-center">
							<div class="col-auto">
								<select id="search" name="search"
									class="form-select form-select-sm">
									<option value="all">전체 목록 조회</option>
									<option value="common_title">글제목</option>
									<option value="common_content">글내용</option>
									<option value="personal_id">작성자</option>
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

					</div>
					<!-- 검색 영역 끝 -->


					<!-- ========= 게시글 목록 영역 ======== -->
					<div class="list">
						<table>
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성시간</th>
									<th>조회수</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="list">
								<c:choose>
									<c:when test="${not empty freeList}">
										<c:forEach var="free" items="${freeList}" varStatus="status">
											<tr data-num="${free.commonNo}">
												<td>${free.commonNo}</td>
												<td class="goDetail">${free.commonTitle}<c:if
														test="${free.freeReplyCnt > 0}">
														<span class="freeReplyCnt">[${free.freeReplyCnt}]</span>
													</c:if>
												</td>
												<td class="goDetail">${free.personalId}</td>
												<td class="text-start">${free.commonRegisterDate}</td>
												<td class="text-center">${free.commonReadcnt}</td>
												<td><c:if test="${not empty free.commonFile}">
														<img src="/uploadStorage/free/${free.commonFile}"
															class="rounded w-50 h-50" />
													</c:if> <c:if test="${empty free.commonFile}">
														<img
															src="/resources/include/board/images/no-image-icon.png"
															class="rounded w-50 h-50" />
													</c:if>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">등록된 게시물이 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<%------------------------ 페이징 출력 --------------------------%>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a href="${pageMaker.startPage - 1}"
									class="page-link">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li
									class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
									<a href="${num}" class="page-link">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="page-item"><a href="${pageMaker.endPage + 1 }"
									class="page-link">다음</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</form>
			<div class="text-end">
				<button type="submit" id="freeWriterBtn" class="btn btn-primary">글쓰기</button>
			</div>
		</section>



	</main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />				
	<script>
		$(function() {
			let alertMsg = "${alertMsg}";
			if (alertMsg != "") {
				alert(alertMsg);
			}	
			/* 검색 후 검색 대상과 검색 단어 출력 */
			let word = "<c:out value='${freeVO.keyword}' />";
			console.log(word);
			let value = "";
			if (word != "") {
				$("#keyword").val("<c:out value='${freeVO.keyword}' />");
				$("#search").val("<c:out value='${freeVO.search}' />");

				if ($("#search").val() != 'common_content') {
					//:contains() 는 특정 텍스트를 포함한 요소 반환
					if ($("#search").val() == 'common_title')
						value = "#list tr td.goDetail";
					if ($("#search").val() == 'personal_id')
						value = "#list tr td.goDetail";
					console.log($(value + ":contains('" + word + "')").html());
					// $("#list tr td.goDetail:contains('노력')").html();
					// => <span class='required'>노력</span>에 대한 명언
					$(value + ":contains('" + word + "')").each(
							function() {
								let regex = new RegExp(word, 'gi');
								$(this).html(
										$(this).html().replace(
												regex,
												"<span class='required'>"
														+ word + "</span>"));
							});
				}
			}
		});

		/* $(document).ready(function() {
		    // 각 게시물의 댓글 수를 가져와서 표시하는 함수
		    function updatefreeReplyCnt(commonNo) {
		        $.ajax({
		            type: 'POST',
		            url: '/freeReplyCnt',
		            data: { commonNo: commonNo },
		            success: function(data) {
		                // 성공적으로 댓글 수를 가져온 경우, 해당 게시물의 댓글 수를 업데이트
		                $('#freeReplyCnt' + commonNo).html('<b>[' + data + ']</b>');
		            },
		            error: function(xhr, status, error) {
		                console.error('댓글 갯수를 가져오는데 실패하였습니다: ' + error);
		            }
		        });
		    }
		
		    // 페이지 로드 시 각 게시물 별로 댓글 수를 업데이트
		    $('[id^=freeReplyCnt]').each(function() {
		        let commonNo = $(this).attr('id').replace('freeReplyCnt', '');
		        updatefreeReplyCnt(commonNo);
		    });
		}); */
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


	<script src="/resources/include/board/common/main.js"></script>

	<script src="/resources/include/board/free/js/freeList.js"></script>
</body>

</html>