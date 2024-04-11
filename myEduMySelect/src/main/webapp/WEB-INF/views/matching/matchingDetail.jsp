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
 
    <!-- ======= 매칭게시판 상세 보기 ======= -->
    <section class="mcBoard">
     
      <div class="container">
      
      	<!-- ======= 세션을 위한 hidden input ======= -->
        <input type="hidden" id="personalId" name="personalId" value="${personalLoginVO.personalId }"/>
	    <input type="hidden" id="academyId" name="academyId" value="${academyLoginVO.academyId }"/>
      
      
      	<form name="formData" id="formData">
      		<input type="hidden" name="matchingNo" id="matchingNo" value="${detail.matchingNo }"/>
      	</form>
      
		<div class="mcBoardDetail">
			<table>
				<tr>
					<th>글 번호</th>
					<td>${detail.matchingNo}</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class="writerId">${detail.personalId}</td>
				</tr>
				<tr>
					<th>등록 일시</th>
					<td>${detail.matchingRegisterDate }</td>
				</tr>
			</table>
			<br>
			<table>
				<tbody>
					<tr>
						<th>지역</th>
						<td>${detail.matchingGuAddress }&nbsp; ${detail.matchingDongAddress}</td>
					</tr>
					<tr>
						<th>과목</th>
						<td>${detail.matchingTargetSubject }</td>
					</tr>
					<tr>
						<th>학년</th>
						<td>${detail.matchingTargetGrade }</td>
					</tr>
					<tr>
						<th>희망 수강료</th>
						<td>${detail.matchingFee }</td>
					</tr>
					<tr>
						<th>키워드</th>
						<td>
							${detail.matchingKeyword1 }&nbsp;&nbsp;&nbsp; ${detail.matchingKeyword2 }&nbsp;&nbsp;&nbsp; ${detail.matchingKeyword3 }
						</td>
					</tr>
					<tr>
						<th>덧붙이는 말</th>
						<td>${detail.matchingMemo }</td>
					</tr>
				</tbody>	
			</table>
		</div>

		
		<div class="detailButtons">
      		<button type="button" id="editPost">수정</button>
      		<button type="button" id="deletePost">삭제</button>
			<button type="button" id="gotoList">목록</button>
      	</div>
      </div>
    </section><!-- 매칭게시판 상세보기 끝 -->
    
    
    <!-- 매칭게시판 댓글 -->
	<section class="mcCommentSection">
		<%-- 댓글 보여주기 --%>
		<jsp:include page="matchingComment.jsp" />
	</section>
	
  
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
  <script src="/resources/include/js/common.js"></script>
  <script src="/resources/include/js/jquery-3.7.1.min.js"></script>
  <script src="/resources/include/assets/js/main.js"></script>
  <script src="/resources/include/matching/js/matchingDetail.js"></script>
  
 
	<script>
		$(function() {
			let popUp = "${popUp}";
			if (popUp != "") {
				alert(popUp);
			}
			
		});
		
	</script>
	
</body>

</html>