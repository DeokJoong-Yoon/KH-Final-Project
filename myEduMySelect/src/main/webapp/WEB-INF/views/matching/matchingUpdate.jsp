<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

  <link href="/resources/include/matching/css/matchingDetail.css" rel="stylesheet">


  <!-- ======= 설명 영역 ======= -->
  <section class="mcHero d-flex align-items-center">

    <div class="container">
      <div class="row" >
		<div class="col-12 text-center mcBanner">
            매칭 게시판<br/>
            <div class="mcDescBox">
            	여러분이 선택한 조건에 기반하여 자동 등록된 게시물을 볼 수 있는 <b>매칭 게시판</b>입니다.<br>
  				당신에게 딱 맞는 학원이 당신을 찾아올 거예요!<br>
            </div>
        </div>  
      </div>
    </div>
   </section><!-- 설명영역 끝 -->


  <main id="main">
 
    <!-- ======= 매칭게시판 수정 폼 ======= -->
    <section class="mcBoard">
     
      <div class="container">
      <p><b>매칭 게시글 수정은 '덧붙이는 말' 수정만 가능합니다.</b></p>
		
			<form id="updateForm">
				<input type="hidden" id="matchingNo" name="matchingNo" value="${updateData.matchingNo }"/>
		
				<div class="mcBoardDetail">
					<table>
						<tr>
							<th>글 번호</th>
								<td>${updateData.matchingNo }</td>
							</tr>
						<tr>
							<th>등록 일시</th>
							<td>${updateData.matchingRegisterDate }</td>
						</tr>
					</table>
					<br>
					<table>
						<tbody>
							<tr>
								<th>지역</th>
								<td>${updateData.matchingGuAddress }&nbsp ${updateData.matchingDongAddress}</td>
							</tr>
							<tr>
								<th>과목</th>
								<td>${updateData.matchingTargetSubject }</td>
							</tr>
							<tr>
								<th>학년</th>
								<td>${updateData.matchingTargetGrade }</td>
							</tr>
							<tr>
								<th>희망 수강료</th>
								<td>${updateData.matchingFee }</td>
							</tr>
							<tr>
								<th>키워드</th>
								<td>
									${updateData.matchingKeyword1 }&nbsp&nbsp&nbsp ${updateData.matchingKeyword2 }&nbsp&nbsp&nbsp ${updateData.matchingKeyword3 }
								</td>
							</tr>
							<tr>
								<th>덧붙이는 말</th>
								<td>
									<textarea name="matchingComment" id="matchingComment" rows="10">${updateData.matchingComment }</textarea>
								</td>
							</tr>
						</tbody>	
					</table>
				</div>
			</form>
			
			<div class="detailButtons">
	      		<button type="button" id="cancel">수정 취소</button>
	      		<button type="button" id="editFinish">수정 완료</button>
	      	</div>
      </div>
    </section><!-- 매칭게시판 수정 폼 끝 -->

  
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
  <script src="/resources/include/js/common.js"></script>
  <script src="/resources/include/matching/js/matchingUpdate.js"></script>
  
  <script>
	$("#cancel").on("click", function(){
		location.href="/matching/boardDetail?matchingNo=" + ${updateData.matchingNo};
	});
  </script>
 

</body>

</html>