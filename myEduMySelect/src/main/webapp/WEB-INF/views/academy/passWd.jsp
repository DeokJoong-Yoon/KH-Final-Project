<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">



<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/academy/css/newPasswd.css" rel="stylesheet">


  <!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div class="col-12 text-center banner">
					비밀번호 변경 페이지<br />
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->
	


    <!-- ======= academyPassWd Update Form ======= -->   
    
    <section>	
    	<div class="container">
			<form id="changePasswdForm" >
			    <div>
			    	<input type="hidden" id="academyId" name="academyId" value="${academyLogin.academyId}" />
			    	<table>
			    		<tr>
			    			<td><label for="currentPassword" >현재 비밀번호</label></td>
			    			<td><input name="currentPassword" type="password" id="currentPassword"/></td>
			    		</tr>
			    		<tr>
			    			<td><label for="newPassword" >새로운 비밀번호</label></td>
			    			<td><input name="newPassword" type="password" id="newPassword"/></td>
			    		</tr>
			    		<tr>
			    			<td><label for="renewPassword" >새로운 비밀번호 확인</label></td>
			    			<td><input name="renewPassword" type="password" id="renewPassword"></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2"> <button type="button" id="changeBtn" name="changeBtn" >비밀번호 변경</button></td>
			    		</tr>
			    	</table>
				</div>
			</form>
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
	
  	<!-- <script src="/resources/include/assets/js/academy.js"></script>
  	<script src="/resources/include/academy/academyJoin.js"></script>
	<script src="/resources/include/academy/common.js"></script> -->
	<script src="/resources/include/assets/js/main.js"></script>
	<script src="/resources/include/academy/newPasswd.js"></script> 

</body>

</html>