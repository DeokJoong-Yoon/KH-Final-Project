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
		            내가 찜한 학원 목록<br/>
		            <div class="descBox">
		            	<strong>내가 찜한 학원 목록입니다 마음에 드는 학원이랑 연결해보세요!</strong>		            	
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->


<!-- ======= 게시판 영역 ======= -->
<main id="main">
	<section class="board">

		<div class="container">

			<!-- ========= 게시글 목록 영역 ======== -->
			<div class="boardList">
				<table id="listBoxes">
					<c:choose>
						<c:when test="${not empty advertiseVO}">
							<c:forEach var="adv" items="${advertiseVO}" varStatus="status">
								<c:if test="${status.index % 3 == 0}">
									<tr>
								</c:if>
								<td data-num="${adv.commonNo}"><img
									src="${adv.commonFile }"> <br>
								<br>
									<h5>
										<a class="advLink" href="#">${adv.commonNickname} </a>
									</h5>
									<p>${adv.commonTitle}</p>
								</td>
								<c:if
									test="${status.index % 3 == 2 or status.index == advertiseVO.size() - 1}">
									</tr>
								</c:if>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">찜한 게시글이 존재하지 않습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
	</section>

	<!-- 매칭게시판 목록 끝 -->

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