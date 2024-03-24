
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
    var personalAddress = $("#personalAddress").val(); 
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

$("#changeEmail").on("click", function(){
	$('#duplicateCheckBtn').show(); 
    $('#personalEmail').prop('disabled', false);
}) 


let address;

 $(function() {
	 
	address = $("#nowAddress").val();

	
	 
        $("#personalUpdateBtn").on("click", function(event) {
            event.preventDefault(); // 기본 제출 동작 방지
            
            if($("#personalEmail").val() == "" || $("#personalPhone").val() == "") {
				alert("빈 칸 없이 입력해 주세요.");
				return;
			} 
			
			if($("#nowAddress").val() == "") {
				address = $("#personal_post").val() + ", " + $("#personal_addr").val() + " " + $("#personalAddressDetail").val();
				if($("#personal_post").val() == "" || $("#personal_addr").val() == "" || $("#personalAddressDetail").val() == "") {
					alert("빈 칸 없이 입력해 주세요.");
					return;
				}
			} 
			
            
            alert($("#personalName").val() + "이름");
            alert($("#personalEmail").val() + "이메일");
            alert($("#personalBirth").val() + "생년월일");
            alert($("#nowAddress").val() + "현주소");
            alert($("#personal_post").val() + "바꾼 우편");
            alert($("#personal_addr").val() + "바꾼 주소");
            alert($("#personalAddressDetail").val() + "바꾼 상세 주소");
            
            
				
            
            // 수정 여부를 사용자에게 확인하기 위해 알림창을 표시합니다.
            if (confirm("개인 정보를 수정하시겠습니까?")) {
				
				alert(address);
                // 사용자가 확인을 누른 경우, AJAX를 통해 서버로 업데이트 요청을 전송합니다.
                $.ajax({
                    url: "/personalUpdate",
                    type: "POST",
                    data: {
						personalEmail : $("#personalEmail").val(),
						PersonalAddress : address,
						personalPhone : $("#personalPhone").val(),
					},
                    success: function(response) {
                        // 서버에서 성공적인 응답을 받았을 때 실행되는 부분
                        alert("개인 정보가 성공적으로 업데이트되었습니다.");
                        // 성공한 경우 페이지를 새로고침하여 변경된 정보를 반영할 수 있도록 한다.
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        alert("개인 정보 업데이트에 실패했습니다. 공백이 있는지 확인 후  다시 시도해 주세요.");
                        console.error(xhr.responseText);
                    }
                });
            } else { 
                return false;
            }
        });
        
        $("#movePwdChange").on("click", function() {
			window.location.href = "/newPasswd";
		})
        
        $("#matchingBtn").on("click", function () {
			window.location.href = "/personalMatchingView";
		})
		
		$("#freeBtn").on("click", function () {
			window.location.href = "/personalFreeView";
		})
		$("#likeBtn").on("click", function(){
			window.location.href = "/personalLikeView";
		})

});

$(document).ready(function() {
    $("#withdrawalBtn").click(function() {
        if (!confirm("정말 회원탈퇴 하시겠습니까?")) {
            return false; 
        }

        if (!confirm("탈퇴 후에는 복구할 수 없습니다. 정말 진행하시겠습니까?")) {
            return false; 
        }

        if (!confirm("정말로 마지막 경고입니다. 계속 진행하시겠습니까?")) {
            return false; 
        }
        $("#withdrawalForm").submit();
    });
});

 