<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<li><a class="getstarted scrollto" href="/signUp">로그인/회원가입</a></li>

				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>회원 탈퇴 페이지</h1>
					<h2></h2>


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

    <h1>회원탈퇴 페이지</h1>
    <form id="withdrawalForm" action="/withdrawal/personal" method="POST">
        <div>
            <label for="currentPassword">현재 비밀번호:</label>
            <input type="password" id="currentPassword" name="currentPassword">
        </div>
        <div>
            <button type="button" id="withdrawalBtn">회원 탈퇴</button>
        </div> 
    </form>


    <script>
        $(document).ready(function() {
            $("#withdrawalBtn").on("click", function() {
                var currentPassword = $("#currentPassword").val();
                $.ajax({
                    type: 'POST',
                    url: '/withdrawalPersonal',
                    data: {
                        currentPassword: currentPassword
                    },
                    dataType: "text",
                    success: function(data) {
                        if (data.trim() === "TRUE") {  
                            // 현재 비밀번호가 일치하는 경우
                            if (confirm("회원 탈퇴하시겠습니까?")) {
                                // 확인 버튼 클릭 시 회원 탈퇴를 위한 form을 제출
                                $("#withdrawalForm").submit();
                            }
                        } else {
                            // 현재 비밀번호가 일치하지 않는 경우
                            alert("현재 비밀번호가 일치하지 않습니다.");
                            $("#currentPassword").val("");
                            $("#currentPassword").focus();
                        }
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
                    }
                });
            });
        });
    </script>
  
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />   
    <!-- Vendor JS Files -->
  <script src="/resources/include/assets/vendor/aos/aos.js"></script>
  <script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>
    
    <script src="/resources/include/personal/jquery-3.7.1.min.js"></script>
    <script src="/resources/include/assets/js/main.js"></script>
</body>
</html>
