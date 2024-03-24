<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<!DOCTYPE html>
<html lang="kr">
<link href="/resources/include/board/free/css/freeUpdate.css" rel="stylesheet">

</head>

<body>
	<!-- ======= 입력 영역 ======= -->
	<main id="main">
		<section id="form">
			<div class="container">
				<form id="detailForm">
					<input type="hidden" id="commonNo" name="commonNo" />
				</form>
				
				<div class="boardDetail">
					<form id="f_writeForm">
					<input type="hidden" id="peronsalId" name="personalId" value="${personalLogin.personalId}"/>
					<input type="hidden" id="memberTypeId" name="memberTypeId" value="${personalLogin.memberTypeId}"/>
						<table>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" id="commonTitle" name="commonTitle" placeholder="제목을 입력해 주세요" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="commonContent" id="commonContent" placeholder="내용을 입력해주세요." rows="20"></textarea></td>
							</tr>
							<tr>
								<th>이미지 파일</th>
								<td>
									<input type="file" name="file" id="file" class="form-control" />
								</td>
							</tr>
						</table>
					</form>
					
					<div class="btnGroup">
						<button type="submit" id="freeInsertBtn" class="btn btn-primary btn-sm">등록</button>
						<button type="submit" id="freeCancelBtn" class="btn btn-primary btn-sm">취소</button>
						<button type="submit" id="freeListBtn" class="btn btn-primary btn-sm">목록</button>
					</div>
				</div>
			</div>
		</section>
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
	<script src="/resources/include/js/common.js"></script>
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/board/common/main.js"></script>
	<script src="/resources/include/board/free/js/freeWrite.js"></script>
	<script>
	$(function(){
		let errorMsg = "${errorMsg}";
		if(errorMsg != ""){
			alert(errorMsg);
		}
	});
	</script>

</body>

</html>