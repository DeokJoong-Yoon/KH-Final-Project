$(function() {
	/** 저장 버튼 클릭 시 이벤트 */
	$("#loginBtn").on("click", function() {
		// 입력값 체크
		if (!chkData("#adminId", "아이디를 ")) return;
		else if (!chkData("#adminPasswd", "패스워드를 ")) return;
		else {
			$("#loginForm").attr({
				"method" : "post",
				"action" : "/admin/login"
			});
			$("#loginForm").submit();
		}
	});
	
	$("#logoutBtn").on("click", function() {
		location.href = "/admin/logout";
	});
})