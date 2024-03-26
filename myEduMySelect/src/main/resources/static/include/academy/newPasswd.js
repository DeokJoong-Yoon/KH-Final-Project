function validatePassword(currentPassword, newPassword, renewPassword) {
    let curPasswd = $(currentPassword).val();
    let newPasswd = $(newPassword).val();
    let renewPasswd = $(renewPassword).val();

    // 현재 비밀번호, 새 비밀번호, 비밀번호 확인 필드가 비어 있는지 확인
    if (!curPasswd) {
        alert("현재 비밀번호를 입력해주세요.");
        return true;
    }
    if (!newPasswd) {
        alert("새 비밀번호를 입력해주세요.");
        return true;
    }
    if (!renewPasswd) {
        alert("비밀번호 확인을 입력해주세요.");
        return true;
    }

    // 새 비밀번호 유효성 검사
	if (!(/[a-zA-Z\d@$!%*?&]{8,20}/.test(newPasswd))) {
	    alert("새 비밀번호는 8~20자 이내, 대문자/소문자/숫자/특수문자 중 하나를 포함해야 합니다.");
	    return true; // 유효성 검사 실패
	}

    // 현재 비밀번호와 새 비밀번호가 같은지 확인
    if (curPasswd === newPasswd) {
        alert("현재 비밀번호와 동일한 비밀번호를 사용할 수 없습니다.");
        return true;
    }

    // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
    if (newPasswd !== renewPasswd) {
        alert("새로운 비밀번호와 비밀번호 확인 번호가 일치하지 않습니다.");
        return true;
    }
	
	// 현재 아이디와 새 비밀번호가 3자리 이상 겹치는지 확인
    var userId = $("#academyId").data("academy-id");
    for (let i = 0; i < userId.length - 2; i++) {
        let substr = userId.substring(i, i + 3);
        if (newPasswd.includes(substr)) {
            alert("새 비밀번호는 현재 아이디와 3자리 이상 일치하게 사용할 수 없습니다.");
            return true; 
        }
    }	
    return false; // 모든 유효성 검사 통과
}

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
                if(data.trim() === "TRUE") {
                    alert("패스워드 변경 완료");
                    location.href="/academy/login";
                } else {
                    alert("현재 비밀번호가 일치하지 않습니다.");
                    $("#currentPassword").val("").focus(); // 비밀번호 필드 초기화 및 포커스
                }
            },
            error:function(xhr, textStatus, errorThrown) {
                alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
            }
        });
    });
});