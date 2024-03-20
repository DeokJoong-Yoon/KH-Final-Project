<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="/resources/include/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/include/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
	
  <link rel="stylesheet" type="text/css" href="/resources/include/assets/css/academySignUp.css">

  
  
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="/">MyEdu<br />MySelect</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto active" href="/">홈</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#team">Team</a></li>
          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/free/freeList">자유게시판</a></li>
              <li><a href="#">홍보게시판</a></li>
              <li><a href="/matching/">매칭게시판</a></li>
              <li><a href="/notice/boardList">공지게시판</a></li>
              <c:if test="${commonLogin.memberTypeId == 1}">
					    <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">회원마이페이지</a></li>
					</c:if>
	                         <c:if test="${commonLogin.memberTypeId == 2}">
	                             <li><a href="${pageContext.request.contextPath}/academyaccount/mypage" id="mypageBtn">학원마이페이지</a></li>
	                         </c:if>
				</ul></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
		  <c:choose>
              <c:when test="${not empty commonLogin}">
                  <li><a class="nav-link scrollto">
                  <c:if test="${commonLogin.memberTypeId == 1}">회원 </c:if>
                  <c:if test="${commonLogin.memberTypeId == 2}">학원 </c:if>
                  ${commonLogin.name}님 환영합니다.</a></li>
                  <li>
                      <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
                          <button class="getstarted scrollto btn btn-aquamarine"type="submit">로그아웃</button>
                      </form>
                  </li>
              </c:when>
              <c:otherwise>
                  <li><a class="getstarted scrollto" href="${pageContext.request.contextPath}/loginselect">로그인/회원가입</a></li>
              </c:otherwise>
          </c:choose>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">

    <div class="container">
      <div class="row">
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>학원회원 마이페이지</h1>
        </div>
        <div class="col-lg-6 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="/resources/include/assets/img/hero-img.png" class="img-fluid animated" alt="" style="max-height:300px;">
        </div>
      </div>
    </div>
   </section><!-- End Hero -->
	
	<main id="main">		
		
	<form:form id="academyUpdateForm" action="/academyUpdate" modelAttribute="academyLoginVo" method="POST" name="academyMyPage">
		
		<div class="input_group">
			<label for="academyId">아이디</label>
			<form:input path="academyId" type="text" class="form-control" style="width: 400px;" maxlength="12" readonly="true" />
		</div>		
		
		<div class="input_group">
			<label for="academyPasswd" style="display: inline-block;" >비밀번호</label>
			<form:input path="academyPasswd" type="password"  class="form-control" style="width: 400px;" readonly="true" />
			<button type="button" id="changePasswdBtn">비밀번호 변경</button>
		</div>		
		
		<div class="input_group">
			<label for="academyNumber">사업자 등록번호</label>
			<form:input path="academyNumber" type="text" class="form-control" style="width: 400px;" readonly="true" />
		</div>		
		
		<div class="input_group">
			<label for="academyManagerName">담당자 이름</label>
			<form:input path="academyManagerName" type="text" class="form-control" style="width: 400px;" name="academyManagerName"/>
		</div>		
		
		<%-- <div class="input_group">
			<label for="academyManagerEmail">담당자 이메일</label>
			<form:input path="academyManagerEmail" type="text" class="form-control" style="width: 400px;" />
			<button id="emailCheckBtn" class="emailCheck">중복체크</button>
		</div> --%>		
		
		<div class="input_group">
		    <label for="academyManagerEmail">담당자 이메일</label>
		    기존 이메일주소입니다. 변경을 원하시면  <strong>@ 앞까지의<br/>이메일 주소</strong>만 다시입력 후 중복체크를 진행해주세요.<form:input path="academyManagerEmail" type="text" class="form-control" style="width: 400px;" placeholder="변경하실 주소 중, @ 앞의 주소만 입력해주세요"/>		    
		    @
		    <form:input path="academyManagerEmail1" type="text" class="form-control" style="width: 400px;" placeholder="아래 항목을 선택해주세요"/>
		    <select class="box" style="width: 400px;"  id="domain-list">
		        <option value="custom">직접입력</option>
		        <option value="naver.com">naver.com</option>
		        <option value="google.com">google.com</option>
		        <option value="hanmail.net">hanmail.net</option>
		        <option value="nate.com">nate.com</option>
		        <option value="kakao.com">kakao.com</option>
		    </select>
		    <button id="emailCheckBtn" class="emailCheck">중복체크</button>
		    <div id="email-check-message"></div>
		</div>
		
		<div class="input_group">
			<label for="academyManagerPhone">담당자 전화번호</label>
			<form:input path="academyManagerPhone" type="text" maxlength="11" class="form-control" style="width: 400px;"/>
		</div>		

		<div class="input_group">
			<label for="academyName">학원명</label>
			<form:input path="academyName" type="text" class="form-control" style="width: 400px;" readonly="true" />
		</div>		

		<div class="input_group">
			<label for="academy_address">학원주소</label>
			<form:input path="academyGuAddress" type="text" class="form-control" style="width: 400px;" readonly="true" />
			<form:input path="academyRoadAddress" type="text" class="form-control" style="width: 400px;" readonly="true" />
			<form:input path="academyDongAddress" type="text" class="form-control" style="width: 400px;" readonly="true" />
		</div>		

		<div class="input_group">
			<label for="academyPhone">학원 전화번호</label>
			<form:input path="academyPhone" type="text" maxlength="11" class="form-control" style="width: 400px;" readonly="true" />
		</div>		
			
		<div class="input_group">
			<label for="academyTargetSubject">교습과목</label>
			<form:input path="academyTargetSubject" type="text" class="form-control" style="width: 400px;" />
		</div>		
		<br />
		
		<div class="input_group">
			<label for="academy_fee" style="font-weight: bold;">수강료</label>			
			<div class="row">
				<div class="col-md-4">
					<form:radiobutton path="academyFee" id="fee1" value="10만원 미만" />
					<label for="fee1" style="font-weight: 300px;">10만원 미만</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyFee" id="fee2" value="10만원 이상 20만원 미만" />
					<label for="fee2" style="font-weight: 300px;">10만원 이상 20만원 미만</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyFee" id="fee3" value="20만원 이상 30만원 미만" />
					<label for="fee3" style="font-weight: 300px;">20만원 이상 30만원 미만</label>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<form:radiobutton path="academyFee" id="fee4" value="30만원 이상 40만원 미만" />
					<label for="fee4" style="font-weight: 300px;">30만원 이상 40만원 미만</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyFee" id="fee5" value="40만원 이상 50만원 미만" />
					<label for="fee5" style="font-weight: 300px;">40만원 이상 50만원 미만</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyFee" id="fee6" value="50만원 이상" />
					<label for="fee6" style="font-weight: 300px;">50만원 이상</label>
				</div>
			</div>
		</div>		
		<br />
		
		<div class="input_group">
			<label for="academyTargetGrade" style="font-weight: bold;">대상 학년</label>			
			<div class="row">
				<div class="col-md-4">
					<form:radiobutton path="academyTargetGrade" id="grade1" value="미취학"/>
					<label for="grade1" style="font-weight: 300px;">미취학</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyTargetGrade" id="grade2" value="초등저학년"/>
					<label for="grade2" style="font-weight: 300px;">초등저학년</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyTargetGrade" id="grade3" value="초등고학년"/>
					<label for="grade3" style="font-weight: 300px;">초등고학년</label>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<form:radiobutton path="academyTargetGrade" id="grade4" value="중등"/>
					<label for="grade4" style="font-weight: 300px;">중등</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyTargetGrade" id="grade5" value="고등"/>
					<label for="grade5" style="font-weight: 300px;">고등</label>
				</div>
				<div class="col-md-4">
					<form:radiobutton path="academyTargetGrade" id="grade6" value="성인"/>
					<label for="grade6" style="font-weight: 300px;">성인</label>
				</div>
			</div>
		</div>
		<br />

		<div class="input_group">
		    <label for="academyKeyword1" style="font-weight: bold;">키워드 선택 </label>
		    <form:errors path="academyKeyword1" cssClass="error" />
		    <div class="row">
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword1" name="academyKeyword" id="keyword1" class="keyword-checkbox" value="기초부터" />
		            <label for="keyword1" style="font-weight: 300px;">기초부터</label>
		        </div>
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword2" name="academyKeyword" id="keyword2" class="keyword-checkbox" value="심화수업" />
		            <label for="keyword2" style="font-weight: 300px;">심화수업</label>
		        </div>
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword3" name="academyKeyword" id="keyword3" class="keyword-checkbox" value="친절한 강사" />
		            <label for="keyword3" style="font-weight: 300px;">친절한 강사</label>
		        </div>
		    </div>
		    <div class="row">
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword4" name="academyKeyword" id="keyword4" class="keyword-checkbox" value="꼼꼼한 관리" />
		            <label for="keyword4" style="font-weight: 300px;">꼼꼼한 관리</label>
		        </div>
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword5" class="keyword-checkbox" value="숙제 없음" />
		            <label for="keyword5" style="font-weight: 300px;">숙제 없음</label>
		        </div>
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword6" class="keyword-checkbox" value="자기주도적" />
		            <label for="keyword6" style="font-weight: 300px;">자기주도적</label>
		        </div>
		    </div>
		    <div class="row">
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword7" class="keyword-checkbox" value="강의식 수업" />
		            <label for="keyword7" style="font-weight: 300px;">강의식 수업</label>
		        </div>
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword8" class="keyword-checkbox" value="입시 대비" />
		            <label for="keyword8" style="font-weight: 300px;">입시 대비</label>
		        </div>
		        <div class="col-md-4">
		            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword9" class="keyword-checkbox" value="재밌는 수업" />
		            <label for="keyword9" style="font-weight: 300px;">재밌는 수업</label>
		        </div>
		    </div>
		</div>
		<br />

		<div class="input_group">
			<span>
				<button type="button" name="updateBtn" id="updateBtn" class="btn btn-primary btn-sm">회원정보 수정하기</button> 
				<a href="/payment/payMain" class="btn btn-primary btn-sm">결제하기</a>
								
			</span>
			<!-- 홍보 게시판에서 내가 쓴 글 목록 보기 -->  
        	<a href="/academyMatchingList" class="btn btn-primary">홍보 게시판 내가 쓴 글 목록</a>
			
		</div>	
		<br />
	  
	</form:form>
	<script src="/resources/include/academy/jquery-3.7.1.min.js"></script>
	<!-- 키워드 선택 제어 -->
	<script>
	    window.onload = function() {
	        var maxKeywords = 5;
	        var checkboxes = document.querySelectorAll('.keyword-checkbox');
	        function checkboxClickHandler() {
	            var checkedCount = 0;
	            checkboxes.forEach(function(checkbox) {
	                if (checkbox.checked) {
	                    checkedCount++;
	                }
	            });
	            if (checkedCount > maxKeywords) {
	                this.checked = false;
	                alert('키워드는 최대 ' + maxKeywords + '개의 항목만 선택할 수 있습니다.');
	            }
	        }
	        checkboxes.forEach(function(checkbox) {
	            checkbox.addEventListener('click', checkboxClickHandler);
	        });
	    };
	</script>
	
	<form id="withdrawalForm" action="/withdrawal/academy" method="POST">
		<button type="submit" id="withdrawalBtn"
			class="btn btn-primary btn-sm">탈퇴하기</button>
	</form>

	</main>
	<!-- End #main -->
	
	<script>
	    $(function() {
	        $("#updateBtn").on("click", function(event) {
	        	event.preventDefault(); // 기본 제출 동작 방지
	        	console.log("폼 제출 버튼 클릭!");	        	
	        	
	        	var academyManagerName = $("#academyManagerName").val();
	        	console.log("Academy manager name: ", academyManagerName);
	        	
	            // 수정 여부를 사용자에게 확인하기 위해 알림창을 표시합니다.
	            if (confirm("회원 정보를 수정하시겠습니까?")) {
	                // 사용자가 확인을 누른 경우, AJAX를 통해 서버로 업데이트 요청을 전송합니다.
	                $.ajax({
	                    url: "/academyUpdate",
	                    type: "POST",
	                    data: $(this).serialize(),
	                    success: function(response) {
	                        // 서버에서 성공적인 응답을 받았을 때 실행되는 부분
	                        alert("회원 정보가 성공적으로 업데이트되었습니다.");
	                        // 성공한 경우 페이지를 새로고침하여 변경된 정보를 반영할 수 있도록 한다.
	                        location.reload();
	                    },
	                    error: function(xhr, status, error) {
	                        alert("회원 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
	                        console.error(xhr.responseText);
	                    }
	                });
	            } else {
	                return false;
	            }
	        });
	
	        $("#changePasswdBtn").on("click", function() {
	            // 사용자에게 비밀번호를 수정할 것인지 묻는 알림
	            if (confirm("비밀번호를 수정하시겠습니까?")) {
	                window.location.href = "/passwdChangePage";
	            } else {
	                // 사용자가 취소를 누른 경우 아무 동작 없음
	            }
	        });
	    });
	</script>

	

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-contact">
						<h3>MyEduMySelect</h3>
						<p> 
							서울특별시 강남구 테헤란로14길 6 <br> 남도빌딩 2F, 3F, 4F, 5F, 6F <br> 대한민국 <br>
							<br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
							info@example.com<br>
						</p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Social Networks</h4>
						<p>Cras fermentum odio eu feugiat lide par naso tierra videa
							magna derita valies</p>
						<div class="social-links mt-3">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
								href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
							<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
							<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div>
					</div>

				</div>
			</div>
		</div>

		<div class="container footer-bottom clearfix">
			<div class="copyright">
				&copy; Copyright <strong><span>MyEduMySelect</span></strong>. All
				Rights Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center">
		<i class="bi bi-arrow-up-short"></i>
	</a>

	<!-- Vendor JS Files -->
	<script src="/resources/include/assets/vendor/aos/aos.js"></script>
	<script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	
  	<script src="/resources/include/academy/mypage.js"></script>
  	<!-- <script src="/resources/include/assets/js/academy.js"></script> -->
  	<!-- <script src="/resources/include/academy/academyJoin.js"></script> -->
	<!-- <script src="/resources/include/academy/common.js"></script> -->
	<script src="/resources/include/assets/js/main.js"></script>
	


	<script>
		$(document).ready(function() {
			$("#withdrawalBtn").click(function() {
				// confirm 창을 띄우고 사용자가 '예'를 선택한 경우에만 form을 제출합니다.
				var confirmWithdrawal = confirm("정말로 탈퇴하시겠습니까?");
				if (confirmWithdrawal) {
					$("#withdrawalForm").submit();
				}
			});
		});
	</script>

	<!-- <script>
		window.onload = function() {
			var confirmMessage = "${confirmMessage}";
			if (confirmMessage) {
				var result = confirm(confirmMessage);
				if (result) {
					window.location.href = "/academyaccount/login"; // 확인 눌렀을 경우 로그인 페이지로 이동
				} else {
					window.location.href = "/";
				}
			}
		};
	</script> -->

	
</body>

</html>