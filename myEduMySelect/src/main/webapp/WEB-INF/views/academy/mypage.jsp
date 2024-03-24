<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/academy/css/myPage.css" rel="stylesheet">


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
		<div id="myPostArea" style="max-width: 800px; margin: auto;">
			<h4>내가 쓴 글 조회</h4>
			<button type="button" id="advertiseBtn">홍보 게시판 내가 쓴 글 목록</button><br/>
			<button type="button" id="matchingBtn">매칭 게시판 내가 댓글 단 글 목록</button><br/>
		</div>
		<br/>
		
		<form id="academyUpdateForm" action="/academyUpdate"  method="POST" style="max-width: 800px; margin: auto;">
			<h4>학원 정보 조회 및 수정</h4>
			
			<table>
				<tr>
					<th>
						<label for="academyId">아이디</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyId}" name="academyId" id="academyId" disabled />
					</td>
				</tr>	
				<tr>
					<th>
						<label for="academyPasswd">비밀번호</label>
					</th>
					<td>
						<input type="hidden" name="academyPasswd" id="academyPasswd"/>
						<button type="button" id="changePasswdBtn">비밀번호 변경페이지로 이동</button>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyNumber">사업자 등록번호</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyNumber}" name="academyNumber" id="academyNumber" disabled/>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyManagerName">담당자 이름</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyManagerName}" name="academyManagerName" id="academyManagerName" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyManagerEmail" >이메일</label>
					</th>
					<td>
						<input type="email" value="${academyLogin.academyManagerEmail}" id="academyManagerEmail" name="academyManagerEmail" >
						<button id="emailCheckBtn" class="emailCheck">중복체크</button>
						<div id="email-check-message"></div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyManagerPhone">담당자 전화번호</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyManagerPhone}" maxlength="11" name="academyManagerPhone" id="academyManagerPhone" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyName">학원명</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyName}" name="academyName" id="academyName" disabled />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyGuAddress">학원주소</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyRoadAddress}" name="academyRoadAddress" id="academyRoadAddress" disabled/>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyPhone">학원 전화번호</label>
					</th>
					<td>
						<input type="text" value="${academyLogin.academyPhone}" name="academyPhone" id="academyPhone" maxlength="11" />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyTargetSubject">교습과목</label>
					</th>
					<td>
						<input type="text" id="prevSubject" name="academyTargetSubject" value="${academyLogin.academyTargetSubject}" readonly />
						<button type="button" id="subjectChange">변경하기</button>
						<div id="subjectGroup" style="display: none;">
							<input type="radio" name="academyTargetSubject" id="subject1" value="국어">
							<label for="subject1"> 국어</label>
                          	<input type="radio" name="academyTargetSubject" id="subject2" value="수학">
                          	<label for="subject2"> 수학</label>
                          	<input type="radio" name="academyTargetSubject" id="subject3" value="영어">
                          	<label for="subject3"> 영어</label>
                          	<input type="radio" name="academyTargetSubject" id="subject4" value="컴퓨터">
                          	<label for="subject4"> 컴퓨터</label><br/>
                          	<input type="radio" name="academyTargetSubject" id="subject5" value="논술">
                          	<label for="subject5"> 논술</label>
                          	<input type="radio" name="academyTargetSubject" id="subject6" value="과학">
                          	<label for="subject6"> 과학</label>
                          	<input type="radio" name="academyTargetSubject" id="subject7" value="외국어">
                          	<label for="subject7"> 외국어</label>
                          	<input type="radio" name="academyTargetSubject" id="subject8" value="실용음악">
                          	<label for="subject8"> 실용음악</label><br/>
                          	<input type="radio" name="academyTargetSubject" id="subject9" value="미술">
                          	<label for="subject9"> 미술</label>
                          	<input type="radio" name="academyTargetSubject" id="subject10" value="무용/댄스">
                          	<label for="subject10"> 무용/댄스</label>
                          	<input type="radio" name="academyTargetSubject" id="subject11" value="체육">
                          	<label for="subject11"> 체육</label>
                          	<input type="radio" name="academyTargetSubject" id="subject12" value="악기">
                          	<label for="subject12"> 악기</label><br/>
                          	<input type="radio" name="academyTargetSubject" id="subject13" value="연기/연극">
                          	<label for="subject13"> 연기/연극</label>
                          	<input type="radio" name="academyTargetSubject" id="subject14" value="예체능입시">
                          	<label for="subject14"> 예체능입시</label>
                          	<input type="radio" name="academyTargetSubject" id="subject15" value="고시">
                          	<label for="subject15"> 고시</label><br/>
                          	<input type="radio" name="academyTargetSubject" id="subject16" value="취미">
                          	<label for="subject16"> 취미</label>
                          	<input type="radio" name="academyTargetSubject" id="subject17" value="직업기술">
                          	<label for="subject17"> 직업기술</label>
                          	<input type="radio" name="academyTargetSubject" id="subject18" value="기타">
                          	<label for="subject18"> 기타</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyFee" >수강료</label>	
					</th>
					<td>
						<input type="text" id="prevFee" name="academyFee" value="${academyLogin.academyFee}" readonly /> 
						<button type="button" id="feeChange">변경하기</button>
						<div id="feeGroup" style="display: none;">
							<input type="radio" value="20만원 미만" name="academyFee" id="fee1" />
							<label for="fee1" >20만원 미만</label>
							<input type="radio" value="20만원 이상 30만원 미만" name="academyFee" id="fee2" />
							<label for="fee2" >20만원 이상 30만원 미만</label><br>
							<input type="radio" value="30만원 이상 40만원 미만" name="academyFee" id="fee3" />
							<label for="fee3" >30만원 이상 40만원 미만</label>
							<input type="radio" value="40만원 이상 50만원 미만" name="academyFee" id="fee4" />
							<label for="fee4">40만원 이상 50만원 미만</label><br>
							<input type="radio" value="50만원 이상 60만원 미만" name="academyFee" id="fee5" />
							<label for="fee5">50만원 이상 60만원 미만</label>
							<input type="radio" value="60만원 이상 70만원 미만" name="academyFee" id="fee6" />
							<label for="fee6">60만원 이상 70만원 미만</label><br>
							<input type="radio" value="70만원 이상" name="academyFee" id="fee7" />
							<label for="fee7">70만원 이상</label>
						</div>							
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyTargetGrade" >대상 학년</label>		
					</th>
					<td>
						<input type="text" id="prevAge" name="academyTargetGrade" value="${academyLogin.academyTargetGrade}" readonly /> 
						<button type="button" id="ageChange">변경하기</button>
						<div id="ageGroup" style="display: none;">
							<input type="radio" value="미취학" name="academyTargetGrade" id="grade1" value="미취학"/>
							<label for="grade1">미취학</label>
							<input type="radio" value="초등(저)" name="academyTargetGrade" id="grade2" value="초등저학년"/>
							<label for="grade2">초등(저)</label>
							<input type="radio" value="초등(고)" name="academyTargetGrade" id="grade3" value="초등고학년"/>
							<label for="grade3">초등(고)</label><br>
							<input type="radio" value="중등" name="academyTargetGrade" id="grade4" value="중등"/>
							<label for="grade4">중등</label>
							<input type="radio" value="고등" name="academyTargetGrade" id="grade5" value="고등"/>
							<label for="grade5">고등</label>
							<input type="radio" value="성인" name="academyTargetGrade" id="grade6" value="성인"/>
							<label for="grade6">성인</label>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						 <label for="academyKeyword" >키워드 선택 </label>		
					</th>
					<td>
						<input type="text" id="prevKeyword1" name="prevKeyword" value="${academyLogin.academyKeyword1}" readonly /> 
						<input type="text" id="prevKeyword2" name="prevKeyword" value="${academyLogin.academyKeyword2}" readonly /> 
						<input type="text" id="prevKeyword3" name="prevKeyword" value="${academyLogin.academyKeyword3}" readonly /> 
						<input type="text" id="prevKeyword4" name="prevKeyword" value="${academyLogin.academyKeyword4}" readonly /> 
						<input type="text" id="prevKeyword5" name="prevKeyword" value="${academyLogin.academyKeyword5}" readonly /> 
						<button type="button" id="keywordChange">변경하기</button>
						<div id="keywordGroup" style="display: none;">
				            <input type="checkbox" name="academyKeyword" id="keyword1" value="기초부터" />
				            <label for="keyword1">기초부터</label>
				            <input type="checkbox" name="academyKeyword" id="keyword2" value="심화수업" />
				            <label for="keyword2">심화수업</label>
				            <input type="checkbox" name="academyKeyword" id="keyword3" value="친절한 강사" />
				            <label for="keyword3" >친절한 강사</label>
				            <input type="checkbox" name="academyKeyword" id="keyword4"value="꼼꼼한 관리" />
				            <label for="keyword4">꼼꼼한 관리</label><br>
				            <input type="checkbox" name="academyKeyword" id="keyword5" value="숙제 없음" />
				            <label for="keyword5" >숙제 없음</label>
				            <input type="checkbox" name="academyKeyword" id="keyword6" value="자기주도적" />
				            <label for="keyword6" >자기주도적</label>
				            <input type="checkbox" name="academyKeyword" id="keyword7" value="강의식 수업" />
				            <label for="keyword7" >강의식 수업</label>
				            <input type="checkbox" name="academyKeyword" id="keyword8" value="입시 대비" />
				            <label for="keyword8" >입시 대비</label><br>
				            <input type="checkbox" name="academyKeyword" id="keyword9" value="재밌는 수업" />
				            <label for="keyword9">재밌는 수업</label>
				            <input type="checkbox" name="academyKeyword" id="keyword10" value="한 번에 많이" />
				            <label for="keyword10">한 번에 많이</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword11" value="조금씩 자주" />
                          	<label for="keyword11">조금씩 자주</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword12" value="실습 중심" />
                          	<label for="keyword12">실습 중심</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword13" value="소수정예" />
                          	<label for="keyword13">소수정예</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword14" value="집중 관리" />
                          	<label for="keyword14">집중 관리</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword15" value="테스트&피드백 시스템" />
                          	<label for="keyword15">테스트&피드백 시스템</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword16" value="상담 및 컨설팅 포함" />
                          	<label for="keyword16">상담 및 컨설팅 포함</label>
                          	<input type="checkbox" name="academyKeyword" id="keyword17" value="취업" />
                          	<label for="keyword17">취업</label>
				         </div>
					</td>
				</tr>
			</table>
		</form>
		
		<button type="button" name="updateBtn" id="updateBtn">회원정보 수정하기</button>
		<button type="button" name="payBtn" id="payBtn">결제하기</button> 
		<form id="withdrawalForm" action="/withdrawal/academy" method="POST">
			<button type="submit" id="withdrawalBtn">탈퇴하기</button>
		</form>
		
		<!-- <div id="confirmPasswordModal" class="modal">
		    <div class="modal-content">
		        <span class="close">&times;</span>
		        <h2>현재 비밀번호 확인</h2>
		        <input type="password" id="currentPassword" placeholder="현재 비밀번호를 입력해주세요">
		        <button id="confirmPasswordBtn">확인</button>
		    </div>
		</div> -->
	</section>

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
	        
	     	// academyFee 값 가져오기
	        var selectedAcademyFee = "${academyLogin.academyFee}";
	        // 가져온 값과 동일한 id를 가진 라디오 버튼을 선택함
	        document.getElementById(selectedAcademyFee).checked = true;
	    };
	</script>
	
	<!-- <script>
		$(document).ready(function() {
		    $("#withdrawalBtn").click(function() {
		    	event.preventDefault(); // 폼 전송 기본 동작 막기
		        $("#confirmPasswordModal").css("display", "block");
		    });
		
		    $(".close").click(function() {
		        $("#confirmPasswordModal").css("display", "none");
		    });
		
		    $("#confirmPasswordBtn").click(function() {
		        var currentPassword = $("#currentPassword").val();
		
		        // 비밀번호 검증 함수 호출
		        if (validatePassword(currentPassword)) {
		            var confirmWithdrawal = confirm("정말로 탈퇴하시겠습니까?");
		            if (confirmWithdrawal) {
		                // 폼 제출
		                $("#withdrawalForm").submit();
		            }
		        } else {
		            alert("현재 비밀번호가 일치하지 않습니다.");
		        }
		    });
		});
	</script> -->
	
	<!-- <script>
		$(document).ready(function() {
			$("#withdrawalBtn").click(function() {
				// confirm 창을 띄우고 사용자가 '예'를 선택한 경우에만 form을 제출합니다.
				var confirmWithdrawal = confirm("정말로 탈퇴하시겠습니까?");
				if (confirmWithdrawal) {
					$("#withdrawalForm").submit();
				}
			});
		});
	</script> -->

	<script>
		window.onload = function() {
			var confirmMessage = "${confirmMessage}";
			if (confirmMessage) {
				var result = confirm(confirmMessage);
				if (result) {
					window.location.href = "/academy/login"; // 확인 눌렀을 경우 로그인 페이지로 이동
				} else {
					window.location.href = "/";
				}
			}
		};
	</script>
	
	
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
	<script src="/resources/include/personal/jquery-3.7.1.min.js"></script>
  	<script src="/resources/include/academy/mypage.js"></script>
  	<script src="/resources/include/academy/withdrawal.js"></script>
  	<!-- <script src="/resources/include/assets/js/academy.js"></script> -->
  	<!-- <script src="/resources/include/academy/academyJoin.js"></script> -->
	<!-- <script src="/resources/include/academy/common.js"></script> -->
	<script src="/resources/include/assets/js/main.js"></script>


</body>

</html>