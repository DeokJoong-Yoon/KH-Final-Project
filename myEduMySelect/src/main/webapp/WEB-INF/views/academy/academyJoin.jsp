<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta name="viewport" content="width=device-width, initial-scale=1">

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

  <!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <link rel="stylesheet" type="text/css" href="/resources/include/assets/css/signUp.css">
  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh3E263XmFcJlSAwiqF/X57qzdN1yW+i" crossorigin="anonymous"> -->
    <style>
        .error { display: block; padding: 10px 0px; font-size: 18px; color: #dc3545; }
    </style>
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
          <li><a class="nav-link scrollto active" href="#hero">홈</a></li>
          <li><a class="nav-link scrollto" href="#about">About</a></li>
          <li><a class="nav-link scrollto" href="#team">Team</a></li>
          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">자유게시판</a></li>
              <li><a href="#">홍보게시판</a></li>
              <li><a href="#">매칭게시판</a></li>
              <li><a href="#">문의게시판</a></li>
              <li><a href="/academyaccount/mypage" id="mypageBtn">마이페이지</a></li>
            </ul>
          </li>
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
        <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
          <h1>학원회원 가입</h1>
          <h2>회원은 개인회원과 학원회원으로 나뉘어 집니다.</h2>

        </div>
        <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
          <img src="/resources/include/assets/img/hero-img.png" class="img-fluid animated" alt="">
        </div>
      </div>
    </div>
   </section><!-- End Hero -->

  <main id="main">

    <!-- ======= academySignUp Form ======= -->

    <h1 style="text-align:center">회원가입</h1>
    <form:form action="/academyInsert" modelAttribute="academySignUpVo" method="post" name="join" id="join">

     <!-- 글로벌 에러 출력 -->
     <spring:hasBindErrors name="academySignUpVo">
            <c:forEach var="error" items="${errors.globalErrors}">
                 <p class="error">${error.defaultMessage}</p>
            </c:forEach>
     </spring:hasBindErrors>

      <div class="input_group">
        <label for="academyId">아이디</label>
        <form:input path="academyId" type="text" name="academyId" id="academyId" maxlength="12" placeholder="아이디 입력"/>
        <form:errors path="academyId" cssClass="error" />
        <button id="checkDuplicateBtn" class="duplicate-check">중복체크</button>        
        <div id="duplicate-message"></div>
      </div>
      <br />
      <div class="input_group">
        <label for="academyPasswd">비밀번호</label>
        <input type="password" name="academyPasswd" id="academyPasswd" maxlength="20" placeholder="비밀번호 입력">        
      </div>
      <br />
      <div class="input_group">
        <label for="academyPasswd2">비밀번호 확인</label>
        <input type="password" name="academyPasswd2" id="academyPasswd2" maxlength="20">
        <span id="password-check-message"></span>
      </div>
      <br />
      <div class="input_group">
        <label for="academyNumber">사업자 등록번호</label>
        <form:input path="academyNumber" type="text" name="academyNumber" id="academyNumber" maxlength="10" placeholder="(-)하이폰 기호 없이 입력해주세요."/>
        <form:errors path="academyNumber" cssClass="error" />
        <button id="searchDuplicateBtn" class="duplicate-check">검색</button>
        <div id="search-message"></div>
      </div>
      <br />
      <div class="input_group">
        <label for="academyManagerName">담당자 이름</label>
        <form:input path="academyManagerName" type="text" name="academyManagerName" id="academyManagerName" maxlength="20"/>
        <form:errors path="academyManagerName" cssClass="error" />
      </div>
      <br />
      <div class="input_group">
        <label for="academyManagerEmail1">담당자 이메일</label>
        <form:input path="academyManagerEmail1" type="text" name="academyManagerEmail1" id="academyManagerEmail1"/>
        <form:errors path="academyManagerEmail1" cssClass="error" />
        <strong>@</strong>
        <form:input path="academyManagerEmail2" type="text" class="box" name="academyManagerEmail2" id="academyManagerEmail2"/>
        <form:errors path="academyManagerEmail2" cssClass="error" />
        <select class="box" id="domain-list">
          <option value="custom">직접입력</option>
          <option value="naver.com">naver.com</option>
          <option value="google.com">google.com</option>
          <option value="hanmail.net">hanmail.net</option>
          <option value="nate.com">nate.com</option>
          <option value="kakao.com">kakao.com</option>
        </select>
        <button id="emailCheckBtn" class="emailCheck">중복체크</button>
      </div>
      <br />
        <div class="input_group">
            <label for="academyManagerPhone">담당자 전화번호</label>
        <form:input path="academyManagerPhone" type="text" name="academyManagerPhone" id="academyManagerPhone" maxlength="11" placeholder="(-)하이폰 기호 없이 입력해주세요."/>
        <form:errors path="academyManagerPhone" cssClass="error" />
      </div>
      <br />
      <div class="input_group">
        <label for="academyName">학원명</label>
        <form:input path="academyName" type="text" name="academyName" id="academyName"  maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" readonly="readonly"/>
        <form:errors path="academyName" cssClass="error" />
      </div>
      <br />
      <div class="input_group">
        <label for="academyAddress">학원주소</label>
	        <div class="input_group">
	          <label for="academyGuAddress">행정구역명</label>
	          <form:input path="academyGuAddress" type="text" name="academyGuAddress" id="academyGuAddress" maxlength="20" placeholder="사업자 등록번호를 먼저 입력해주세요" readonly="readonly"/>
	          <form:errors path="academyGuAddress" cssClass="error" />

	          <label for="academyRoadAddress">도로명주소</label>
	          <form:input path="academyRoadAddress" type="text" name="academyRoadAddress" id="academyRoadAddress" maxlength="200" placeholder="사업자 등록번호를 먼저 입력해주세요" readonly="readonly"/>
	          <form:errors path="academyRoadAddress" cssClass="error" />

	          <label for="academyDongAddress">상세주소</label>
	          <form:input path="academyDongAddress" type="text" name="academyDongAddress" id="academyDongAddress" maxlength="20" placeholder="사업자 등록번호를 먼저 입력해주세요" readonly="readonly"/>
	          <form:errors path="academyDongAddress" cssClass="error" />
	      	</div>      	
      </div>
      <br />
      <div class="input_group">
        <label for="academyPhone">학원 전화번호</label>
        <form:input path="academyPhone" type="text" name="academyPhone" id="academyPhone" maxlength="11" placeholder="(-)하이폰 기호 없이 입력해주세요."/>
        <form:errors path="academyPhone" cssClass="error" />
      </div>
      <br />
      <div class="input_group">
        <label for="academyTargetSubject">교습과목</label>
        <form:input path="academyTargetSubject" type="text" name="academyTargetSubject" id="academyTargetSubject" maxlength="20" placeholder="교습과목을 입력해주세요"/>
        <form:errors path="academyTargetSubject" cssClass="error" />
      </div>
      <br />
      <div class="input_group">
       <label for="academyFee" style="font-weight:bold;">수강료</label>
       <form:errors path="academyFee" cssClass="error" />
       <div class="row">
           <div class="col-md-4">
               <form:radiobutton path="academyFee" id="fee1" value="10만원 미만"/>
               <label for="fee1" style="font-weight:300px;">10만원 미만</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyFee" id="fee2" value="10만원 이상 20만원 미만"/>
               <label for="fee2" style="font-weight:300px;">10만원 이상 20만원 미만</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyFee" id="fee3" value="20만원 이상 30만원 미만"/>
               <label for="fee3" style="font-weight:300px;">20만원 이상 30만원 미만</label>
           </div>
       </div>
       <div class="row">
           <div class="col-md-4">
               <form:radiobutton path="academyFee" id="fee4" value="30만원 이상 40만원 미만"/>
               <label for="fee4" style="font-weight:300px;">30만원 이상 40만원 미만</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyFee" id="fee5" value="40만원 이상 50만원 미만"/>
               <label for="fee5" style="font-weight:300px;">40만원 이상 50만원 미만</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyFee" id="fee6" value="50만원 이상"/>
               <label for="fee6" style="font-weight:300px;">50만원 이상</label>
           </div>
       </div>
     </div>
     <br />
     <div class="input_group">
       <label for="academyTargetGrade" style="font-weight:bold;">대상 학년</label>
       <form:errors path="academyTargetGrade" cssClass="error" />
       <div class="row">
           <div class="col-md-4">
               <form:radiobutton path="academyTargetGrade" id="grade1" value="미취학"/>
               <label for="grade1" style="font-weight:300px;">미취학</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyTargetGrade" id="grade2" value="초등저학년"/>
               <label for="grade2" style="font-weight:300px;">초등저학년</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyTargetGrade" id="grade3" value="초등고학년"/>
               <label for="grade3" style="font-weight:300px;">초등고학년</label>
           </div>
       </div>
       <div class="row">
           <div class="col-md-4">
               <form:radiobutton path="academyTargetGrade" id="grade4" value="중등"/>
               <label for="grade4" style="font-weight:300px;">중등</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyTargetGrade" id="grade5" value="고등"/>
               <label for="grade5" style="font-weight:300px;">고등</label>
           </div>
           <div class="col-md-4">
               <form:radiobutton path="academyTargetGrade" id="grade6" value="성인"/>
               <label for="grade6" style="font-weight:300px;">성인</label>
           </div>
       </div>
      </div> 
     <br />
     <div class="input_group"> 
	    <label for="academyKeyword1" style="font-weight:bold;">키워드 선택 </label>
	    <form:errors path="academyKeyword1" cssClass="error" />
	    <div class="row">
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword1" name="academyKeyword" id="keyword1" value="기초부터"/>
	            <label for="keyword1" style="font-weight:300px;">기초부터</label>
	        </div>
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword2" name="academyKeyword" id="keyword2" value="심화수업"/>
	            <label for="keyword2" style="font-weight:300px;">심화수업</label>
	        </div>
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword3" name="academyKeyword" id="keyword3" value="친절한 강사"/>
	            <label for="keyword3" style="font-weight:300px;">친절한 강사</label>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword4" name="academyKeyword" id="keyword4" value="꼼꼼한 관리"/>
	            <label for="keyword4" style="font-weight:300px;">꼼꼼한 관리</label>
	        </div>
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword5" value="숙제 없음"/>
	            <label for="keyword5" style="font-weight:300px;">숙제 없음</label>
	        </div>
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword6" value="자기주도적"/>
	            <label for="keyword6" style="font-weight:300px;">자기주도적</label>
	        </div>
	    </div>
	    <div class="row">
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword7" value="강의식 수업"/>
	            <label for="keyword7" style="font-weight:300px;">강의식 수업</label>
	        </div>
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword8" value="입시 대비"/>
	            <label for="keyword8" style="font-weight:300px;">입시 대비</label>
	        </div>
	        <div class="col-md-4">
	            <form:checkbox path="academyKeyword5" name="academyKeyword" id="keyword9" value="재밌는 수업"/>
	            <label for="keyword9" style="font-weight:300px;">재밌는 수업</label>
	        </div>
	    </div>
	</div>

    <br />
    <div class="input_group">
       <span>
           <input type="submit" class="myButton" value="회원가입" id="submit-btn"/>
           <input type="reset" value="다시작성" class="myButton" id="reset-btn"/>
       </span>
    </div>
    <br />
    </form:form>

    <!-- ======= Contact Section ======= -->

  </main><!-- End #main -->

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
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>

    <div class="container footer-bottom clearfix">
      <div class="copyright">
        &copy; Copyright <strong><span>MyEduMySelect</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/include/assets/vendor/aos/aos.js"></script>
  <script src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/include/academy/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/academy/academyJoin.js"></script>
  <script src="/resources/include/academy/common.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/assets/js/academy.js"></script>
  

</body>

</html>