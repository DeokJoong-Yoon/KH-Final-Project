<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>admin</title>
    <!-- Add your head content here if needed -->
    <style>
    	body {
	    	background: #00416A;  /* fallback for old browsers */
			background: -webkit-linear-gradient(to right, #E4E5E6, #00416A);  /* Chrome 10-25, Safari 5.1-6 */
			background: linear-gradient(to right, #E4E5E6, #00416A); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    	}
		.btn-color{
		  background-color: #0e1c36;
		  color: #fff;
		  
		}
		.profile-image-pic{
		  height: 200px;
		  width: 200px;
		  object-fit: cover;
		}
		.cardbody-color{
		  background-color: #ebf2fa;
		}
		
		a{
		  text-decoration: none;
		}
    </style>
	<link rel="shortcut icon" href="/resources/include/admin/image/admin.png" />
	<link rel="apple-touch-icon" href="/resources/include/admin/image/admin.png" />
</head>
<body class="text-center">
<c:if test="${empty adminLogin}">
<div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center text-dark mt-5">Login Admin</h2>
        <div class="text-center mb-5 text-danger"><h3>Warning!! For Administrator</h3></div>
        <div class="card my-5">

          <form id="loginForm" class="card-body cardbody-color p-lg-5">

            <div class="text-center">
				<img src="/resources/include/admin/image/admin.png" class="img-fluid profile-image-pic img-thumbnail rounded-circle my-1"
				    width="8px" alt="profile">

            </div>

            <div class="mb-3">
              <input type="text" class="form-control" id="adminId" name="adminId" aria-describedby="emailHelp"
                placeholder="Admin Identification">
            </div>
            <div class="mb-3">
              <input type="password" class="form-control" id="adminPasswd" name="adminPasswd" placeholder="password">
            </div>
            <div class="text-center"><button type="button" id="loginBtn" name="loginBtn" class="btn btn-color px-5 mb-5 w-100">Login</button></div>
            <div id="emailHelp" class="form-text text-center mb-5 text-dark">Not Registered?
            	<div>call manager 010-0000-0000</div>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
</c:if>
  <c:if test="${not empty adminLogin}">
  	<jsp:include page="adminBoard.jsp" />
  </c:if>
<script>
    $(function() {
        let errorMsg = "${errorMsg}";
        if(errorMsg !== "") {
            alert(errorMsg);
        }
    });
</script>
<script src="/resources/include/admin/js/adminLogin.js"></script>


</body>
</html>
