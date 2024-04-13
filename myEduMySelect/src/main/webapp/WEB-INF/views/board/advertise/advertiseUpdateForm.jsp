<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>	
<!DOCTYPE html>
<html lang="kr">

  <!-- Template Main CSS File -->
<link href="/resources/include/board/advertise/css/advertiseDetail.css" rel="stylesheet">

  <!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">
				<form id="detailForm">
					<input type="hidden" id="common_no" name="common_no" />
				</form>

				<div class="col-12 text-center banner">
		            홍보 게시판<br/>
		            <div class="descBox">
		            	우리 학원이 얼마나 멋진 장소인지 자랑하는 <b>홍보 게시판</b>입니다. 
						당신이 찾는 모든 학원 정보가 바로 여기에!<br>
						홍보 게시판에서 마음에 드는 학원을 발견했다면, '찜'을 눌러 보세요! 내가 찜한 학원 목록은 마이페이지에서 확인 가능합니다.
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->



	<!-- ======= 홍보게시판 수정 폼 ======= -->
  <main id="main">
 
    
    <section class="form">
     
      <div class="container">
      
      	<form name="updateForm" id="updateForm">
      		<input type="hidden" name="commonNo" id="commonNo" value="${updateData.commonNo }"/>
	      	
			<div class="advDetail">
				<table>
					<tr>
						<th>글 번호</th>
						<td>${updateData.commonNo}</td>
					</tr>
					<tr>
						<th>학원명</th>
						<td>${academyLogin.academyName}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${academyLogin.academyId}</td>
					</tr>
				</table>
				<br>
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" id="commonTitle" name="commonTitle" value="${updateData.commonTitle }" />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="20" name="commonContent" id="commonContent" >${updateData.commonContent }</textarea>
							</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td>
								<input type="file" id="fileInput" name="files" class="form-control" maxlength="50" multiple />
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
    </section><!-- 홍보게시판 수정 폼 -->
    
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
  <script src="/resources/include/board/advertise/js/advertiseUpdate.js"></script>
  
 
	
	<script type="text/javascript">
        
        $("#cancel").on("click", function(){
			location.href="/advertise/advertiseDetail?commonNo=" + ${updateData.commonNo};
		});
        
		$(function() {
			let popUp = "${popUp}";
			if (popUp != "") {
				alert(popUp);
			}
			
		});
		
    </script>
	
</body>

</html>