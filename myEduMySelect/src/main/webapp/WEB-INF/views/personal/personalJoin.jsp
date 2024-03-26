<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<!DOCTYPE html>
<html lang="kr">

<link rel="stylesheet" type="text/css"
	href="/resources/include/personal/css/personalJoin.css">

<script src="/resources/include/personal/joinForm.js"></script>



 
<!-- ======= Hero Section ======= -->
<section class="mcHero d-flex align-items-center">

	<div class="container">
		<div class="row">
			<div class="col-12 text-center mcBanner">
				개인 회원가입<br />
			</div>
		</div>
	</div>
</section>
<!-- End Hero -->

<!-- ======= 회원가입 폼 ======= -->
<section class="joinForm">
	<div class="container">

		<form id="f_joinForm">
			<table>
				<tr>
					<th><label for="personalId">아이디</label></th>
					<td><input type="text" name="personalId" id="personalId"
						placeholder="아이디 입력" required />
						<button type="button" onclick="checkId()">중복확인</button></td>
				</tr>
				<tr>
					<th><label for="personalName">이름</label></th>
					<td><input type="text" name="personalName" id="personalName"
						placeholder="이름 입력" required /></td>
				</tr>
				<tr>
					<th><label for="personalPasswd">비밀번호</label></th>
					<td><input type="password" name="personalPasswd"
						id="personalPasswd" placeholder="비밀번호 입력" required /></td>
				</tr>
				<tr>
					<th><label for="personalPasswdConfirm">비밀번호 확인</label></th>
					<td><input type="password" name="personalPasswdConfirm"
						id="personalPasswdConfirm" placeholder="비밀번호 확인" required /></td>
				</tr>
				<tr>
					<th><label for="personalEmail">이메일</label></th>
					<td><input type="text" id="personalEmail" name="personalEmail"
						placeholder="이메일 입력" required />
						<button type="button" onclick="checkEmail()">중복확인</button></td>
				</tr>
				<tr>
					<th><label for="personalBirth">생년월일</label></th>
					<td><input type="text" id="personalBirth" name="personalBirth"
						placeholder="생년월일 입력" required /></td>
				</tr>
				<tr>
					<th><label for="personalAddress">주소</label></th>
					<td><input type="text" id="personal_post"
						name="personalAddress" placeholder="우편번호" readonly required>
						<input type="text" id="personal_addr" name="personalAddress"
						placeholder="주소" readonly required>
						<button type="button" name="personalAddress" onclick="findAddr()">주소찾기</button>
						<br> <input type="text" id="personalAddress"
						name="personalAddress" placeholder="상세주소입력" required /></td>
				</tr>
				<tr>
					<th><label for="personalPhone">전화번호</label></th>
					<td><input type="text" id="personalPhone" name="personalPhone"
						placeholder="전화번호 입력" required /></td>
				</tr>
			</table>
			<input type="reset" id="resetBtn" value="다시작성">
		</form>

		<div class="text-end">

			<button type="button" id="personalInsertBtn">가입하기</button>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							console.log(data);

							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var jibunAddr = data.jibunAddress; // 지번 주소 변수
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('personal_post').value = data.zonecode;
							if (roadAddr !== '') {
								document.getElementById("personal_addr").value = roadAddr;
							} else if (jibunAddr !== '') {
								document.getElementById("personal_addr").value = jibunAddr;
							}
						}
					}).open();
		}
	</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>











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
<script src="/resources/include/assets/js/main.js"></script>

</body>
</html>
