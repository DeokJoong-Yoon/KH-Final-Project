<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!DOCTYPE html>
<html lang="kr">


<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/board/free/css/free.css" rel="stylesheet">


	<!-- ======= 게시판 영역 ======= -->
	<section id="hero" class="d-flex align-items-center ">
		<div class="container">
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="commonNo" name="commonNo" />
				</form>

				<div class="col-12 text-center banner">
		           내가 쓴 게시글(자유 게시판)<br/>
		       </div> 
		    </div>
		</div>
	</section>
	
	<main id="main">
		<section class="board">
			<div class="container">
				<form id="detailForm">
					<input type="hidden" id="commonNo" name="commonNo" />
				</form>
				
				<form id="freeForm" name="freeForm">
					<input type="hidden" name="pageNum" id="pagenum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
				</form>
				
				
				<!-- ========= 게시글 목록 영역 ======== -->
				<div class="list">
					<table >
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
						<tbody id="list" >
						    <c:choose> 
						        <c:when test="${not empty freeBoardList}">
						            <c:forEach var="free" items="${freeBoardList}" varStatus="status">
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
			</div>
			
			<%-- ======================== 페이징 출력 시작 ========================--%>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
							<a href="${pageMaker.startPage - 1}" class="page-link">Previous</a>
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
						<li class="page-item"><a href="${pageMaker.endPage + 1}" class="page-link">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</section>
	</main>	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	


	

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
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<!--<script src="/resources/include/board/free/js/freeList.js"></script>-->
	<!--<script src="/resources/include/board/common/main.js"></script>-->
	<script src="/resources/include/personal/main.js"></script>
	<script src="/resources/include/personal/freeBoardPersonalView.js"></script>
	
</body>

</html>