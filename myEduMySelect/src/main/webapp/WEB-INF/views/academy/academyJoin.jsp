<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!DOCTYPE html>
<html>
<!-- Template Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="/resources/include/academy/css/academyJoin.css">


   <!-- ======= Hero Section ======= -->
   <section class="mcHero d-flex align-items-center">

      <div class="container">
         <div class="row">
            <div class="col-12 text-center mcBanner">
		            학원 회원가입<br/>
		        </div>  
         </div>
      </div>
   </section>
   <!-- End Hero -->


	<!-- ======= 회원가입 폼 ======= -->
	<section class="joinForm">
	   <div class="container">
	      <div class="text-center">
	
	     	<form name="a_joinForm" id="a_joinForm" method="POST" action="academyInsert">
	         <table>
				<tr>
					<th>
						<label for="academyId">아이디</label>
					</th>
					<td>
						<input type="text" name="academyId" id="academyId" placeholder="아이디 입력" maxlength="12" required />
						<button type="button" id="checkDuplicateBtn">중복확인</button>
						<div id="duplicate-message"></div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyPasswd">비밀번호</label>
					</th>
					<td>
						<input type="password" name="academyPasswd" id="academyPasswd" placeholder="비밀번호 입력" required />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyPasswd2" >비밀번호 확인</label>
					</th>
					<td>
						<input type="password" name="academyPasswd2" id="academyPasswd2" placeholder="비밀번호 확인" required />
						<span id="password-check-message"></span>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyNumber">사업자 등록번호</label>
					</th>
					<td>
						<input type="text" id="academyNumber" name="academyNumber" maxlength="10" placeholder="(-) 하이픈 기호를 제외하고 입력 후 검색 버튼을 눌러주세요" required />
						<button id="searchDuplicateBtn" class="duplicate-check">검색</button>
						<div id="search-message"></div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyManagerName">담당자 이름</label>
					</th>
					<td>
						<input type="text" id="academyManagerName" name="academyManagerName" required />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyManagerEmail" >담당자 이메일</label>
					</th>
					<td>
						<input type="text" id="academyManagerEmail" name="academyManagerEmail" required>
						<button id="emailCheckBtn" class="emailCheck">중복체크</button>
				        <br/>
				        <div id="email-check-message"></div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyManagerPhone" >담당자 전화번호</label>
					</th>
					<td>
						<input type="text" id="academyManagerPhone" name="academyManagerPhone" maxlength="11" placeholder="(-) 하이픈 기호를 제외하고 입력해주세요." required />
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyName" >학원명</label>
					</th>
					<td>
						<input type="text" name="academyName" id="academyName" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
					</td>
				</tr>
				<tr>
					<th>
						<label>학원주소</label>
					</th>
					<td>
						<label for="academyGuAddress" >행정구역명&nbsp;&nbsp;&nbsp;</label>
						<input type="text" name="academyGuAddress" id="academyGuAddress" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
						<br>
						<label for="academyRoadAddress">도로명주소&nbsp;&nbsp;&nbsp;</label>
						<input type="text" name="academyRoadAddress" id="academyRoadAddress" maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
						<br>
						<label for="academyDongAddress">상세주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" name="academyDongAddress" id="academyDongAddress"maxlength="100" placeholder="사업자 등록번호를 먼저 입력해주세요" required readonly/>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyPhone" >학원 전화번호</label>
					</th>
					<td>
						<input type="text" name="academyPhone" id="academyPhone"  maxlength="11" placeholder="(-)하이픈 기호 없이 입력해주세요." required/>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyTargetSubject" >교습과목</label>
					</th>
					<td>
						<div id="subjectGroup">
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
						<div id="feeGroup">
		                  <input type="radio" name="academyFee" id="fee1" value="20만원 미만">
		                  <label for="fee1">20만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee2" value="20만원 이상 30만원 미만">
		                  <label for="fee2">20만원 이상 30만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee3" value="30만원 이상 40만원 미만">
		                  <label for="fee3">30만원 이상 40만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee4" value="40만원 이상 50만원 미만">
		                  <label for="fee4">40만원 이상 50만원 미만</label><br/>
		                  <input type="radio" name="academyFee" id="fee5" value="50만원 이상 60만원 미만">
		                  <label for="fee5">50만원 이상 60만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee6" value="60만원 이상 70만원 미만">
		                  <label for="fee6">60만원 이상 70만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee7" value="70만원 이상">
		                  <label for="fee7">70만원 이상</label>
		                </div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyTargetGrade" >대상 학년</label>
					</th>
					<td>
						<div id="ageGroup">
		                  <input type="radio" name="academyTargetGrade" id="grade1" value="미취학">
		                  <label for="grade1">미취학</label>
		                  <input type="radio" name="academyTargetGrade" id="grade2" value="초등(저)">
		                  <label for="grade2">초등(저)</label>
		                  <input type="radio" name="academyTargetGrade" id="grade3" value="초등(고)">
		                  <label for="grade3">초등(고)</label>
		                  <input type="radio" name="academyTargetGrade" id="grade4" value="중등">
		                  <label for="grade4">중등</label>
		                  <input type="radio" name="academyTargetGrade" id="grade5" value="고등">
		                  <label for="grade5">고등</label>
		                  <input type="radio" name="academyTargetGrade" id="grade6" value="성인">
		                  <label for="grade6">성인</label>
		                </div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyKeyword1" >키워드</label>
					</th>
					<td colspan="3">
						<div id="keywordGroup">						    
						    <input type="checkbox" id="academyKeyword1" name="keyword" value="기초부터" class="keyword-checkbox">
						    <label for="academyKeyword1">기초부터</label>
						    
						    <input type="checkbox" id="academyKeyword2" name="keyword" value="심화수업" class="keyword-checkbox">
						    <label for="academyKeyword2">심화수업</label>
						    						    
						    <input type="checkbox" id="academyKeyword3" name="keyword" value="친절한 강사" class="keyword-checkbox">
						    <label for="academyKeyword3">친절한 강사</label><br>
						    						    
						    <input type="checkbox" id="academyKeyword4" name="keyword" value="꼼꼼한 관리" class="keyword-checkbox">
						    <label for="academyKeyword4">꼼꼼한 관리</label>						    
						    
						    <input type="checkbox" id="academyKeyword5" name="keyword" value="숙제 없음" class="keyword-checkbox">
						    <label for="academyKeyword5">숙제 없음</label>
						    						    
						    <input type="checkbox" id="academyKeyword6" name="keyword" value="자기주도적" class="keyword-checkbox">
						    <label for="academyKeyword6">자기주도적</label><br>
						    						    
						    <input type="checkbox" id="academyKeyword7" name="keyword" value="강의식 수업" class="keyword-checkbox">
						    <label for="academyKeyword7">강의식 수업</label>
						    						    
						    <input type="checkbox" id="academyKeyword8" name="keyword" value="입시 대비" class="keyword-checkbox">
						    <label for="academyKeyword8">입시 대비</label>
						    						    
						    <input type="checkbox" id="academyKeyword9" name="keyword" value="재밌는 수업" class="keyword-checkbox">
						    <label for="academyKeyword9">재밌는 수업</label><br>
						    
						    <input type="checkbox" id="academyKeyword10" name="keyword"  value="한 번에 많이" class="keyword-checkbox">
						    <label for="academyKeyword10">한 번에 많이</label>
						    
                          	<input type="checkbox" id="academyKeyword11" name="keyword"  value="조금씩 자주" class="keyword-checkbox">
                          	<label for="academyKeyword11">조금씩 자주</label>
                          	
                          	<input type="checkbox" id="academyKeyword12" name="keyword"  value="실습 중심" class="keyword-checkbox">
                          	<label for="academyKeyword12">실습 중심</label>
                          	
                          	<input type="checkbox" id="academyKeyword13" name="keyword"  value="소수정예" class="keyword-checkbox">
                          	<label for="academyKeyword13">소수정예</label>
                          	
                          	<input type="checkbox" id="academyKeyword14" name="keyword"  value="집중 관리" class="keyword-checkbox">
                          	<label for="academyKeyword14">집중 관리</label>
                          	
                          	<input type="checkbox" id="academyKeyword15" name="keyword"  value="테스트&피드백 시스템" class="keyword-checkbox">
                          	<label for="academyKeyword15">테스트&피드백 시스템</label>
                          	
                          	<input type="checkbox" id="academyKeyword16" name="keyword" value="상담 및 컨설팅 포함" class="keyword-checkbox">
                          	<label for="academyKeyword16">상담 및 컨설팅 포함</label>
                          	
                          	<input type="checkbox" id="academyKeyword17" name="keyword" value="취업" class="keyword-checkbox">
                          	<label for="academyKeyword17">취업</label>
						</div>
					</td>
				</tr>
			</table>
	    </form>
	     <div class="text-end">
			<input type="button" value="회원가입" id="submit-btn">
			<input type="reset" value="다시작성" id="reset-btn" onclick="resetForm()">
		 </div> 
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
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/assets/js/academy.js"></script>
  <!-- <script src="/resources/include/academy/academyJoin.js"></script> -->
  
	
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
   
   <!-- <script>
document.addEventListener("DOMContentLoaded", function() {
  var checkboxes = document.querySelectorAll('#keywordGroup input[type="checkbox"]');
  checkboxes.forEach(function(checkbox) {
    checkbox.addEventListener('change', limitCheckboxes);
  });
});

function limitCheckboxes() {
  var checkedCount = 0;
  var checkboxes = document.querySelectorAll('#keywordGroup input[type="checkbox"]');
  checkboxes.forEach(function(checkbox) {
    if (checkbox.checked) {
      checkedCount++;
    }
  });
  
  if (checkedCount > 5) {
    alert("키워드는 최대 5개의 항목만 선택할 수 있습니다.");
    // 마지막으로 선택한 항목을 해제함
    this.checked = false;
  }
}
</script> -->



   
   <!-- 키워드 선택 제어 
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
       
       function resetForm(){
    	   $("#a_joinForm")[0].reset();
       }
   </script>-->


</body>

</html>