<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>								
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>MyEduMySelect </title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/include/assets/img/favicon.png" rel="icon">
  <link href="/resources/include/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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

      <h1 class="logo me-auto"><a href="index.html">MyEdu<br />MySelect</a></h1>
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
              <li><a href="#">마이페이지</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <li><a class="getstarted scrollto" href="#about">로그인/회원가입</a></li>
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
    <form name="join" id="join">
        <div class="input_group">
            <label>아이디</label>
            <input type="text" name="academy_id" id="academy_id" placeholder="아이디 입력"/><br />
            <button id="check-duplicate">중복체크</button>
            <label class="require">(아이디는 6~12자의 영문, 숫자만 사용 가능) </label>             
        </div>
        <br />
        <div id="duplicate-message"></div>
    
        <div class="input_group">
            <label>비밀번호</label>
            <input type="password" name="academy_passwd" id="academy_passwd" placeholder="비밀번호 입력"/><br />
            <label class="require">(최소 하나의 대문자/소문자/숫자/특수문자 포함  8~20자 이내로 입력) </label>
        </div>
        <br />
        <div class="input_group">
            <label>비밀번호 확인</label>
            <input type="password" name="academy_passwd2" id="academy_passwd2"/>
        </div>
        <br />
        <div class="input_group">
            <label>사업자 등록번호</label>
            <input type="text" name="academy_number" id="academy_number"/>
        </div>
        <br />
        <div class="input_group">
            <label>담당자 이름</label>
            <input type="text" name="academy_manager_name" id="academy_manager_name"/>
        </div>
        <br />        
        <div class="input_group">
            <label>담당자 이메일</label>
            <input type="text" name="academy_manager_email" id="academy_manager_email"/> 
            <strong>@</strong>
            <input class="box" id="domain-txt" type="text"/>
            <select class="box" id="domain-list">
              <option value="naver.com">naver.com</option>
              <option value="google.com">google.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="nate.com">nate.com</option>
              <option value="kakao.com">kakao.com</option>
              <option value="custom">직접입력</option>
            </select>
        </div>
        <br />
        <div class="input_group">
            <label>담당자 전화번호</label>
            <input type="text" name="academy_manager_phone"  id="academy_manager_phone" maxlength="11" placeholder="(-)하이폰 기호 없이 입력해주세요." required>            
        </div>
        <br />
        <div class="input_group">
            <label>학원명</label>
            <input type="text" name="academy_name" id="academy_name"/>
        </div>
        <br />
        <div class="input_group">
            <label>학원주소</label>
            <input type="text" name="academy_address" id="academy_address"/>
        </div>
        <br />
        <div class="input_group">
            <label>학원 전화번호</label>
            <input type="text" name="academy_phone"  id="academy_phone" maxlength="11" placeholder="(-)하이폰 기호 없이 입력해주세요." required>            
        </div>
        <br />
        <div class="input_group">
            <label>교습과목</label>
            <input type="text" name="academy_target_subject"  id="academy_target_subject" maxlength="20" placeholder="교습과목을 입력해주세요" required>            
        </div>
        <br />
        <div class="input_group">
		    <label>수강료</label>
		    <br>
		    <input type="radio" id="fee1" name="academy_fee" value="10만원 미만">
		    <label for="fee1">10만원 미만</label><br>
		    
		    <input type="radio" id="fee2" name="academy_fee" value="10만원 이상 20만원 미만">
		    <label for="fee2">10만원 이상 20만원 미만</label><br>
		    
		    <input type="radio" id="fee3" name="academy_fee" value="20만원 이상 30만원 미만">
		    <label for="fee3">20만원 이상 30만원 미만</label><br>
		    
		    <input type="radio" id="fee4" name="academy_fee" value="30만원 이상 40만원 미만">
		    <label for="fee4">30만원 이상 40만원 미만</label><br>
		    
		    <input type="radio" id="fee5" name="academy_fee" value="40만원 이상 50만원 미만">
		    <label for="fee5">40만원 이상 50만원 미만</label><br>
		    
		    <input type="radio" id="fee6" name="academy_fee" value="50만원 이상">
		    <label for="fee6">50만원 이상</label><br>
		</div>        
        <br />
        <div class="input_group">
		    <label>대상 학년</label>
		    <br>
		    <input type="radio" id="grade1" name="academy_target_grade" value="미취학">
            <label for="grade1">미취학</label><br>
            
            <input type="radio" id="grade2" name="academy_target_grade" value="초등저학년">
            <label for="grade2">초등저학년</label><br>
            
            <input type="radio" id="grade3" name="academy_target_grade" value="초등고학년">
            <label for="grade3">초등고학년</label><br>
            
            <input type="radio" id="grade4" name="academy_target_grade" value="중등">
            <label for="grade4">중등</label><br>
            
            <input type="radio" id="grade5" name="academy_target_grade" value="고등">
            <label for="grade5">고등</label><br>
            
            <input type="radio" id="grade6" name="academy_target_grade" value="성인">
            <label for="grade6">성인</label><br>
		</div>        
        <br />
        <div class="input_group">
            <label>키워드 선택</label>
            <br>
            <input type="checkbox" id="basic" name=academy_keyword value="기초부터">
            <label for="basic">기초부터</label><br>
            
            <input type="checkbox" id="intermediate" name="academy_keyword" value="중급반">
            <label for="intermediate">중급반</label><br>
            
            <input type="checkbox" id="advanced" name="academy_keyword" value="심화과정">
            <label for="advanced">심화과정</label><br>
            
            <input type="checkbox" id="attribute" name="academy_keyword" value="속성강의">
            <label for="attribute">속성강의</label><br>
            
            <input type="checkbox" id="thorough" name="academy_keyword" value="꼼꼼한 관리">
            <label for="thorough">꼼꼼한 관리</label><br>
        </div>
        <br>
        <p>최소 1개 이상 선택, 중복 선택 가능</p>
		<br />            
        <div class="input_group">
            <span>
                <input type="submit" value="회원가입" class="myButton"/>
                <input type="reset" value="다시작성" class="myButton"/>
            </span>
        </div>
        <br />
        
    </form>
    <form action="/completeSignUp">
        <button type="submit">회원가입 완료 페이지로 이동</button>
    </form>

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
  <!-- <script src="/resources/include/assets/js/main.js"></script> -->
  <script src="/resources/include/assets/js/academy.js"></script>
  		
</body>

</html>