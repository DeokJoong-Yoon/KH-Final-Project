<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

<link href="/resources/include/board/free/css/freeUpdate.css"
	rel="stylesheet">
</head>

<body>


  <!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="commonNo" name="commonNo" />
				</form>

				<div class="col-12 text-center banner">
		            자유 게시판<br/>
		            <div class="descBox">
		            	자유롭게 글을 작성할 수 있는 <b>자유게시판</b>입니다.<br>
		            	질문, 후기, 정보 등 도움이 될 만한 다양한 글을 남겨주세요!
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->


	
	<!-- ======= 게시판 수정 영역 ======= -->
	<main id="main">
	
		<section id="form">
			<div class="container">

				<form id="updateForm" name="updateForm">
					<input type="hidden" id="commonNo_hidden" name="commonNo" value="${freeUpdateData.commonNo}" />
					<input type="hidden" id="commonFile" name="commonFile" value="${freeUpdateData.commonFile}" />
					<input type="hidden" id="personalId" name="personalId" value="${freeUpdateData.personalId}" />
							
					<div class="boardDetail">		
						<table>
							<tr>
								<th>글 번호</th>
								<td>${freeUpdateData.commonNo} (조회수 : ${freeUpdateData.commonReadcnt})</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${freeUpdateData.personalId}</td>
							</tr>
							<tr>
								<th>작성일</th>
								<td>${freeUpdateData.commonRegisterDate}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>
									<input type="text" id="commonTitle" name="commonTitle" value="${freeUpdateData.commonTitle}" placeholder="제목을 입력해 주세요" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="commonContent" id="commonContent" placeholder="내용을 입력해주세요." rows="20">${freeUpdateData.commonContent}</textarea></td>
							</tr>
							<tr>
								<th>이미지 파일</th>
								<td>
									<input type="file" name="file" id="file" class="form-control" />
								</td>
							</tr>
						</table>
					</div>
				</form>
				
				<div class="detailButtons">
					<button type="submit" id="freeUpdateBtn" class="btn btn-primary btn-sm" >수정</button>
					<button type="button" id="freeCancelBtn" class="btn btn-primary btn-sm">취소</button>
					<button type="button" id="freeListBtn" class="btn btn-primary btn-sm">목록</button>
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
	<script src="/resources/include/board/free/js/freeUpdate.js"></script>
	<script src="/resources/include/board/common/main.js"></script>
	<script>
		$(function() {
			let errorMsg = "${errorMsg}";
			if (errorMsg != "") {
				alert(errorMsg);
			}
		});

	</script>
</body>

</html>