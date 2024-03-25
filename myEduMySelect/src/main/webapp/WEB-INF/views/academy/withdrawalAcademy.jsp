<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
      
<body>
<!-- ======= Header ======= -->
	<header id="header" class="fixed-top ">
	    <div class="container d-flex align-items-center">
	
	      <h1 class="logo me-auto"><a href="/">MyEdu<br />MySelect</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="/resources/include/assets/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li><a class="nav-link scrollto active" href="#hero">Ȩ</a></li>
	          <li><a class="nav-link scrollto" href="#about">About</a></li>
	          <li><a class="nav-link scrollto" href="#team">Team</a></li>
	          <li class="dropdown"><a href="#"><span>�޴�</span> <i class="bi bi-chevron-down"></i></a>
	            <ul>
	              <li><a href="/free/freeList">�����Խ���</a></li>
	            <li><a href="#">ȫ���Խ���</a></li>
	            <li><a href="/matching/">��Ī�Խ���</a></li>
	            <li><a href="/notice/boardList">�����Խ���</a></li>
	            <c:if test="${personalLogin.memberTypeId == 1}">
	               <li><a href="${pageContext.request.contextPath}/myPage" id="mypageBtn">����ȸ�� ����������</a></li>
	            </c:if>
	            <c:if test="${academyLogin.memberTypeId == 2}">
	               <li><a href="${pageContext.request.contextPath}/academy/mypage" id="mypageBtn">�п�ȸ�� ����������</a></li>
	            </c:if>
	            </ul>
	          </li>
	          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
	          <c:choose>
	          <c:when test="${not empty personalLogin}">
	              <li><a class="nav-link scrollto">[����]&nbsp&nbsp${personalLogin.personalName}�� ȯ���մϴ�.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/useraccount/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">�α׾ƿ�</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:when test="${not empty academyLogin}">
	              <li><a class="nav-link scrollto">[�п�]&nbsp&nbsp${academyLogin.academyName}�� ȯ���մϴ�.</a></li>
	              <li>
	                  <form action="${pageContext.request.contextPath}/academy/logout" method="POST">
	                      <button class="getstarted scrollto btn btn-aquamarine" type="submit">�α׾ƿ�</button>
	                  </form>
	              </li>
	          </c:when>
	          <c:otherwise>
	              <li><a class="getstarted scrollto" href="${pageContext.request.contextPath}/loginselect">�α���/ȸ������</a></li>
	          </c:otherwise>
	        </c:choose>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
  	</header>
	<!-- End Header -->
	<!-- ======= Hero Section ======= -->
	<section id="hero" class="d-flex align-items-center">

		<div class="container">
			<div class="row">
				<div
					class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1"
					data-aos="fade-up" data-aos-delay="200">
					<h1>ȸ�� Ż�� ������</h1>
					<h2></h2>


				</div>
				<div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in"
					data-aos-delay="200">
					<img src="/resources/include/assets/img/hero-img.png"
						class="img-fluid animated" alt="">
				</div>
			</div>
		</div>
	</section>
	<!-- End Hero -->
	
	<h1>ȸ��Ż�� ������</h1>
	<form id="withdrawalForm" action="/withdrawal/academy" method="POST">
	    <div>
	        <label for="currentPassword">���� ��й�ȣ:</label>
	        <input type="password" id="currentPassword" name="currentPassword">
	    </div>
	    <div>
	        <button type="button" id="checkAndWithdrawalBtn">ȸ�� Ż��</button>
	    </div> 
	</form>
	
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
	                        // ���� ��й�ȣ�� ��ġ�ϴ� ���
	                        if (confirm("ȸ�� Ż���Ͻðڽ��ϱ�?")) {
	                            // Ȯ�� ��ư Ŭ�� �� ȸ�� Ż�� ���� form�� �����մϴ�.
	                            $("#withdrawalForm").submit();
	                        }
	                    } else {
	                        // ���� ��й�ȣ�� ��ġ���� �ʴ� ���
	                        alert("���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
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