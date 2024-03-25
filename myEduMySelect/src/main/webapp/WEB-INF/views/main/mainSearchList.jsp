<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">

<style>
	.table {
		background-color: #48d1cc; /* 연한 teal 색상으로 배경색 지정 */
		width: 100%; /* 테이블이 부모 요소에 가득 차도록 너비 지정 */
		border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
		box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.2);
	}

	.table td,
	.table th {
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
</style>

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>전체 조회 / 빠른검색</h1>
					<h2>여러분의 교육은 여러분이 선택합니다.</h2>
					<form id="mainSearchForm">
					<div class="d-flex justify-content-center justify-content-lg-start">
						<select id="academyGuAddress" name="academyGuAddress" class="form-control form-control-lg">
	        				<option value="">-- 구 선택 --</option>
	        				<option value="강남구">강남구</option>
	        				<option value="강동구">강동구</option>
	       					<option value="강북구">강북구</option>
	      					<option value="강서구">강서구</option>
	      					<option value="관악구">관악구</option>
	      					<option value="광진구">광진구</option>
	        				<option value="구로구">구로구</option>
	        				<option value="금천구">금천구</option>
	        				<option value="노원구">노원구</option>
	        				<option value="도봉구">도봉구</option>
	        				<option value="동대문구">동대문구</option>
	        				<option value="동작구">동작구</option>
	        				<option value="마포구">마포구</option>
	        				<option value="서대문구">서대문구</option>
	        				<option value="서초구">서초구</option>
	        				<option value="성동구">성동구</option>
	        				<option value="성북구">성북구</option>
	        				<option value="송파구">송파구</option>
	        				<option value="양천구">양천구</option>
	        				<option value="영등포구">영등포구</option>
	        				<option value="용산구">용산구</option>
	        				<option value="은평구">은평구</option>
	        				<option value="종로구">종로구</option>
	        				<option value="중구">중구</option>
	        				<option value="중랑구">중랑구</option>
	        			</select>
						<select id="academyDongAddress" name="academyDongAddress" class="form-control form-control-lg">
							<option value="">-- 동 선택 --</option>
	        			</select>
	        			<input id="academyCurriculumName" name="academyCurriculumName" type="text" class="form-control form-control-lg" placeholder="과목을 입력하세요." maxlength=20/>
	        			</form>
					</div>
					<button type="button" id="mainSearchBtn" name="mainSearchBtn" class="btn-get-started scrollto">검색</button>
				</div>
				<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
					data-aos-delay="200">
					<img src="/resources/include/assets/img/hero-img.png"
						class="img-fluid animated" alt="">
				</div>
				
			</div>
		</div>
	</section>
	<!-- End Hero -->

  <main id="main">
  <%-- <input type="hidden" name="pageNum" id="pagenum" value="${pageMaker.cvo.pageNum}">
  <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}"> --%>
    
    <!-- ======= 매칭게시판 목록 ======= -->
    <section class="mcBoard">
     
      <div class="container">
			<div class="mcBoardList">
			<table class="table">
				<thead>
					<tr>
						<th scope="col"><h3>No</h3></th>
						<th scope="col"><h3>지역구</h3></th>
						<th scope="col"><h3>학원명</h3></th>
						<th scope="col"><h3>도로명주소</h3></th>
						<th scope="col"><h3>과목</h3></th>
						<th scope="col"><h3>등록일</h3></th>
					</tr>
				</thead>
				<tbody id="mainBoardList" class="table-group-divider">
					<c:choose>
						<c:when test="${not empty mainSearchList}">
							<c:forEach var="mainBoard" items="${mainSearchList }" varStatus="statusNumber">
								<tr data-num="${statusNumber.index + 1}">
									<th scope="row">${statusNumber.index + 1}</th>
									<td>${mainBoard.academyGuAddress}</td>
									<td>${mainBoard.academyName}</td>
									<td>${mainBoard.academyRoadAddress}</td>
									<td>${mainBoard.academyCurriculumName}</td>
									<td>${mainBoard.academyRegisterDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">조건에 맞는 학원이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>	
			</table>
		</div>
		<%-- ======================== 페이징 출력 시작 ========================
          <nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  <!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
			  <c:if test="${pageMaker.prev}">
			  	<li class="page-item">
			  		<a href="${pageMaker.startPage - 1}" class="page-link">Previous</a>
			  		<a href="${pageMaker.startPage - 10}" class="page-link">Previous</a>
			  	</li>
			  </c:if>
			  
			  <!-- 바로가기 번호 출력 -->
			  <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			  	<li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
			  		<a href="${num}" class="page-link">${num}</a>
			  	</li>
			  </c:forEach>
			  <!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
			  <c:if test="${pageMaker.next}">
			  	<li class="page-item">
			  		<a href="${pageMaker.endPage + 1}" class="page-link">Next</a>
			  	</li>
			  </c:if>
			  
			  </ul>
			</nav>--%>
      </div>
    </section><!-- 매칭게시판 목록 끝 -->

  
  </main><!-- End #main -->
	<!-- End #main -->
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

	<!-- ======= Footer ==
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
	<script src="/resources/include/assets/js/mainList.js"></script>

</body>

</html>