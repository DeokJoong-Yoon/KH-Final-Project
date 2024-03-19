
// 유효성 검사 함수를 전역으로 이동 (id랑 email은 중복확인이 필요하기때문)
function validateEmail(personalEmail) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(personalEmail);
}


function checkEmail() {
    var personalEmail = $('#personalEmail').val();
    // 이메일 유효성 검사 추가
    if (!validateEmail(personalEmail)) {
        alert("올바른 이메일 주소를 입력해주세요.");
        $('#personalEmail').focus();
        return;
    }
    
    $.ajax({
        url: '/emailCheck',
        type: 'post',
        data: { personalEmail: personalEmail },
        success: function (cnt) {
            if (cnt == 0) {
                alert("사용 가능한 이메일입니다!");
            } else {
                alert("중복된 이메일입니다. 다시 입력해주세요.");
                $('#personalEmail').val('');
            }
        },
        error: function () {
            alert("에러발생");
        }
    });
};




function validateForm() {
    var personalEmail = $("#personalEmail").val();
    var personalAddress = $("#personalDetailAddress").val(); 
    var personalPhone = $("#personalPhone").val();
    

    function validateEmail(personalEmail) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(personalEmail);
    }

    function validatePhone(personalPhone) {
        var phoneRegex = /^\d{11}$/;
        return phoneRegex.test(personalPhone);
    }

    function validateAddress(personalAddress) {
        return personalAddress.trim() !== "";
    }

    if (!validateEmail(personalEmail)) {
        alert("올바른 이메일 주소를 입력해주세요.");
        $("#personalEmail").focus();
        return false;
    }

    if (!validateAddress(personalAddress)) {
        alert("올바른 주소를 입력해주세요.");
        $("#personalDetailAddress").focus(); // 주소 입력란에 포커스를 맞춥니다.
        return false;
    }

    if (!validatePhone(personalPhone)) {
        alert("올바른 전화번호를 입력해주세요. (숫자만 입력)");
        $("#personalPhone").focus();
        return false;
    }

    return true;
}



