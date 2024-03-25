<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: MyEduMySelect
  * Updated: Jan 29 2024 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/MyEduMySelect-free-bootstrap-html-template-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/assets/css/join.css" rel="stylesheet">

	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>JOIN</h1>
					<h2>MyEduMySelect에 가입하여<br>더 많은 서비스를 누려 보세요!</h2>
					
					<br>
					<div class="desc">
						<p>MyEduMySelect는 두 종류의 회원으로 이용 가능합니다.
						<br>당신에게 맞는 회원 유형을 선택하세요.</p><br>
						<ul>
							<li><strong>&nbsp개인회원&nbsp</strong>
								<br>&nbsp개인적인 학습 및 성장을 추구하는 분들을 위한 회원 유형입니다.</li>
							<br>
							<li><strong>&nbsp학원회원&nbsp</strong>
								<br>&nbsp학원 또는 교육기관에 소속되어 있는 분들을 위한 회원 유형입니다.</li>
						</ul>
					</div>
					


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

	<!-------------------------------------- 여기부터 회원가입 입력란 시작-------------------------------------------->
	<section>
		<form>
		  <div class="container" style="padding-top: 1rem;">
		  		<div class="section-title">
		  			<h2>개인정보 취급방침 동의</h2>
		  		</div>
		        
		        <span style="font-size: 1rem; color: blue;">* 아래 약관에 동의 후 이용 가능합니다.</span>
		        <div style="padding-top: 1rem;">
		            <textarea id="privacy_scroll" style="resize: none; width: 100%; height: 20rem; padding: 0.5rem;" readonly>
개인정보 취급방침

MyEduMySelect는 사용자의 개인정보를 매우 중요하게 생각하며, 이에 대한 보호 및 안전성 확보를 위해 최선을 다하고 있습니다. 
개인정보 취급방침은 다음과 같은 내용을 포함하고 있습니다.

[수집하는 개인정보의 항목 및 수집방법]
- 이용자로부터 직접 수집하는 정보: 이름, 전화번호, 이메일 주소 등
- 서비스 이용과정에서 자동으로 수집되는 정보: IP 주소, 쿠키, 서비스 이용기록 등
  (온라인 폼, 이메일, 서비스 이용, 이벤트 응모 등을 통해 개인정보를 수집할 수 있습니다.)

[개인정보의 이용 목적]
- 서비스 제공, 운영, 개선
- 고객상담 및 민원처리
- 마케팅 및 광고에의 활용
- 법령 및 이용약관에 따른 의무의 이행
- 개인정보의 보유 및 이용 기간
이용자가 회원가입을 탈퇴하는 경우 또는 회원의 요청에 따라 개인정보를 파기할 때까지 보유 및 이용됩니다.
다만, 관련 법령에서 정하는 바에 따라 일정 기간 동안 보존될 수 있습니다.

[개인정보의 제3자 제공]
사용자의 개인정보는 원칙적으로 외부에 제공되지 않습니다.
다만, 이용자의 동의가 있는 경우 또는 법령에 의해 요구되는 경우를 제외하고는 해당되지 않습니다.

[개인정보의 안전성 확보 조치]
개인정보 보호를 위해 다음과 같은 기술적, 관리적, 물리적 조치를 취하고 있습니다.
- 암호화 통신
- 접근 제한
- 보안 프로그램 설치 및 주기적인 점검
- 개인정보의 열람, 정정 및 삭제
이용자는 언제든지 자신의 개인정보를 열람, 정정하거나 삭제할 수 있습니다.
이를 위해서는 서비스 내의 개인정보 관리 기능을 이용하거나 개인정보 보호 담당자에게 문의하시기 바랍니다.

[개인정보 관련 문의 및 불만 처리]
개인정보 관련 문의 및 불만 사항은 서비스 내 고객센터를 통해 신속하고 정확하게 처리될 수 있도록 최선을 다하겠습니다.

[개인정보 취급방침의 변경]
개인정보 취급방침은 법령이나 서비스의 변경사항에 따라 수시로 변경될 수 있습니다.
변경된 개인정보 취급방침은 서비스 내 공지사항을 통해 공지될 예정입니다.
		            </textarea>
		        </div>
		        <div style="width: 100%; text-align: center; margin: 1rem 0;">
		            <br><p><b>개인정보 취급방침에 동의하십니까?</b></p>
		            <div class="radio-wrapper">
		                <label style="margin-left: 0.5rem; color: black;">
		                    <input type="radio" name="privacy" value="agree" checked> 동의함
		                </label>&nbsp;&nbsp;&nbsp;
		                <label style="margin-left: 0.5rem; color: black;">
		                    <input type="radio" name="privacy" value="disagree"> 동의하지 않음
		                </label>
		            </div>
		        </div>
	         
			     <!-- 버튼 컨테이너 추가 -->
				 <div class="button-container">
				 	<button type="button" id="personalJoin" onclick="window.location.href='/personal/join'">개인 회원가입 페이지로 이동</button>
				 	<button type="button" id="academyJoin" onclick="window.location.href='/academy/join'">학원 회원가입 페이지로 이동</button>
				</div>
		    </div>
	    </form>
    </section>


	<!-------------------------------------------- 회원가입 입력란 끝 ---------------------------------------------->

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
	<script src="/resources/include/academy/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/assets/js/main.js"></script>
	<script src="/resources/include/personal/join.js"></script>
	
	<!-- 약관 미동의에 대한 제어 -->
	<script>
		document.addEventListener("DOMContentLoaded", function() {
		    // 개인정보 취급방침 동의 여부 확인
		    var agreeButton = document.querySelector("input[name='privacy'][value='agree']");
		    var disagreeButton = document.querySelector("input[name='privacy'][value='disagree']");
		    var personalJoinButton = document.getElementById("personalJoin");
		    var academyJoinButton = document.getElementById("academyJoin");
	
		    agreeButton.addEventListener("change", function() {
		        if (this.checked) {
		            personalJoinButton.disabled = false;
		            academyJoinButton.disabled = false;
		        }
		    });
	
		    disagreeButton.addEventListener("change", function() {
		        if (this.checked) {
		            personalJoinButton.disabled = true;
		            academyJoinButton.disabled = true;
		            alert("약관에 동의하지 않으시면 서비스 이용이 불가합니다.");
		        }
		    });
		});	
	</script>
</body>
</html>