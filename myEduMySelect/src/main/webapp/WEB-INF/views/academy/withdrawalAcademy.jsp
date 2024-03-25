<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<!DOCTYPE html>
<html lang="kr">

	<link href="/resources/include/academy/css/withdrawal.css" rel="stylesheet">
      
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div class="col-12 text-center banner">
					학원 회원 탈퇴<br />
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->
	<section>	
		<form id="withdrawalForm" action="/withdrawal/academy" method="POST">
		    <div>
		        <label for="currentPassword">현재 비밀번호 입력 :</label>
		        <input type="password" id="currentPassword" name="currentPassword">
		        <button type="button" id="checkAndWithdrawalBtn">회원 탈퇴하기</button>
		    </div> 
		</form>
	</section> 
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	    $(document).ready(function() {
	        $("#checkAndWithdrawalBtn").on("click", function() {
	            var currentPassword = $("#currentPassword").val();
	            $.ajax({
	                type: 'POST',
	                url: '/withdrawalAcademy',
	                data: {
	                    currentPassword: currentPassword
	                },
	                dataType: "text",
	                success: function(data) {
	                    if (data.trim() === "TRUE") {  
	                        // 현재 비밀번호가 일치하는 경우
	                        if (confirm("회원 탈퇴하시겠습니까?")) {
	                            // 확인 버튼 클릭 시 회원 탈퇴를 위한 form을 제출합니다.
	                            $("#withdrawalForm").submit();
	                        }
	                    } else {
	                        // 현재 비밀번호가 일치하지 않는 경우
	                        alert("현재 비밀번호가 일치하지 않습니다.");
	                        $("#currentPassword").val("");
	                        $("#currentPassword").focus();
	                    }
	                },
	                error: function(xhr, textStatus, errorThrown) {
	                    alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
	                }
	            });
	        });
	    });
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
    
    <script src="/resources/include/personal/jquery-3.7.1.min.js"></script>
    <script src="/resources/include/assets/js/main.js"></script>

</body>
</html> 