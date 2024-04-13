<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">


<!-- Template Main CSS File -->
<link href="/resources/include/board/advertise/css/advertiseList.css" rel="stylesheet">
	
	<!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="common_no" name="common_no" />
				</form>

				<div class="col-12 text-center banner">
		            홍보 게시판<br/>
		            <div class="descBox">
		            	우리 학원이 얼마나 멋진 장소인지 자랑하는 <b>홍보 게시판</b>입니다. 
						당신이 찾는 모든 학원 정보가 바로 여기에!<br>
						홍보 게시판에서 마음에 드는 학원을 발견했다면, '찜'을 눌러 보세요! 내가 찜한 학원 목록은 마이페이지에서 확인 가능합니다.
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->
	
	
	<!-- ======= 세션을 위한 hidden input ======= -->
	<input type="hidden" id="personalId" name="personalId" value="${personalLoginVO.personalId }"/>
	<input type="hidden" id="academyId" name="academyId" value="${academyLoginVO.academyId }"/>


	<!-- ======= 게시판 영역 ======= -->
	<main id="main">
		<section class="board">
			
			<div class="container">
			
				<!-- ======= 검색 영역 ======= -->
				<div class="advertiseSearch">
					<form id="a_search" name="a_search" >
					
						<!-- 페이징 처리를 위한 파라미터 -->
						<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
	 					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
	 					
	 					<button type="button" id="boardAll">전체 보기</button>
	 					
	 					<button type="button" id="boardSearchBtn">검색</button>	 			
						<input type="text" name="keyword" id="keyword" placeholder="검색어 입력" value="${kwd }">
					</form>	
				</div><br><br>		<!-- 검색 영역 끝 -->
				
							
				<!-- ========= 게시글 목록 영역 ======== -->
				<div class="boardList">
				
						
					<table id="listBoxes">
					    <c:choose>
					        <c:when test="${not empty advertiseList}">
					            <c:forEach var="adv" items="${advertiseList}" varStatus="status">
					                <c:if test="${status.index % 3 == 0}">
					                    <tr>
					                </c:if>
							                <td data-num="${adv.commonNo}">
							                    <img src="/uploadStorage/advertise/${adv.commonFile }"> <br><br>
							                    <h5><a class="advLink" href="#">${adv.commonNickname} </a></h5> 
							                    <p>${adv.commonTitle} </p>
							                </td>
					                <c:if test="${status.index % 3 == 2 or status.index == mBoardList.size() - 1}">
					                    </tr>
					                </c:if>
					            </c:forEach>
					        </c:when>
					        <c:otherwise>
					            <tr>
					                <td colspan="3">등록된 게시글이 존재하지 않습니다</td>
					            </tr>
					        </c:otherwise>
					    </c:choose>
					</table>
					
				</div>
				
				<div class="text-end">
					<button type="submit" id="advertiseInsertBtn">글쓰기</button>
				</div>
			</div>	
		
		</section>
		
		<%------------ 페이징 출력 시작 ---------- --%>
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <!-- 이전 바로가기 5개 존재 여부를 prev 필드의 값으로 확인 -->
		    <c:if test="${pageMaker.prev }">
			    <li class="page-item">
			    	<a href="${pageMaker.startPage - 1 }" class="page-link">이전</a>
			    </li>
			</c:if>
			
			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	       		<li class="page-item  ${pageMaker.cvo.pageNum == num ? 'active':''}">
		           <a href="${num}" class="page-link">${num}</a>
 		        </li>
	       </c:forEach>
			
			<!-- 다음 바로가기 5개 존재 여부를 next 필드의 값으로 확인 -->
			<c:if test="${pageMaker.next }">
				<li class="page-item">
					<a href="${pageMaker.endPage + 1 }" class="page-link">다음</a>
				</li>
			</c:if>
		  </ul>
		</nav>		<!-- 매칭게시판 목록 끝 -->
		
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
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/board/advertise/js/advertiseList.js"></script>
	<script src="/resources/include/board/common/main.js"></script>

	<script>
		$(function() {
			let popUp = "${popUp}";
			if (popUp != "") {
				alert(popUp);
			}
		});
	</script>

</body>

</html>