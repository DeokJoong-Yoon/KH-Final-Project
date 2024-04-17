<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	


<link href="/resources/include/board/free/css/freeDetail.css"
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
	
	
	<main id="main">
	
		<!-- ======= 자유게시판 상세 보기 ======= -->
		<section class="board">
		
			<div class="container">

				<form id="f_data" name="f_data">
					<input type="hidden" name="commonNo" id="commonNo" value="${detail.commonNo}"/>
					<input type="hidden" name="personalId" id="personalId" value="${detail.personalId}"/>
					<input type="hidden" name="commonFile" id="commonFile" value="${detail.commonFile}"/>
		      	</form>
					<div class="boardDetail">
						<table id="table">
							<thead>
								<tr>
									<th>글 번호</th>
									<td>${detail.commonNo} (조회수 : ${detail.commonReadcnt})</td>
								</tr>
								<tr>
									<th>제목</th>
									<td>${detail.commonTitle}</td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${detail.personalId}</td>
								</tr>
								<tr>
									<th>작성일</th>
									<td>${detail.commonRegisterDate}</td>
								</tr>
							</thead>
	
							<tbody>
								<tr>
									<th>내용</th>
									<td>${detail.commonContent}</td>
								</tr>
								<c:if test="${not empty detail.commonFile}">
									<tr>
										<th>이미지</th>
										<td>
											<img src="/uploadStorage/free/${detail.commonFile}" class="rounded" style="max-width:600px; " />
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>

					
				<div class="col-md-12 text-end ms-auto" id=BtnGroup>
					<button type="button" id="freeUpdateBtn" class="btn btn-primary btn-sm">글수정</button>
					<button type="button" id="freeDeleteBtn" class="btn btn-primary btn-sm">글삭제</button>
					<button type="button" id="freeWriterBtn" class="btn btn-primary btn-sm">글쓰기</button>
					<button type="button" id="freeListBtn" class="btn btn-primary btn-sm">목록</button>
				</div>
			</div>
		
		</section>  <!-- 자유게시판 상세보기 끝 -->
		
	</main>

	
	<section  class="commentSection">
			<jsp:include page="freereply.jsp" />
	</section>

	<main id="main"></main>
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
	<script src="/resources/include/assets/js/main.js"></script>
	<script src="/resources/include/board/free/js/freeDetail.js"></script>
		<script>
	</script>
</body>

</html>