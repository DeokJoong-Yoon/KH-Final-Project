

// 유효성 검사 함수를 전역으로 이동 (id랑 email은 중복확인이 필요하기때문)
function validateId(personalId) {
    var idRegex = /^[a-zA-Z0-9]{6,12}$/;
    return idRegex.test(personalId);
}

function validateEmail(personalEmail) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(personalEmail);
}

function checkId() {
    var personalId = $('#personalId').val();
    // 아이디 유효성 검사 추가
    if (!validateId(personalId)) {
        alert("아이디는 6~12자의 영문 또는 숫자로 입력해주세요.");
        $('#personalId').focus();
        return;
    }
    
    $.ajax({
        url: '/idCheck',
        type: 'post',
        data: { personalId: personalId },
        success: function (cnt) {
            if (cnt == 0) {
                alert("사용 가능한 아이디입니다!");
            } else {
                alert("중복된 아이디입니다. 다시 입력해주세요.");
                $('#personalId').val('');
            }
        },
        error: function () {
            alert("에러발생");
        }
    });
};

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
    var personalName = $("#personalName").val();
    var personalId = $("#personalId").val();
    var personalPasswd = $("#personalPasswd").val();
    var personalPasswdConfirm = $("#personalPasswdConfirm").val();
    var personalEmail = $("#personalEmail").val();
    var personalBirth = $("#personalBirth").val();
    var personalAddress = $("#personalAddress").val();
    var personalPhone = $("#personalPhone").val();
	



function validateId(personalId) {
    var idRegex = /^[a-zA-Z0-9]{6,12}$/;
    return idRegex.test(personalId);
}

function validateName(personalName) {
    var nameRegex = /^[가-힣a-zA-Z]{2,20}$/;
    return nameRegex.test(personalName);
}

function validatePassword(personalPasswd) {
    var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
    return passwordRegex.test(personalPasswd);
}

function validateEmail(personalEmail) {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(personalEmail);
}

function validateBirth(personalBirth) {
    var birthWithoutHyphen = personalBirth.replace(/-/g, ''); 
    var birthRegex = /^\d{4}\d{2}\d{2}$/;
    return birthRegex.test(birthWithoutHyphen);
}


function validatePhone(personalPhone) {
    var phoneRegex = /^\d{11}$/;
    return phoneRegex.test(personalPhone);
}

function validateAddress(personalAddress) {
    return personalAddress.trim() !== "";
}

	

    if (!validateId(personalId)) {
        alert("아이디는 6~12자의 영문 또는 숫자로 입력해주세요.");
        $("#personalId").focus();
        return false;
    }
     if (!validateName(personalName)) {
        alert("이름은 2~20자의 한글 또는 영문으로 입력해주세요.");
        $("#personalName").focus();
        return false;
    }

    if (!validatePassword(personalPasswd)) {
        alert("비밀번호는 최소 하나의 대문자, 소문자, 숫자, 특수문자를 포함한 8~20자여야 합니다.");
        $("#personalPasswd").focus();
        return false;
    }

    if (personalPasswd !== personalPasswdConfirm) {
        alert("비밀번호가 일치하지 않습니다.");
        $("#personalPasswdConfirm").focus();
        return false;
    }

    if (!validateEmail(personalEmail)) {
        alert("올바른 이메일 주소를 입력해주세요.");
        $("#personalEmail").focus();
        return false;
    }

    if (!validateBirth(personalBirth)) {
        alert("올바른 생년월일을 입력해주세요. (숫자 8자리 입력 - YYYYMMDD)");
        $("#personalBirth").focus();
        return false;
    }

    if (!validateAddress(personalAddress)) {
        alert("올바른 주소를 입력해주세요.");
        $("#personalAddress").focus();
        return false;
    }
    
    if (!validatePhone(personalPhone)) {
        alert("올바른 전화번호를 입력해주세요. (숫자만 입력)");
        $("#personalPhone").focus();
        return false;
    }

    return true;
}

$(document).ready(function() {
    $("#personalInsertBtn").click(function() {
        if (validateForm()) {
            if (confirm("회원가입을 완료하시겠습니까?")) {
                alert("회원가입이 완료되었습니다!");
                $("#f_joinForm").attr({
                    "method": "post",
                    "action": "/personalInsert"
                });
                $("#f_joinForm").submit();
            }
        }
    });
});
