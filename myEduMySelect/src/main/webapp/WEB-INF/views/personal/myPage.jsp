<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">


<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/personal/css/myPage.css" rel="stylesheet">

	<!-- ======= Hero Section ======= -->
	<section class="mcHero d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div class="col-12 text-center mcBanner">
		            MY PAGE<br/>
		        </div> 
			</div>
		</div>
	</section>
	<!-- End Hero -->


	<!-- 여기서부터 마이페이지 -->
	<section>
		<div id="myPostArea" style="max-width: 600px; margin: auto;">
			<h4>내가 쓴 글 조회</h4>
			<button type="button" id="matchingBtn">매칭게시판에서 내가 쓴 글 목록 보기</button><br/>
			<button type="button" id="freeBtn">자유게시판에서 내가 쓴 글 목록 보기</button>
		</div>
		
		<br/>
		
		<form id="updateForm" action="/personalUpdate" method="POST"
		style="max-width: 600px; margin: auto;">
			
			<h4>개인정보 조회 및 수정</h4>
			<table>
				<tr>
					<th>
						<label for="personalId" >아이디</label>
					</th>
					<td>
						<input type="text" value="${personalLogin.personalId}" id="personalId" name="personalId" disabled />
					</td>
				</tr>
				<tr>
					<th>
						<label for="personalName" >이름</label>
					</th>
					<td>
						<input type="text" value="${personalLogin.personalName}" id="personalName" name="personalName" disabled />
					</td>
				</tr>
				<tr>
					<th>
						<label >비밀번호</label>
					</th>
					<td>
						<button type="button" id="movePwdChange">비밀번호 변경 페이지로 이동</button>
					</td>
				</tr>
				<tr>
					<th>
						<label for="personalEmail">이메일</label>
					</th>
					<td>
						<button type="button" id="changeEmail">이메일 변경</button>
						<input type="email" value="${personalLogin.personalEmail}" id="personalEmail" name="personalEmail" disabled />
						<button type="button" id="duplicateCheckBtn" style="display: none;" onclick="checkEmail()">중복확인</button>
					</td>
				</tr>
				<tr>
					<th>
						<label for="personalBirth">생년월일</label>
					</th>
					<td>
						<input type="text" value="${personalLogin.personalBirth}"
							id="personalBirth" name="personalBirth" disabled>
					</td>
				</tr>
				<tr>
					<th>
						<label for="personalAddress">주소 변경하기</label>
					</th>
					<td>
						<label id="personalAddress">현재 주소</label><br>
						<input type="text" value="${personalLogin.personalAddress}" id="nowAddress" disabled />
						<br/><br/>
						<label id="newAddress">새로운 주소 등록</label>
						<button type="button" onclick="findAddr()">주소찾기</button>
						<input id="personal_post" name="personalAddress" type="text" placeholder="우편번호" readonly style="display: none;" /> 
						<input id="personal_addr" name="personalAddress" type="text" placeholder="주소" readonly style="display: none;" /> 
						<input type="text" id="personalAddressDetail" placeholder="상세주소입력" style="display: none;" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="personalPhone">전화번호</label>
					</th>
					<td>
						<input type="text" value="${personalLogin.personalPhone}"
								onKeyup="this.value=this.value.replace(/[^0-9]/g,'')"
								id="personalPhone" name="personalPhone" maxlength="11"/>
					</td>
				</tr>
			</table>
			
		</form>
		
		<button type="button" id="personalUpdateBtn" >수정하기</button>
		<div id="message" style="text-align: center;"></div>
		
	</section>
	
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
			
					$('#personal_post').css('display', 'block');
					$('#personal_addr').css('display', 'block');
					$('#personalAddressDetail').css('display', 'block');
					$("#nowAddress").val("");
		}
		
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

	<!-- 마이페이지 끝 -->

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
	<script src="/resources/include/personal/jquery-3.7.1.min.js"></script>
	<script src="/resources/include/personal/myPage.js"></script>
	<script src="/resources/include/assets/js/main.js"></script>



</body>

</html> 