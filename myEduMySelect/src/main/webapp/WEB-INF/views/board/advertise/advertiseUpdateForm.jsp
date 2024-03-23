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
		            	학원 홍보게시판입니다.<br>
		            	정보 얻어 가세요!
		            </div>
		       </div> 
		    </div>
		</div>
	</section> <!-- ======= 설명 영역 끝 ======= -->



	<!-- ======= 홍보게시판 수정 폼 ======= -->
  <main id="main">
 
    
    <section class="form">
     
      <div class="container">
      
      	<form name="formData" id="formData">
      		<input type="hidden" name="commonNo" id="commonNo" value="${updateData.commonNo }"/>
      		<%-- <input type="hidden" name="fileVO" id="fileVO" value="${updateData.fileVO }" /> --%>
      
	      	<div class="userId">${academyLogin.academyId}</div>
	      	
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
								<input type="file" id="file1" name="file1" class="form-control" maxlength="50" />
								<input type="file" id="file2" name="file2" class="form-control" maxlength="50" />
								<input type="file" id="file3" name="file3" class="form-control" maxlength="50" />
								<input type="file" id="file4" name="file4" class="form-control" maxlength="50" />
								<input type="file" id="file5" name="file5" class="form-control" maxlength="50" />
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
        $(document).ready(function() {
        	
        	let commonNo = ${updateData.commonNo};
        	
            // 페이지 로딩 시 getLike 실행
            $.ajax({
                type: "POST",
                url: "/like/get",
                data: JSON.stringify({
                			commonNo: commonNo,
                			likeMemberId : 'aaa111'
                		}),
             	headers : {"Content-Type" : "application/json"},
                dataType: "text",
                success: function(status) {
                    // 결과값에 따라 이미지 변경
                    if (status == 0) {
                    	$("#likeMsg").text("이 학원을 찜할까요?");
                    	$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    	$("#likeImage").on("click", function(){
                    		$.ajax({
                    			type: "post",
                    			url: "/like/insert",
                    			data: JSON.stringify({
                        			commonNo: commonNo,
                        			likeMemberId : 'aaa111'
                        		}),
                        		contentType: "application/json; charset=utf-8",
                                dataType: "text",
                                success: function(){
                                	$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                                	location.reload();
                                	alert("이 학원을 찜했습니다!");
                                },
                        		error: function(){
                        			alert("insert 실패");
                        		}
                    		})
                    	})
                    } else {
                    	if(status == 1) {
                    		$("#likeMsg").text("찜한 학원입니다.");
                    		$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                    		$("#likeImage").on("click", function(){
                        		$.ajax({
                        			type: "post",
                        			url: "/like/toggle",
                        			data: JSON.stringify({
                            			commonNo: commonNo,
                            			likeMemberId : 'aaa111'
                            		}),
                            		contentType: "application/json; charset=utf-8",
                                    dataType: "text",
                                    success: function(){
                                    	$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                                    	alert("찜을 취소했습니다.");
                                    	location.reload();
                                    },
                            		error: function(){
                            			alert("update 실패");
                            		}
                        		})
                        	})
                    	} else {
                    		$("#likeMsg").text("이 학원을 찜할까요?");
                    		$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    		$("#likeImage").on("click", function(){
                        		$.ajax({
                        			type: "post",
                        			url: "/like/toggle",
                        			data: JSON.stringify({
                            			commonNo: commonNo,
                            			likeMemberId : 'aaa111'
                            		}),
                            		contentType: "application/json; charset=utf-8",
                                    dataType: "text",
                                    success: function(){
                                    	$("#likeImage").attr('src', "/uploadStorage/like/likeYes.png");
                                    	location.reload();
                                    	alert("이 학원을 찜했습니다!");
                                    },
                            		error: function(){
                            			alert("update 실패");
                            		}
                        		})
                        	})
                    	}
                    }
                },
                error: function(){
                	alert("getLike 실패");
                }
            });
        });
        
        
        $("#cancel").on("click", function(){
			location.href="/advertise/advertiseDetail?commonNo=" + ${updateData.commonNo};
		});
    </script>
	
</body>

</html>