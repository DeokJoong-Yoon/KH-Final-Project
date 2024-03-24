<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>      
<body>
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

</body>
</html> 