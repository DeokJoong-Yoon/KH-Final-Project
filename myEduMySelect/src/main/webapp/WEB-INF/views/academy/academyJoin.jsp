<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" type="text/css" href="/resources/include/assets/css/join.css">





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
	              <li><a href="/free/freeList">자유게시판</a></li>
	            <li><a href="#">홍보게시판</a></li>
	            <li><a href="/matching/">매칭게시판</a></li>
	            <li><a href="/notice/boardList">공지게시판</a></li>
	            <c:if test="${personalLogin.memberTypeId == 1}">
	               <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">개인회원 마이페이지</a></li>
	            </c:if>
	            <c:if test="${academyLogin.memberTypeId == 2}">
	               <li><a href="${pageContext.request.contextPath}/academy/mypage" id="mypageBtn">학원회원 마이페이지</a></li>
	            </c:if>
	            </ul>
	          </li>
	          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
	          <c:choose>
	          <c:when test="${not empty personalLogin}">
	              <li><a class="nav-link scrollto">[개인]&nbsp&nbsp${personalLogin.personalName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:when test="${not empty academyLogin}">
	              <li><a class="nav-link scrollto">[학원]&nbsp&nbsp${academyLogin.academyName}님 환영합니다.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/academy/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">로그아웃</button>
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
  	</header>
   <!-- End Header -->
   <!-- ======= Hero Section ======= -->
   <section id="hero" class="d-flex align-items-center">

      <div class="container">
         <div class="row">
            <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
               <h1>개인회원 가입</h1>
               <h2></h2>
            </div>
            <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
               <img src="/resources/include/assets/img/hero-img.png" class="img-fluid animated" alt="">
            </div>
         </div>
      </div>
   </section>
   <!-- End Hero -->


   <div class="container">
      <div class="text-center">
         <h3>회원가입</h3>
      </div>

     <form name="a_joinForm" id="a_joinForm" method="POST" action="academyInsert">

         <div class="mb-3 row">
            <label for="academyId" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-sm-8">
               <input type="text" name="academyId" id="academyId" maxlength="12" class="form-control" placeholder="아이디 입력" required />
            </div>
            <div class="col-sm-2">           	
                <button id="checkDuplicateBtn" class="duplicate-check">중복체크</button>        
        	    <div id="duplicate-message"></div>
                <!-- <a class="btn btn-primary" onclick="checkId()" id="checkId">중복확인</a> -->
            </div>
         </div>

         <div class="mb-3 row">
            <label for="academyPasswd" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-sm-8">
               <input type="password" name="academyPasswd" id="academyPasswd" class="form-control" maxlength="20" placeholder="비밀번호 입력" required />
            </div>
         </div>

         <div class="mb-3 row">
            <label for="academyPasswd2" class="col-sm-2 col-form-label">비밀번호 확인</label>
            <div class="col-sm-8">
               <input type="password" name="academyPasswd2" id="academyPasswd2" class="form-control" maxlength="20" required />
               <span id="password-check-message"></span>
            </div>
         </div>
         
         <div class="mb-3 row">
            <label for="academyNumber" class="col-sm-2 col-form-label">사업자 등록번호</label>
            <div class="col-sm-8">
               <input type="text" name="academyNumber" id="academyNumber" class="form-control" maxlength="10" placeholder="(-) 하이픈 기호를 제외하고 입력 후 검색 버튼을 눌러주세요" required />
            </div>
            <div class="col-sm-2">            	
                <button id="searchDuplicateBtn" class="duplicate-check">검색</button>
        		<div id="search-message"></div>
                <!-- <a id="searchNumber" class="btn btn-primary">검색</a> -->
            </div>
         </div>
         
         <div class="mb-3 row">
            <label for="academyManagerName" class="col-sm-2 col-form-label">담당자 이름</label>
            <div class="col-sm-8">
               <input type="text" name="academyManagerName" id="academyManagerName" class="form-control" maxlength="20" required />
            </div>            
         </div>
         
         <!-- 이메일 한 박스로 수정해야함 -->
         <div class="mb-3 row">
            <label for="academyManagerEmail" class="col-sm-2 col-form-label">담당자 이메일</label>
            <div class="col-sm-8">            	
                <input type="text" name="academyManagerEmail" id="academyManagerEmail" class="form-control"/>                
		        <button id="emailCheckBtn" class="emailCheck">중복체크</button>
		        <br/>
		        <div id="email-check-message"></div>
            </div>
         </div>         
         
         <div class="mb-3 row">
            <label for="academyManagerPhone" class="col-sm-2 col-form-label">담당자 전화번호</label>
            <div class="col-sm-8">
               <input type="text" name="academyManagerPhone" id="academyManagerPhone" class="form-control" maxlength="11" placeholder="(-) 하이픈 기호를 제외하고 입력해주세요." required />
            </div>            
         </div>
         
         <div class="mb-3 row">
            <label for="academyName" class="col-sm-2 col-form-label">학원명</label>
            <div class="col-sm-8">
               <input type="text" name="academyName" id="academyName" class="form-control" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
            </div>            
         </div>
         
         <div class="mb-3 row">
            <label for="academyGuAddress" class="col-sm-2 col-form-label">학원주소</label>
            <div>
               <label for="academyGuAddress">행정구역명</label>
               <div class="col-sm-8">
                  <input type="text" name="academyGuAddress" id="academyGuAddress" class="form-control" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
               </div>
               <label for="academyRoadAddress">도로명주소</label>
               <div class="col-sm-8">
                  <input type="text" name="academyRoadAddress" id="academyRoadAddress" class="form-control" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
               </div>
               <label for="academyDongAddress">상세주소</label>
               <div class="col-sm-8">
                  <input type="text" name="academyDongAddress" id="academyDongAddress" class="form-control" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
               </div>
            </div>                        
         </div>
         
         <div class="mb-3 row">
            <label for="academyPhone" class="col-sm-2 col-form-label">학원 전화번호</label>
            <div class="col-sm-8">
               <input type="text" name="academyPhone" id="academyPhone" class="form-control" maxlength="11" placeholder="(-)하이폰 기호 없이 입력해주세요." required/>
            </div>            
         </div>
         
         <div class="mb-3 row">
            <label for="academyTargetSubject" class="col-sm-2 col-form-label">교습과목</label>
            <div class="col-sm-8">
               <input type="text" name="academyTargetSubject" id="academyTargetSubject" class="form-control" maxlength="20" placeholder="교습과목을 입력해주세요" required/>
            </div>            
         </div>
         
         <div class="mb-3 row">
            <label for="academyFee" class="col-sm-2 col-form-label">수강료</label>
            <div>
               <div>
                  <input type="radio" name="academyFee" id="fee1">
                  <label for="fee1">10만원 미만</label>
               </div>
               <div>
                  <input type="radio" name="academyFee" id="fee2">
                  <label for="fee2">10만원 이상 20만원 미만</label>
               </div>
               <div>
                  <input type="radio" name="academyFee" id="fee3">
                  <label for="fee3">20만원 이상 30만원 미만</label>
               </div>
               <br />
               <div>
                  <input type="radio" name="academyFee" id="fee4">
                  <label for="fee4">30만원 이상 40만원 미만</label>
               </div>
               <div>
                  <input type="radio" name="academyFee" id="fee5">
                  <label for="fee5">40만원 이상 50만원 미만</label>
               </div>
               <div>
                  <input type="radio" name="academyFee" id="fee6">
                  <label for="fee6">50만원 이상</label>
               </div>   
            </div>               
         </div>
         
         <div class="mb-3 row">
            <label for="academyTargetGrade" class="col-sm-2 col-form-label">대상 학년</label>
            <div>
               <div>
                  <input type="radio" name="academyTargetGrade" id="grade1">
                  <label for="grade1">미취학</label>
               </div>
               <div>
                  <input type="radio" name="academyTargetGrade" id="grade2">
                  <label for="grade2">초등저학년</label>
               </div>
               <div>
                  <input type="radio" name="academyTargetGrade" id="grade3">
                  <label for="grade3">초등고학년</label>
               </div>
               <br />
               <div>
                  <input type="radio" name="academyTargetGrade" id="grade4">
                  <label for="grade4">중등</label>
               </div>
               <div>
                  <input type="radio" name="academyTargetGrade" id="grade5">
                  <label for="grade5">고등</label>
               </div>
               <div>
                  <input type="radio" name="academyTargetGrade" id="grade6">
                  <label for="grade6">성인</label>
               </div>   
            </div>               
         </div>
         
       <div class="mb-3 row">
	    <label for="academyKeyword1" class="col-sm-2 col-form-label">키워드</label>
		    <div>
		        <div>
		            <input type="checkBox" name="academyKeyword1" id="keyword1" class="keyword-checkbox">
		            <label for="keyword1">기초부터</label>
		        </div>
		        <div>
		            <input type="checkBox" name="academyKeyword2" id="keyword2" class="keyword-checkbox">
		            <label for="keyword2">심화수업</label>
		        </div>
		        <div>
		            <input type="checkBox" name="academyKeyword3" id="keyword3" class="keyword-checkbox">
		            <label for="keyword3">친절한 강사</label>
		        </div>
		        <br />
		        <div>
		            <input type="checkBox" name="academyKeyword4" id="keyword4" class="keyword-checkbox">
		            <label for="keyword4">꼼꼼한 관리</label>
		        </div>
		        <div>
		            <input type="checkBox" name="academyKeyword5" id="keyword5" class="keyword-checkbox">
		            <label for="keyword5">숙제 없음</label>
		        </div>
		        <div>
		            <input type="checkBox" name="academyKeyword6" id="keyword6" class="keyword-checkbox">
		            <label for="keyword6">자기주도적</label>
		        </div>
		        <br />
		        <div>
		            <input type="checkBox" name="academyKeyword7" id="keyword7" class="keyword-checkbox">
		            <label for="keyword7">강의식 수업</label>
		        </div>
		        <div>
		            <input type="checkBox" name="academyKeyword8" id="keyword8" class="keyword-checkbox">
		            <label for="keyword8">입시 대비</label>
		        </div>
		        <div>
		            <input type="checkBox" name="academyKeyword9" id="keyword9" class="keyword-checkbox">
		            <label for="keyword9">재밌는 수업</label>
		        </div>               
		    </div>               
		</div>
		
	    <div class="text-end">
			<input type="submit" class="btn btn-primary btn-sm" value="회원가입" id="submit-btn">
			<input type="reset" class="btn btn-primary btn-sm" value="다시작성" id="reset-btn">
		</div>      
    </form>
   </div>
   
   	

  <!-- ======= Contact Section ======= -->

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
  <script src="/resources/include/assets/js/academy.js"></script>
  <script src="/resources/include/academy/academyJoin.js"></script>
  <script src="/resources/include/academy/common.js"></script>  
  <script src="/resources/include/assets/js/main.js"></script>
  
	
	<script>
	$(document).ready(function(){
		$("#academyInsertBtn").click(function(){
			alert("회원가입이 완료되었습니다");
			$("#a_joinForm").attr({
				"method":"post",
				"action":"/academyInsert"
			});
			$("#a_joinForm").submit();
		})
	})
	</script>
		
   <script>
      $(document).ready(function() {
         // 폼 제출 이벤트 핸들러 등록
         $('#emailForm').on('submit', function(event) {
            event.preventDefault(); // 기본 동작 방지
            // 폼이 서버로 전송되지 않도록 방지
         });
      });
   </script>
   
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


</body>

</html>