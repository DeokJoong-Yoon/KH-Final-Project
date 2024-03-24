$(document).ready(function() {

    /** 목록 버튼 클릭 시 처리 이벤트 */
    $("#changePasswdBtn").on("click", function() {
        if (validatePassword("#currentPassword", "#newPassword", "#renewPassword")) return;
        
         if (!confirm("비밀번호를 변경하시겠습니까?")) return;
        var formData = $("#changePasswdForm").serialize();
        $.ajax({
        type:'POST',
        url : '/updatePersonalPasswd',
        data: formData, // 폼 데이터 전송
        dataType : "text",
        success: function(data) {
            console.log(data);
            if(data.trim() ==  "TRUE") {
                alert("비밀번호 변경이 완료되었습니다.");
                window.location.href = "/personal/login";
                } else {
                    alert("패스워드를 정확히 입력해 주세요.");
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

    // validatePassword 함수 정의
    function validatePassword(currentPassword, newPassword, renewPassword) {
        let curPasswd = $(currentPassword).val();
        let newPasswd = $(newPassword).val();
        let renewPasswd = $(renewPassword).val();
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
        
        if(!chkData(currentPassword, "현재 비밀번호를 ")) return true;
        else if (!chkData(newPassword, "변경할 비밀번호를 ")) return true;
        else if (!chkData(renewPassword, "비밀번호 확인을 ")) return true;
        else if (curPasswd == newPasswd) {
               alert("현재 비밀번호와 동일한 비밀번호를 사용할 수 없습니다.");
               return true;
        } else if (newPasswd != renewPasswd) {
            alert("새로운 비밀번호와 비밀번호확인 번호가 일치하지 않습니다.");
            return true;
        } else if (!passwordRegex.test(newPasswd)) {
            alert("패스워드 형식이 맞지 않습니다.");
            return true;
        } else {
            return false;
        }
    }
    /* 함수명 : chkData(유효성 체크 대상, 메시지 내용)
 * 출력 영역 : alert으로.
 * 예시 : if (!chkData("#keyword", "검색어를")) return;
 * */
function chkData(item, msg) {
	if($(item).val().replace(/\s/g, "") == "") {
		alert(msg + " 입력해 주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	} else {
		return true;
	}
}

});
