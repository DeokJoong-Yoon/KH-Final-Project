<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">


  <!-- Template Main CSS File -->
  <link href="/resources/include/assets/css/style.css" rel="stylesheet">
  <link href="/resources/include/assets/css/login.css" rel="stylesheet">


  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
   
   <div class="container">
         <div class="row"> 
			<c:if test="${empty academyLogin}">
				<div class="loginClass col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
					<h1>ACADEMY LOGIN</h1>
					<h2>학원 회원이신가요?</h2>
				</div>
				
				<div class="loginZone"  data-aos="fade-up" data-aos-delay="200">
					<form id="loginForm">
						<input type="hidden" name="memberTypeId" id="memberTypeId" value="1">
							<table>
								<tr>
									<th><label for="academyId">아이디</label></th>
									<td><input type="text" name="academyId" id="academyId" placeholder="아이디를 입력해 주세요"></td>
								</tr>
								<tr>
									<th><label for="academyPasswd">비밀번호</label></th>
									<td><input type="password" name="academyPasswd" id="academyPasswd" placeholder="비밀번호를 입력해 주세요"></td>
								</tr>
							</table>
							<button type="button" id="loginBtn">로그인</button>
						</form><br/>
						
						<div class="buttons">
							<form action="/useraccount/join" id="joinForm">
								<button class="join-button" type="submit">회원가입 하러 가기</button>
							</form>
		
							<form action="/" class="homeForm">
								<button class="home-button" type="submit">홈으로 가기</button>
							</form>
						</div>
					</div>
					<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
						data-aos-delay="200">
						<img src="/resources/include/assets/img/hero-img.png"
							class="img-fluid animated" alt="">
					</div>
				</c:if>

				<c:if test="${not empty academyLogin}">
					<div >
						<h2>MyEduMySelect</h2>
						<h1>${academyLogin.academyName} 님 환영합니다.</h1> <br>
						<div class="buttons">
							<form action="${pageContext.request.contextPath}/academy/logout" method="POST">
								<button type="submit" id="logoutBtn">로그아웃</button>
							</form>
							<form action="/" class="homeForm">
								<button class="home-button" type="submit">홈으로 가기</button>
							</form>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

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
  <script src="/resources/include/academy/common.js"></script>
  <script src="/resources/include/academy/academyLogin.js"></script>  
  <script src="/resources/include/assets/js/main.js"></script>
  <!-- <script src="/resources/include/academy/academyLogin.js"></script> -->

	<!-- <script>
      $(function() {
          $("#loginBtn").on("click", function() {      
              if (!chkData("#academyId","아이디를")) return;
              else if (!chkData("#academyPasswd","비밀번호를")) return;
              else {          
                  $("#loginForm").attr({
                      "method":"post", 
                      "action":"/academy/login"      
                  });  // 로그아웃 처리
                  @PostMapping("/academy/logout")
                  public String logout(SessionStatus sessionStatus) {
               	   log.info("로그아웃 처리");
               	   sessionStatus.setComplete();
               	   return "redirect:/academy/login";
                  }                   
                  $("#loginForm").submit();      
              }
          });
          
          $("#logoutBtn").on("click", function() {
              location.href = "/academy/logout"
          });
      });
    </script> -->

	<script>
       window.onload = function() {
           var confirmMessage = "${confirmMessage}";
           if (confirmMessage) {
               alert(confirmMessage);
           }
       };
    </script>

	<script>
     window.onload = function() {
        var confirmMessage = "${confirmMessage}";
        if (confirmMessage) {
           var result = confirm(confirmMessage);
           if(result) {
              window.location.href = "/"; // 확인 눌렀을 경우 로그인 페이지로 이동
           } else {
              window.location.href = "/";
           }
        }
     };
  </script>

	<script>
    $(function() {
        let errorMsg = "${errorMsg}";
        if(errorMsg) {
            alert(errorMsg);
            errorMsg = "";
        }
    });
    
    $(function() {
        if (${not empty academyLogin}) {           
            let academyManagerName = "${academyLogin.academyManagerName}";
            alert("환영합니다! ${academyLogin.academyName}님 MyEduMySelect 입니다");
        }
    });

</script>
   
</body>

</html>