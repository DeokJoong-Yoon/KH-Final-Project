function validatePassword(currentPassword) {
    console.log("validatePassword 함수 호출됨.");
    
    if (!chkData("#currentPassword", "현재 비밀번호를 ")) {
        console.log("비밀번호 유효성 검사 실패:", currentPassword);
        return false;
    } else {
        console.log("비밀번호 유효성 검사 성공:", currentPassword);
        return true;
    }
};

/** 회원 탈퇴 버튼 클릭 시 처리 이벤트 */
$(function() { 
    // 폼 제출 이벤트 핸들러
    $("#withdrawalForm").on("submit", function(event) {
        event.preventDefault(); // 폼 전송 기본 동작 막기
        
        var currentPassword = $("#currentPassword").val();
        
        // 현재 비밀번호가 비어있는지 확인
        if (currentPassword.trim() === "") {
            alert("현재 비밀번호를 입력해주세요.");
            return; // 함수 종료
        }
        
        // 비밀번호 검증 함수 호출
        if (validatePassword(currentPassword)) {
            // Ajax 요청
            $.ajax({
                type: 'POST',
                url: '/withdrawal/academy',
                data: { currentPassword: currentPassword }, // 현재 비밀번호만 전송
                dataType: "text",
                success: function(data) {
                    console.log("Ajax 요청 성공:", data);
                    if (data.trim() == "TRUE") {
                        alert("정상적으로 탈퇴되었습니다. 이용해주셔서 감사합니다.");
                        location.href = "/";
                    } else {
                        alert("현재 비밀번호가 일치하지 않습니다.");
                        $("#currentPassword").val("");
                        $("#currentPassword").focus();
                    }
                },
                error: function(xhr, textStatus, errorThrown) {
                    console.log("Ajax 요청 실패:", textStatus, errorThrown);
                    alert(textStatus + " ( HTTP-" + xhr.status + " / " + errorThrown + ")");
                }
            });
        } else {
            alert("현재 비밀번호가 일치하지 않습니다.");
        }
    });
});





