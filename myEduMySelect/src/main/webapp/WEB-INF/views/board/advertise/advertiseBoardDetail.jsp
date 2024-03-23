<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">

<link href="/resources/include/board/advertise/css/advertiseDetail.css" rel="stylesheet">

  <!-- ======= 설명 영역 ======= -->
	<section id="hero" class="d-flex align-items-center  justify-content-center">
		<div class="container" >
			<div class="row">

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



	<!-- ======= 홍보게시판 상세 보기 ======= -->
  <main id="main">
 
    
    <section class="form">
     
      <div class="container">
      
      	<form name="formData" id="formData">
      		<input type="hidden" name="commonNo" id="commonNo" value="${detail.commonNo }"/>
      		<%-- <input type="hidden" name="fileVO" id="fileVO" value='${JSON.stringify(detail.fileVO)}' /> --%>
      	</form>
      	
      	<p>${detail.fileVO[0].getFilePath()}dd</p>
      
      	<div class="userId">${userId }</div>
      	
		<div class="advDetail">
			<table>
				<tr>
					<th>글 번호</th>
					<td>${detail.commonNo}&nbsp;&nbsp;&nbsp;&nbsp;[조회수 : ${detail.commonReadcnt }]</td>
				</tr>
				<tr>
					<th>학원명</th>
					<td>${detail.commonNickname}</td>
				</tr>
				<tr>
					<th>등록 일시</th>
					<td>${detail.commonRegisterDate }</td>
				</tr>
			</table>
			<br>
			<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td>${detail.commonTitle }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${detail.commonContent }</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td id="lastTd">
							<c:forEach var="file" items="${detail.fileVO }">
								<img src="${file.filePath}" alt="이미지">
							</c:forEach>
						</td>
					</tr>
				</tbody>	
			</table>
			
			
			<div id="likeButton">
		        <img id="likeImage" src="/uploadStorage/like/likeNo.png">
		        <p id="likeMsg"></p>
		    </div>
			
			
			
		</div>

		
		<div class="detailButtons">
      		<button type="button" id="editPost">수정</button>
      		<button type="button" id="deletePost">삭제</button>
			<button type="button" id="gotoList">목록</button>
      		<button type="button" id="nextPost">다음글</button>
			<button type="button" id="prevPost">이전글</button>
      	</div>
      </div>
    </section><!-- 매칭게시판 상세보기 끝 -->
    
    
    
   
    
	
  
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
  <script src="/resources/include/board/advertise/js/advertiseDetail.js"></script>
  
 
	
	<script type="text/javascript">
        $(document).ready(function() {
        	
        	let commonNo = ${detail.commonNo};
        	let memberId= "${personalLoginVO.personalId}";
        	
            // 페이지 로딩 시 getLike 실행
            $.ajax({
                type: "POST",
                url: "/like/get",
                data: JSON.stringify({
                			commonNo: commonNo,
                			likeMemberId : memberId
                		}),
             	headers : {"Content-Type" : "application/json"},
                dataType: "text",
                success: function(status) {
                    // 결과값에 따라 이미지 변경
                    if (status == 0) {
                    	$("#likeMsg").text("이 학원을 찜할까요?");
                    	$("#likeImage").attr('src', "/uploadStorage/like/likeNo.png");
                    	$("#likeButton").on("click", function(){
                    		$.ajax({
                    			type: "post",
                    			url: "/like/insert",
                    			data: JSON.stringify({
                        			commonNo: commonNo,
                        			likeMemberId : memberId
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
                    		$("#likeButton").on("click", function(){
                        		$.ajax({
                        			type: "post",
                        			url: "/like/toggle",
                        			data: JSON.stringify({
                            			commonNo: commonNo,
                            			likeMemberId : memberId
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
                    		$("#likeButton").on("click", function(){
                        		$.ajax({
                        			type: "post",
                        			url: "/like/toggle",
                        			data: JSON.stringify({
                            			commonNo: commonNo,
                            			likeMemberId : memberId
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

        
        //삭제 시 팝업
		$(function() {
			let popUp = "${popUp}";
			if (popUp != "") {
				alert(popUp);
			}
			
		});
		
    </script>
	
</body>

</html>