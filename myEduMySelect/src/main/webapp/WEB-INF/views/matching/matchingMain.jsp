<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!DOCTYPE html>
<html lang="kr">


  <link href="/resources/include/matching/css/matchingMain.css" rel="stylesheet">
  	
</head>

<body>


  <!-- ======= 설명 영역 ======= -->
  <section class="mcHero d-flex align-items-center">

    <div class="container">
      <div class="row" >
		<div class="col-12 text-center mcBanner">
            맞춤형 학원 검색<br/>
            <div class="mcDescBox">
            	<span><b>내 학원은 내가 결정한다!</b></span> <br/>
				MyEduMySelect에서 당신에게 꼭 맞는 맞춤형 학원을 찾아 보세요. <br/><br/>
				
				먼저, 조건을 선택하여 검색 결과를 조회하세요. <br/><br/>
				
				검색 결과 중 마음에 쏙 드는 학원을 발견했다면 <b>'비공개 매칭'</b>을 선택하세요. 
				검색 결과에서 원하는 학원을 선택하고 비밀번호를 지정한 뒤 '매칭 시작'을 클릭하면
				선택한 학원들에게 당신이 이 학원에 관심이 있다는 메일이 발송되고, 선택한 조건을 바탕으로 매칭게시판에 비밀글이 자동 등록됩니다. 
				메일을 받은 학원들만 매칭게시판의 비밀글에 접근이 가능합니다. <br/><br/>
				
				검색 결과는 확인했지만, 이중 어떤 학원을 선택해야 할지 모르겠다면 <b>'공개 매칭'</b>을 선택하세요. 
				'매칭 시작'을 클릭하면, 선택한 조건을 바탕으로 매칭게시판에 공개글이 자동 등록됩니다.
				학원들이 해당 글을 보고 댓글을 남길 수 있습니다.
				당신을 찾아온 학원들 중 원하는 학원을 선택하세요!
            </div>
        </div>  
      </div>
    </div>
   </section><!-- 설명영역 끝 -->


  <main id="main">
 
    <!-- ======= 조건 선택 영역 ======= -->
    <section class="mcSelectSection">
    	<div class="container">
      	
	      	<div class="section-title">
	          <h2>맞춤 조건 선택</h2>
	        </div>
	        
	        <div class="mcSelect">
	        	<form id="mcSelectForm">
	        		<input type="hidden" id="personalId" name="personalId" value="${personalLoginVO.personalId }"/>
	        		<input type="hidden" id="academyId" name="academyId" value="${academyLoginVO.academyId }"/>
	        		<table>
	        			<tr>
	        				<td>지역 선택</td>
	        				<td id="selects"> 
	        					<select id="gu" name="matchingGuAddress">
	        						<option value="">-- 구 선택 --</option>
	        						<option value="강남구">강남구</option>
	        						<option value="강동구">강동구</option>
	        						<option value="강북구">강북구</option>
	        						<option value="강서구">강서구</option>
	        						<option value="관악구">관악구</option>
	        						<option value="광진구">광진구</option>
	        						<option value="구로구">구로구</option>
	        						<option value="금천구">금천구</option>
	        						<option value="노원구">노원구</option>
	        						<option value="도봉구">도봉구</option>
	        						<option value="동대문구">동대문구</option>
	        						<option value="동작구">동작구</option>
	        						<option value="마포구">마포구</option>
	        						<option value="서대문구">서대문구</option>
	        						<option value="서초구">서초구</option>
	        						<option value="성동구">성동구</option>
	        						<option value="성북구">성북구</option>
	        						<option value="송파구">송파구</option>
	        						<option value="양천구">양천구</option>
	        						<option value="영등포구">영등포구</option>
	        						<option value="용산구">용산구</option>
	        						<option value="은평구">은평구</option>
	        						<option value="종로구">종로구</option>
	        						<option value="중구">중구</option>
	        						<option value="중랑구">중랑구</option>
	        					</select>
	        					<select id="dong" name="matchingDongAddress">
	        						<option value="">-- 동 선택 --</option>
	        					</select>
	        				</td>
	        				<td>학년 선택</td>
	        				<td>
	        					<input type="radio" name="matchingTargetGrade" id="preSchooler" value="미취학"><label for="preSchooler"> 미취학</label>
	        					<input type="radio" name="matchingTargetGrade" id="elementary1" value="초등(저)"><label for="elementary1"> 초등(저)</label>
	        					<input type="radio" name="matchingTargetGrade" id="elementary2" value="초등(고)"><label for="elementary2"> 초등(고)</label> <br>
	        					<input type="radio" name="matchingTargetGrade" id="middleSchool" value="중등"><label for="middleSchool"> 중등&nbsp;&nbsp;&nbsp;&nbsp;</label>
	        					<input type="radio" name="matchingTargetGrade" id="highSchool" value="고등"><label for="highSchool">고등&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	        					<input type="radio" name="matchingTargetGrade" id="adult" value="성인"><label for="adult">성인</label>
	        				</td>
	        			<tr>
	        				<td>과목 선택</td>
	        				<td>
	        					<input type="radio" name="matchingTargetSubject" id="korean" value="국어"><label for="korean"> 국어</label>
	        					<input type="radio" name="matchingTargetSubject" id="math" value="수학"><label for="math"> 수학</label>
	        					<input type="radio" name="matchingTargetSubject" id="english" value="영어"><label for="english"> 영어</label>
	        					<input type="radio" name="matchingTargetSubject" id="computer" value="컴퓨터"><label for="computer"> 컴퓨터</label><br/>
	        					<input type="radio" name="matchingTargetSubject" id="writing" value="논술"><label for="writing"> 논술</label>
	        					<input type="radio" name="matchingTargetSubject" id="science" value="과학"><label for="science"> 과학</label>
	        					<input type="radio" name="matchingTargetSubject" id="foreign" value="외국어"><label for="foreign"> 외국어</label>
	        					<input type="radio" name="matchingTargetSubject" id="foreign" value="실용음악"><label for="music"> 실용음악</label><br/>
	        					<input type="radio" name="matchingTargetSubject" id="art" value="미술"><label for="art"> 미술</label>
	        					<input type="radio" name="matchingTargetSubject" id="dance" value="무용/댄스"><label for="dance"> 무용/댄스</label>
	        					<input type="radio" name="matchingTargetSubject" id="gym" value="체육"><label for="gym"> 체육</label>
	        					<input type="radio" name="matchingTargetSubject" id="inst" value="악기"><label for="inst"> 악기</label><br/>
	        					<input type="radio" name="matchingTargetSubject" id="acting" value="연기/연극"><label for="acting"> 연기/연극</label>
	        					<input type="radio" name="matchingTargetSubject" id="entertain" value="예체능입시"><label for="entertain"> 예체능입시</label>
	        					<input type="radio" name="matchingTargetSubject" id="exam" value="고시"><label for="exam"> 고시</label><br/>
	        					<input type="radio" name="matchingTargetSubject" id="hobby" value="취미"><label for="hobby"> 취미</label>
	        					<input type="radio" name="matchingTargetSubject" id="job" value="직업기술"><label for="job"> 직업기술</label>
	        					<input type="radio" name="matchingTargetSubject" id="etc" value="기타"><label for="etc"> 기타</label>
	        				</td>
	        				<td>수강료</td>
	        				<td >
	        					<input type="radio" name="matchingFee" id="under20" value="20만원 미만"><label for="under20">20만원 미만&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	        					<input type="radio" name="matchingFee" id="up20under30" value="20만원 이상 30만원 미만"><label for="up20under30">20만원 이상 30만원 미만</label><br>
	        					<input type="radio" name="matchingFee" id="up30under40" value="30만원 이상 40만원 미만"><label for="up30under40">30만원 이상 40만원 미만</label>
	        					<input type="radio" name="matchingFee" id="up40under50" value="40만원 이상 50만원 미만"><label for="up40under50"> 40만원 이상 50만원 미만</label><br>
	        					<input type="radio" name="matchingFee" id="up50under60" value="50만원 이상 60만원 미만"><label for="up50under60"> 50만원 이상 60만원 미만</label>
	        					<input type="radio" name="matchingFee" id="up60under70" value="60만원 이상 70만원 미만"><label for="up60under70"> 60만원 이상 70만원 미만</label><br>
	        					<input type="radio" name="matchingFee" id="up70" value="70만원 이상"><label for="up70"> 70만원 이상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	        					<input type="radio" name="matchingFee" id="noMatter" value="무관"><label for="noMatter"> 무관</label>
	        				</td> 
	        			</tr>
	        			<tr>
	        				<td>키워드 선택</td>
	        				<td colspan="3">
	        					<input type="checkbox" name="matchingKeyword" id="fromBasic" value="기초부터"><label for="fromBasic"> 기초부터</label>
	        					<input type="checkbox" name="matchingKeyword" id="advanced" value="심화수업"><label for="advanced"> 심화수업</label>
	        					<input type="checkbox" name="matchingKeyword" id="kindTeacher" value="친절한 강사"><label for="kindTeacher"> 친절한 강사</label>
	        					<input type="checkbox" name="matchingKeyword" id="management" value="꼼꼼한 관리"><label for="management"> 꼼꼼한 관리</label>
	        					<input type="checkbox" name="matchingKeyword" id="noHomework" value="숙제 없음"><label for="noHomework"> 숙제 없음</label>
	        					<input type="checkbox" name="matchingKeyword" id="selfDirected" value="자기주도적"><label for="selfDirected"> 자기주도적</label>
	        					<input type="checkbox" name="matchingKeyword" id="lecture" value="강의식 수업"><label for="lecture"> 강의식 수업</label>
	        					<input type="checkbox" name="matchingKeyword" id="forEntrance" value="입시대비"><label for="forEntrance"> 입시대비</label> <br>
	        					<input type="checkbox" name="matchingKeyword" id="interesting" value="재밌는 수업"><label for="interesting"> 재밌는 수업</label>
	        					<input type="checkbox" name="matchingKeyword" id="once" value="한 번에 많이"><label for="once"> 한 번에 많이</label>
	        					<input type="checkbox" name="matchingKeyword" id="often" value="조금씩 자주"><label for="often"> 조금씩 자주</label>
	        					<input type="checkbox" name="matchingKeyword" id="practice" value="실습 중심"><label for="practice"> 실습 중심</label>
	        					<input type="checkbox" name="matchingKeyword" id="minimum" value="소수정예"><label for="minimum"> 소수정예</label>
	        					<input type="checkbox" name="matchingKeyword" id="care" value="집중 관리"><label for="care"> 집중 관리</label>
	        					<input type="checkbox" name="matchingKeyword" id="feedback" value="테스트&피드백 시스템"><label for="feedback"> 테스트&피드백 시스템</label><br>
	        					<input type="checkbox" name="matchingKeyword" id="consulting" value="상담 및 컨설팅 포함"><label for="consulting"> 상담 및 컨설팅 포함</label>
	        					<input type="checkbox" name="matchingKeyword" id="job" value="취업"><label for="job"> 취업</label>
	        				</td>
	        			<tr>
	        				<td colspan="4">
	        					<button id="mcSearchBtn" type="button">검색 결과 조회하기</button>
	        				</td>
	        		</table>
	        	</form>
	        </div>

    	</div>
    </section><!-- 조건 선택 영역 끝 -->
    
   


    <!-- ======= 검색 결과 영역 ======= -->
    <section class="mcResultSection">
      <div class="container" >
		
        <div class="section-title">
          <h2>검색 결과</h2>
        </div>
        
        
		
        <div class="mcResult" >
			<table>
				<thead>
					<tr>
						<th>선택</th>
						<th>학원명</th>
						<th>주소</th>
						<th>전화번호</th>
					</tr>
				</thead>
				
				<tbody id="resultDiv">
				</tbody>
			</table>
        </div>
        
        <div class="mcUploadArea">
      		<button id="mcPublicBtn">공개 매칭하기</button>
        	<button id="mcPrivateBtn">비공개 매칭하기</button>
   	    	<div id="mcStartArea">
       			<input type="password" placeholder="비밀번호 (숫자 4자리)" id="mcPwd" name="matchingPasswd"> <br/><br/>
        		<textarea rows="3" placeholder="덧붙이는 말" id="plusComment" name="matchingComment"></textarea>
	        	<button id="mcUploadBtn" type="button">매칭 시작하기</button>
        	</div>
        	
        </div>

      </div>
    </section><!-- 검색결과 영역 끝 -->

   

    <!-- ======= 매칭게시판 미리 보기 ======= -->
    <section class="mcBoardPreviewSection">
      <div class="container">

        <div class="section-title">
          <h2>매칭 게시판</h2>
        </div>
        
        <form id="mcBoardPreviewForm">
        	<input type="hidden" id="mcBoardPreviewNumber" name="mcBoardPreviewNumber" />
        </form>
	
		<div class="mcBoardPreview">
			<table>
				<thead>
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody id="mcBoardPreviewList">
					<c:choose>
						<c:when test="${not empty mBoardList}">
							<c:forEach var="matchingBoard" items="${mBoardList }" varStatus="status">
								<tr data-num="${matchingBoard.matchingNo }">
									<td>${matchingBoard.matchingNo }</td>
									<td>
										<form name="privateChk" id="privateChk">
											<input type="hidden" name="matchingPrivate" value="${matchingBoard.matchingPrivate }"/>
											<input type="hidden" name="matchingPasswd" value="${matchingBoard.matchingPasswd }"/>
										</form>
										<c:choose>
										    <c:when test="${matchingBoard.matchingPrivate eq 'Y'}">
										        <img src="/resources/include/assets/img/matching/자물쇠.png">&nbsp;
										        <a class="mbdLink" href="">
										        	${matchingBoard.matchingGuAddress}&nbsp;${matchingBoard.matchingDongAddress} | ${matchingBoard.matchingTargetSubject } | ${matchingBoard.matchingTargetGrade }
										        </a>
										    </c:when>
										    <c:otherwise>
										    	<a class="mbdLink" href="">
										    		${matchingBoard.matchingGuAddress}&nbsp;${matchingBoard.matchingDongAddress} | ${matchingBoard.matchingTargetSubject } | ${matchingBoard.matchingTargetGrade }
										    	</a>
										    </c:otherwise>
										</c:choose>
										<c:if test="${matchingBoard.commentCnt > 0 }">
							        		<span class="comment_count">&nbsp;&nbsp;[${matchingBoard.commentCnt }]</span>
							        	</c:if>
									</td>
									<td class="writerId">${matchingBoard.personalId }</td>
									<td>${matchingBoard.matchingRegisterDate }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">등록된 게시글이 존재하지 않습니다</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>	
			</table>
		</div>
		<button id="gotoMcBoard">매칭 게시판 전체 보기</button>
      </div>
    </section><!-- End Frequently Asked Questions Section -->

    <!-- ======= 매칭게시판 미리보기 끝 ======= -->
    
    
    
  
  </main><!-- End #main -->

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
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/matching/js/matchingMain.js"></script>
  <script src="/resources/include/js/common.js"></script>
  
	<script>
	    window.onload = function() {
	        var confirmMessage = "${confirmMessage}";
	        if (confirmMessage) {
	            var result = confirm(confirmMessage);
	            if (result) {
	                window.location.href = "/useraccount/login"; // 확인이 눌렸을 경우 로그인 페이지로 이동
	            } else {
	            	window.location.href = "/";
	            }
	        }
	    };
	</script>

</body>

</html>