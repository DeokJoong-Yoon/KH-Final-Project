<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>			
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>					
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
<link href="/resources/include/board/advertise/css/advertiseDetail.css" rel="stylesheet">
  <!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  


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

  <!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="common_no" name="common_no" />
				</form>

				<div class="col-12 text-center banner">
		            홍보 게시판<br/>
		            <div class="descBox">
		            	학원 홍보게시판입니다.<br>
		            	정보 얻어 가세요!
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->



	<!-- ======= 홍보게시판 상세 보기 ======= -->
  <main id="main">
 
    
    <section class="form">
     
      <div class="container">
      
      	<form name="formData" id="formData">
      		<input type="hidden" name="commonNo" id="commonNo" value="${detail.commonNo }"/>
      		<%-- <input type="hidden" name="fileVO" id="fileVO" value='${JSON.stringify(detail.fileVO)}' /> --%>
      		<p>${detail.fileVO }</p>
      	</form>
      
      	<div class="userId">${userId }</div>
      	
		<div class="advDetail">
			<table>
				<tr>
					<th>글 번호</th>
					<td>${detail.commonNo}</td>
				</tr>
				<tr>
					<th>학원명</th>
					<td>${detail.commonNickname}</td>
				</tr>
				<tr>
					<th>등록 일시</th>
					<td>${detail.commonRegisterDate }</td>
				</tr>
			</table>
			<br>
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${detail.commonTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${detail.commonContent }</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<c:forEach var="file" items="${detail.fileVO }">
								<img src="${file.filePath}" alt="이미지">
							</c:forEach>
						</td>
					</tr>
				</tbody>	
			</table>
			
			
			<div id="likeButton">
		        <img id="likeImage" src="/uploadStorage/like/likeNo.png">
		        <p id="likeMsg"></p>
		    </div>
			
			
			
		</div>

		
		<div class="detailButtons">
      		<button type="button" id="editPost">수정</button>
      		<button type="button" id="deletePost">삭제</button>
      		<button type="button" id="prevPost">이전글</button>
      		<button type="button" id="nextPost">다음글</button>
      		<button type="button" id="gotoList">목록</button>
      	</div>
      </div>
    </section><!-- 매칭게시판 상세보기 끝 -->
    
    
    
   
    
	
  
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>MyEduMySelect</h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
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
  <script src="/resources/include/js/common.js"></script>
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/board/advertise/js/advertiseDetail.js"></script>
  
 
	
	<script type="text/javascript">
        $(document).ready(function() {
        	
        	let commonNo = ${detail.commonNo};
        	
            // 페이지 로딩 시 getLike 실행
            $.ajax({
                type: "POST",
                url: "/like/get",
                data: JSON.stringify({
                			commonNo: commonNo,
                			likeMemberId : 'aaa111'
                		}),
             	headers : {"Content-Type" : "application/json"},
                dataType: "text",
                success: function(status) {
                    // 결과값에 따라 이미지 변경
                    if (status == 0) {
                    	$("#likeMsg").text("이 학원을 찜할까요?");
                    	$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    	$("#likeImage").on("click", function(){
                    		$.ajax({
                    			type: "post",
                    			url: "/like/insert",
                    			data: JSON.stringify({
                        			commonNo: commonNo,
                        			likeMemberId : 'aaa111'
                        		}),
                        		contentType: "application/json; charset=utf-8",
                                dataType: "text",
                                success: function(){
                                	$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                                	location.reload();
                                	alert("이 학원을 찜했습니다!");
                                },
                        		error: function(){
                        			alert("insert 실패");
                        		}
                    		})
                    	})
                    } else {
                    	if(status == 1) {
                    		$("#likeMsg").text("찜한 학원입니다.");
                    		$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                    		$("#likeImage").on("click", function(){
                        		$.ajax({
                        			type: "post",
                        			url: "/like/toggle",
                        			data: JSON.stringify({
                            			commonNo: commonNo,
                            			likeMemberId : 'aaa111'
                            		}),
                            		contentType: "application/json; charset=utf-8",
                                    dataType: "text",
                                    success: function(){
                                    	$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                                    	alert("찜을 취소했습니다.");
                                    	location.reload();
                                    },
                            		error: function(){
                            			alert("update 실패");
                            		}
                        		})
                        	})
                    	} else {
                    		$("#likeMsg").text("이 학원을 찜할까요?");
                    		$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    		$("#likeImage").on("click", function(){
                        		$.ajax({
                        			type: "post",
                        			url: "/like/toggle",
                        			data: JSON.stringify({
                            			commonNo: commonNo,
                            			likeMemberId : 'aaa111'
                            		}),
                            		contentType: "application/json; charset=utf-8",
                                    dataType: "text",
                                    success: function(){
                                    	$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                                    	location.reload();
                                    	alert("이 학원을 찜했습니다!");
                                    },
                            		error: function(){
                            			alert("update 실패");
                            		}
                        		})
                        	})
                    	}
                    }
                },
                error: function(){
                	alert("getLike 실패");
                }
            });
        });

        
        //삭제 시 팝업
		$(function() {
			let popUp = "${popUp}";
			if (popUp != "") {
				alert(popUp);
			}
			
		});
		
    </script>
	
</body>

</html>