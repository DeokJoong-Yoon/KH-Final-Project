<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!DOCTYPE html>
<html lang="kr">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/matching/css/matchingBoard.css"
	rel="stylesheet">

	<!-- ======= 설명 영역 ======= -->
	<section class="mcHero d-flex align-items-center">
		<div class="container">
			 
			<div class="row">
				<div class="col-12 text-center mcBanner">
					<p>내가 쓴 게시글 (매칭게시판)</p>
				</div>
			</div>
		</div>
	</section> <!-- 설명영역 끝 -->
	
	
	<main id="main" class="main">
	
		<!-- ======= 내가 쓴 게시글 (매칭게시판) 목록 ======= -->
			<section class="mcBoard">
				<div class="container">
			
					<form id="detailForm">
						<input type="hidden" id="matchingNo" name="matchingNo" />
					</form>
		
					<form id="matchingForm" name="matchingForm">
						<input type="hidden" name="pageNum" id="pagenum"
							value="${pageMaker.cvo.pageNum}"> <input type="hidden"
							name="amount" id="amount" value="${pageMaker.cvo.amount}">
					</form>
				
					<!-- ========= 게시글 목록 영역 ======== -->
					<div class="mcBoardList">
						<table>
							<thead>
								<tr>
									<th>글 번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody id="mcBoardList">
								<c:choose>
									<c:when test="${not empty matchingBoardList}">
										<c:forEach var="matchingBoard" items="${matchingBoardList }"
											varStatus="status">
											<tr data-num="${matchingBoard.matchingNo}">
												<td>${matchingBoard.matchingNo}</td>
												<td>
													<form name="privateChk" id="privateChk">
														<input type="hidden" name="matchingPrivate"
															value="${matchingBoard.matchingPrivate }" /> <input
															type="hidden" name="matchingPasswd"
															value="${matchingBoard.matchingPasswd }" />
													</form> <c:choose>
														<c:when test="${matchingBoard.matchingPrivate eq 'Y'}">
															<img src="/resources/include/assets/img/matching/자물쇠.png">&nbsp;
		                                                   <a class="mbdLink"
																href="">
																${matchingBoard.matchingGuAddress}&nbsp;${matchingBoard.matchingDongAddress}
																| ${matchingBoard.matchingTargetSubject } |
																${matchingBoard.matchingTargetGrade } </a>
														</c:when>
														<c:otherwise>
															<a class="mbdLink" href="">
																${matchingBoard.matchingGuAddress}&nbsp;${matchingBoard.matchingDongAddress}
																| ${matchingBoard.matchingTargetSubject } |
																${matchingBoard.matchingTargetGrade } </a>
														</c:otherwise>
													</c:choose> <c:if test="${matchingBoard.commentCnt > 0 }">
														<span class="comment_count">&nbsp;&nbsp;[${matchingBoard.commentCnt }]</span>
													</c:if>
												</td>
												<td class="writerId">${matchingBoard.personalId }</td>
												<td>${matchingBoard.matchingRegisterDate }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="5">등록된 게시글이 존재하지 않습니다</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

				<!-- 페이징 출력 시작 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a href="${pageMaker.startPage - 1}"
								class="page-link">Previous</a></li>
						</c:if>
	
						<!-- 바로가기 번호 출력 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li
								class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}"><a
								href="${num}" class="page-link">${num}</a></li>
						</c:forEach>
	
						<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
						<c:if test="${pageMaker.next}">
							<li class="page-item"><a href="${pageMaker.endPage + 1}"
								class="page-link">Next</a></li>
						</c:if>
					</ul>
				</nav>
				<!-- 페이징 출력 끝 -->
			
			</section>
			<!-- 내가 쓴 게시글(매칭게시판) 목록 끝 -->
			
	</main>
	<!-- End #main -->

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
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/assets/js/main.js"></script>
	<script src="/resources/include/personal/matchingBoardPersonalView.js"></script>



</body>

</html>