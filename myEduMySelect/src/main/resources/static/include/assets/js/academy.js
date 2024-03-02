window.onload = function() {
	
	// 아이디 중복 체크 로직
	document.getElementById('check-duplicate').addEventListener('click', function() {
	    
	 
	    // 중복이 되었을 경우
	    if (duplicate) {
	        document.getElementById('duplicate-message').textContent = '이미 사용 중인 아이디입니다.';
	        document.getElementById('academy_id').value = ''; // 아이디 입력란 초기화
	        document.getElementById('academy_id').focus(); // 아이디 입력란에 포커스 설정
	        return;
	    }
	});
	
    // 담당자 전화번호 최대 11자리까지 제한 / 총 9,10,11자리 일 경우에 대한 모든 제어문
    var phoneInput = document.getElementById('academy_manager_phone');
    
    phoneInput.addEventListener('blur', function(event) {
        var input = event.target.value;
        input = input.replace(/\D/g, '');
        
        if (input.length === 9 || input.length === 10 || input.length === 11) {            
            var formattedNumber;
            if (/^\d{2}$/.test(input)) { // 앞 두 자리가 두 글자인 경우
                formattedNumber = input.replace(/(\d{2})(\d{3,4})(\d{4})/, '$1-$2-$3');
            } else if (/^\d{3}$/.test(input)) { // 앞 세 자리가 세 글자인 경우
                formattedNumber = input.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
            }
            event.target.value = formattedNumber;
        }
    });
    
    // 담당자 이메일 '직접입력' 클릭 시 텍스트박스 초기화 및 포커싱 
    document.getElementById('domain-list').addEventListener('change', function() {
	    var selectedValue = this.value;
	    var domainTxtInput = document.getElementById('domain-txt');
	
	    if (selectedValue === 'custom') {
	        domainTxtInput.value = ''; // 텍스트 박스 초기화
	        domainTxtInput.focus(); // 텍스트 박스에 포커스 설정
	    }
	});
	
	// 회원가입 버튼 클릭 이벤트 핸들러
	document.getElementById('submit-btn').addEventListener('click', function(event) {
    	event.preventDefault(); // 기본 동작 방지

	    // 필수 입력 사항을 체크할 요소들의 배열
	    var requiredInputs = document.querySelectorAll('input[required]');	
	    // 중복 체크가 필요한 요소들의 배열
	    var duplicateCheckInputs = document.querySelectorAll('.duplicate-check');	
	    // 포커스를 이동할 대상을 담을 변수
	    var targetInput = null;
	
	    // 필수 입력 사항 검사
	    for (var i = 0; i < requiredInputs.length; i++) {
	        if (!requiredInputs[i].value) {
	            targetInput = requiredInputs[i];
	            break; // 첫 번째로 발견된 빈 필드에 포커스 설정
	        }
	    }
	
	    // 중복 체크 검사
	    if (!targetInput) {
	        for (var j = 0; j < duplicateCheckInputs.length; j++) {
	            var duplicateMessage = duplicateCheckInputs[j].nextElementSibling;
	            if (duplicateMessage.textContent) {
	                targetInput = duplicateCheckInputs[j];
	                break; // 첫 번째로 발견된 중복되지 않은 필드에 포커스 설정
	            }
	        }
	    }
	
	    // 포커스 이동
	    if (targetInput) {
	        targetInput.focus();
	    } else {
	        // 모든 조건을 만족했을 경우 회원가입 프로세스 진행
	        document.getElementById('#join').submit();
	    }
	});


    
};
    
	