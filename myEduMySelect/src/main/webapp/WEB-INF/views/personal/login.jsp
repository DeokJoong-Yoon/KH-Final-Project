<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!DOCTYPE html>
<html lang="kr">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/assets/css/login.css" rel="stylesheet">


<!-- ======= Hero Section ======= -->
<section id="hero" class="d-flex align-items-center">

	<div class="container">
		<div class="row">
			<c:if test="${empty personalLogin}">
				<div
					class="loginClass col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>PERSONAL LOGIN</h1>
					<h2>개인 회원이신가요?</h2>
				</div>

				<div class="loginZone" data-aos="fade-up" data-aos-delay="200">
					<form id="loginForm">
						<input type="hidden" name="memberTypeId" id="memberTypeId"
							value="1">
						<table>
							<tr>
								<th><label for="personalId">아이디</label></th>
								<td><input type="text" name="personalId" id="personalId"
									placeholder="아이디를 입력해 주세요"></td>
							</tr>
							<tr>
								<th><label for="personalPasswd">비밀번호</label></th>
								<td><input type="password" name="personalPasswd"
									id="personalPasswd" placeholder="비밀번호를 입력해 주세요"></td>
							</tr>
						</table>
						<button type="button" id="loginBtn">로그인</button>
					</form>
					<br>

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

			<c:if test="${not empty personalLogin}">
				<div>
					<h2>MyEduMySelect</h2>
					<h1>${personalLogin.personalName}님 환영합니다.</h1>
					<br>
					<div class="buttons">
						<button type="button" id="logoutBtn">로그아웃</button>
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

<script src="/resources/include/personal/jquery-3.7.1.min.js"></script>
<script src="/resources/include/personal/common.js"></script>
<script src="/resources/include/personal/personalLogin.js"></script>
<script src="/resources/include/assets/js/main.js"></script>

<script>
	    $(function() {
	        let errorMsg = "${errorMsg}";
	        if(errorMsg) {
	            alert(errorMsg);
	            errorMsg = "";
	        }
	    });
	    
	    $(function() {
	        
	        if (${not empty personalLogin}) {
	           
	            let personalName = "${personalLogin.personalName}";
	
	         
	            alert("환영합니다! ${personalLogin.personalName}님 MyEduMySelect 입니다");
	        }
	    });
	    
	</script>

</body>
</html>
