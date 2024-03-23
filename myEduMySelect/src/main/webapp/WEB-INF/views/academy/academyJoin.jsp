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
						<button type="button" id="checkDuplicateBtn" onclick="checkId()">중복확인</button>
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
						<input type="text" name="academyTargetSubject" id="academyTargetSubject"  maxlength="20" placeholder="교습과목을 입력해주세요" required/>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyFee" >수강료</label>
					</th>
					<td>
						<div id="feeGroup">
		                  <input type="radio" name="academyFee" id="fee1">
		                  <label for="fee1">20만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee2">
		                  <label for="fee2">20만원 이상 30만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee3">
		                  <label for="fee3">30만원 이상 40만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee4">
		                  <label for="fee4">40만원 이상 50만원 미만</label><br/>
		                  <input type="radio" name="academyFee" id="fee5">
		                  <label for="fee5">50만원 이상 60만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee6">
		                  <label for="fee5">60만원 이상 70만원 미만</label>
		                  <input type="radio" name="academyFee" id="fee7">
		                  <label for="fee6">70만원 이상</label>
		                </div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyTargetGrade" >대상 학년</label>
					</th>
					<td>
						<div id="ageGroup">
		                  <input type="radio" name="academyTargetGrade" id="grade1">
		                  <label for="grade1">미취학</label>
		                  <input type="radio" name="academyTargetGrade" id="grade2">
		                  <label for="grade2">초등저학년</label>
		                  <input type="radio" name="academyTargetGrade" id="grade3">
		                  <label for="grade3">초등고학년</label>
		                  <input type="radio" name="academyTargetGrade" id="grade4">
		                  <label for="grade4">중등</label>
		                  <input type="radio" name="academyTargetGrade" id="grade5">
		                  <label for="grade5">고등</label>
		                  <input type="radio" name="academyTargetGrade" id="grade6">
		                  <label for="grade6">성인</label>
		                </div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="academyKeyword1" >키워드</label>
					</th>
					<td>
						<div id="keywordGroup">
				            <input type="checkBox" name="academyKeyword1" id="keyword1" class="keyword-checkbox">
				            <label for="keyword1">기초부터</label>
				            <input type="checkBox" name="academyKeyword2" id="keyword2" class="keyword-checkbox">
				            <label for="keyword2">심화수업</label>
				            <input type="checkBox" name="academyKeyword3" id="keyword3" class="keyword-checkbox">
				            <label for="keyword3">친절한 강사</label>
				            <input type="checkBox" name="academyKeyword4" id="keyword4" class="keyword-checkbox">
				            <label for="keyword4">꼼꼼한 관리</label>
				            <input type="checkBox" name="academyKeyword5" id="keyword5" class="keyword-checkbox">
				            <label for="keyword5">숙제 없음</label>
				            <input type="checkBox" name="academyKeyword6" id="keyword6" class="keyword-checkbox">
				            <label for="keyword6">자기주도적</label><br/>
				            <input type="checkBox" name="academyKeyword7" id="keyword7" class="keyword-checkbox">
				            <label for="keyword7">강의식 수업</label>
				            <input type="checkBox" name="academyKeyword8" id="keyword8" class="keyword-checkbox">
				            <label for="keyword8">입시 대비</label>
				            <input type="checkBox" name="academyKeyword9" id="keyword9" class="keyword-checkbox">
				            <label for="keyword9">재밌는 수업</label>
				         </div>
					</td>
				</tr>
			</table>
	    </form>
	     <div class="text-end">
			<input type="submit" value="회원가입" id="submit-btn">
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
  <script src="/resources/include/academy/academyJoin.js"></script>
  
	
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
       
       function resetForm(){
    	   $("#a_joinForm")[0].reset();
       }
   </script>


</body>

</html>