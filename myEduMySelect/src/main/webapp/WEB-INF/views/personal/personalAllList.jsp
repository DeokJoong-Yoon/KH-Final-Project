<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MyEduMySelect</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="/resources/include/assets/img/favicon.png" rel="icon">
<link href="/resources/include/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/resources/include/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="/resources/include/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/matching/css/matchingBoard.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->


<!-- <script>
		window.onload = function(){
			let confirmMsg = "${confirmMsg}";
			if(confirmMsg) {
				let result = confirm(comfirmMsg);
				if(result) {
					window.location.href= "/useraccount/login";
				} else {
					window.location.href= "/matching/boardList";
				}
			}
		}
	</script> -->

</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
		<div class="container d-flex align-items-center">

			<h1 class="logo me-auto">
				<a href="index.html">MyEdu<br />MySelect
				</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="#hero">홈</a></li>
					<li><a class="nav-link scrollto" href="#about">About</a></li>
					<li><a class="nav-link scrollto" href="#team">Team</a></li>
					<li class="dropdown"><a href="#"><span>메뉴</span> <i
							class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">홍보게시판</a></li>
							<li><a href="#">매칭게시판</a></li>
							<li><a href="#">문의게시판</a></li>
							<li><a href="#">마이페이지</a></li>
						</ul></li>
					<li><a class="nav-link scrollto" href="#contact">Contact</a></li>
					<li><a class="getstarted scrollto" href="#about">로그인/회원가입</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= 설명 영역 ======= -->
	<section class="mcHero d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div class="col-12 text-center mcBanner">
					내가 쓴 글 모아보기<br />
					<div class="mcDescBox">
						<p>ㅎㅇ</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 설명영역 끝 -->


	<main id="main">


		<div class="container">


			<!-- 매칭 게시글 목록 -->
			<div class="card">
				<div class="card-header">
					<h2>매칭 게시글 목록</h2>
				</div>
				<div class="card-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="matchingPost" items="${userMatchingList}">
								<tr>
									<td>${matchingPost.matchingNo}</td>
									<td>${matchingPost.matchingGuAddress}
										${matchingPost.matchingDongAddress} |
										${matchingPost.matchingTargetSubject} |
										${matchingPost.matchingTargetGrade}</td>
									<td>${matchingPost.personalId}</td>
									<td>${matchingPost.matchingRegisterDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
<!-- 페이지 이동바 -->
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <!-- 이전 바로가기 5개 존재 여부를 prev 필드의 값으로 확인 -->
        <c:if test="${matchingPageDTO.prev}">
            <li class="page-item">
                <a href="?pageNum=${matchingPageDTO.startPage - 1}&amp;amount=${matchingPageDTO.cvo.amount}" class="page-link">이전</a>
            </li>
        </c:if>

        <!-- 바로가기 번호 출력 -->
        <c:forEach var="num" begin="${matchingPageDTO.startPage}" end="${matchingPageDTO.endPage}">
            <li class="page-item ${matchingPageDTO.cvo.pageNum == num ? 'active' : ''}">
                <a href="?pageNum=${num}&amp;amount=${matchingPageDTO.cvo.amount}" class="page-link">${num}</a>
            </li>
        </c:forEach>

        <!-- 다음 바로가기 5개 존재 여부를 next 필드의 값으로 확인 -->
        <c:if test="${matchingPageDTO.next}">
            <li class="page-item">
                <a href="?pageNum=${matchingPageDTO.endPage + 1}&amp;amount=${matchingPageDTO.cvo.amount}" class="page-link">다음</a>
            </li>
        </c:if>
    </ul>
</nav>








			<!-- 자유 게시글 목록 -->
			<div class="card">
				<div class="card-header">
					<h2>자유 게시글, 좋아요 표시한 글 목록</h2>
				</div>
				<div class="card-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="freePost" items="${userFreeList}">
								<tr>
									<td>${freePost.commonNo}</td>
									<td>${freePost.commonTitle}</td>
									<td>${freePost.personalId}</td>
									<td>${freePost.commonRegisterDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>


			<!-- 홍보 게시글 목록 -->
			<div class="card">
				<div class="card-header">
					<h2>홍보 게시글에서 찜 한 학원목록</h2>
				</div>
				<div class="card-body">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="advertisePost" items="${userAdvertiseList}">
								<tr>
									<td>${advertisePost.advertiseNo}</td>
									<td>${advertisePost.advertiseTitle}</td>
									<td>${advertisePost.personalId}</td>
									<td>${advertisePost.advertiseRegisterDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- 부트스트랩 스크립트 추가 -->
		<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
