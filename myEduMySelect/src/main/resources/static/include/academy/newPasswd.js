function validatePassword(currentPassword, newPassword, renewPassword) {
	let curPasswd = $(currentPassword).val();
	let newPasswd = $(newPassword).val();
	let renewPasswd = $(renewPassword).val();
	//var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    
    if(!chkData(currentPassword, "현재 비밀번호를 ")) return true;
   	else if (!chkData(newPassword, "변경할 비밀번호를 ")) return true;
   	else if (!chkData(renewPassword, "비밀번호 확인을 ")) return true;
   	else if (curPasswd == newPasswd) {
		   alert("현재 비밀번호와 동일한 비밀번호를 사용할 수 없습니다.");
		   return true;
	} else if (newPasswd != renewPasswd) {
		alert("새로운 비밀번호와 비밀번호확인 번호가 일치하지 않습니다.");
		return true;
	}/* else if (!passwordRegex.test(newPasswd)) {
		alert("패스워드 형식이 맞지 않습니다.");
		return true;
	}*/ else {
		return false;
	}
};

$(function() { 
	// 비밀번호 변경 버튼 클릭 시
	$("#changeBtn").on("click", function() {
		if (validatePassword("#currentPassword", "#newPassword", "#renewPassword")) return;
		var formData = $("#changePasswdForm").serialize();
		$.ajax({
		type:'POST',
		url : '/updatePasswdChangeDate',
		data: formData, // 폼 데이터 전송
		dataType : "text",
		success: function(data) {
			console.log(data);
	        if(data.trim() ==  "TRUE") {
				alert("패스워드 변경 완료");
				location.href="/academy/login";
				} else {
					alert("현재 비밀번호가 일치하지 않습니다.");
					$("#newPassword").val("");
		            $("#renewPassword").val("");
		            $("#currentPassword").val("");
		            $("#currentPassword").focus();
				}
			},
			error:function(xhr, textStatus, errorThrown) {
				alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
			}
		});
	
	});
})




