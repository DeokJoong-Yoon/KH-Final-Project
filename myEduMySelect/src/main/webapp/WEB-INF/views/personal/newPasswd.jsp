<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>		
<!DOCTYPE html>
<html lang="kr">



<!-- Template Main CSS File -->
<link href="/resources/include/assets/css/style.css" rel="stylesheet">
<link href="/resources/include/personal/css/newPasswd.css" rel="stylesheet">
	
	
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
	
	
	
	<section>	
		<div class="container">
			<form id="changePasswdForm" >
			    <div>
			    	<input type="hidden" id="personalId" name="personalId" value="${personalLogin.personalId}" />
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
			    			<td colspan="2"> <button type="button" id="changePasswdBtn" name="changePasswdBtn" >비밀번호 변경</button></td>
			    		</tr>
			    	</table>
				</div>
			</form>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />   

	<!-- Vendor JS Files -->
	<script src="/resources/include/assets/vendor/aos/aos.js"></script>
	<script
		src="/resources/include/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/include/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="/resources/include/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="/resources/include/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="/resources/include/assets/vendor/waypoints/noframework.waypoints.js"></script>
	<script
		src="/resources/include/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="/resources/include/personal/main.js"></script>
	<script src="/resources/include/personal/newPasswd.js"></script>
	<script src="/resources/include/js/jquery-3.7.1.min.js"></script> 

 
</body>
</html>
