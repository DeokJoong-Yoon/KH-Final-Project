<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>      
<body>
	<h1>회원탈퇴 페이지</h1>
<form id="withdrawalForm" action="/withdrawal/academy" method="POST">
    <div>
        <label for="currentPassword">현재 비밀번호:</label>
        <input type="password" id="currentPassword" name="currentPassword">
    </div>
    <div>
        <button type="button" id="checkAndWithdrawalBtn">회원 탈퇴</button>
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

</body>
</html> 