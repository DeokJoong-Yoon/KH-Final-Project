// 선택된 조건의 내용을 담을 변수 선언
    var academyId, academyNumber,  academyPasswd, academyName,
    	guValue, dongValue, roadValue, academyPhone, managerName,
    	managerEmail, managerPhone, targetGrade, targetSubject,
    	keywordValue, fee, passwdChange, loginFail, accountDate;
    	
    /* 회원가입 버튼 클릭 이벤트 핸들러 */
	document.getElementById('submit-btn').addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 동작 방지
	 
	    // 필수 입력 사항을 체크할 요소들의 배열*/
	    var requiredInputs = document.querySelectorAll('input[required]');
	    // 중복 체크가 필요한 요소들의 배열
	    var duplicateCheckInputs = document.querySelectorAll('.duplicate-check');
	    // 모든 필드를 포함한 배열
	    var allInputs = Array.from(requiredInputs).concat(Array.from(duplicateCheckInputs));
	    // 포커스를 이동할 대상을 담을 변수
	    var targetInput = null;
	    
	    // 미입력 필드 확인
	    for (var i = 0; i < requiredInputs.length; i++) {
	        if (!requiredInputs[i].value) {
	            // 해당 필드로 스크롤 이동
	            requiredInputs[i].scrollIntoView({ block: 'center' });
	            // 해당 필드에 포커스 설정
	            requiredInputs[i].focus();
	            // targetInput에 할당하여 유효성 검사
	            targetInput = requiredInputs[i];
	            break; // 첫 번째로 발견된 빈 필드에 포커스 설정
	        }
	    }
	    
	    if ($("#duplicate-message").text() === '사용 가능한 아이디입니다.') {
            // 중복체크가 해소되면 다른 필드들에 대한 빈 값 체크
            if (!chkData("#academyPasswd", "비밀번호를")) return;
            if (!chkData("#academyNumber", "사업자등록번호를")) return;
            if (!chkData("#academyManagerName", "담당자이름을")) return;
            if (!chkData("#academyManagerEmail", "담당자이메일을")) return;
            if (!chkData("#academyManagerPhone", "담당자전화번호를")) return;
            if (!chkData("#academyName", "학원명을")) return;
            if (!chkData("#academyGuAddress", "행정구역명을")) return;
            if (!chkData("#academyRoadAddress", "도로명주소를")) return;
            if (!chkData("#academyDongAddress", "상세주소를")) return;
            if (!chkData("#academyPhone", "학원전화번호를")) return;
            if (!chkRadioData("#subject1", "#subject2", "#subject3", "#subject4", "#subject5", 
            "#subject6", "#subject7", "#subject8", "#subject9", "#subject10", "#subject11", 
            "#subject12", "#subject13", "#subject14", "#subject15", "#subject16", "#subject17", "#subject18", "교습과목을")) return;
            if (!chkRadioData("#fee1", "#fee2", "#fee3", "#fee4", "#fee5", "#fee6", "#fee7", "수강료를")) return;
            if (!chkRadioData("#grade1", "#grade2", "#grade3", "#grade4", "#grade5", "#grade6", "대상학년을")) return;
            if (!chkCheckboxData("#academyKeyword1", "#academyKeyword2", "#academyKeyword3", 
            "#academyKeyword4", "#academyKeyword5", "#academyKeyword6", "#academyKeyword7", 
            "#academyKeyword8", "#academyKeyword9", "#academyKeyword10", "#academyKeyword11", 
             "#academyKeyword12", "#academyKeyword13", "#academyKeyword14", "#academyKeyword15",
              "#academyKeyword16", "#academyKeyword17","키워드를")) return; 
            
        } else {
            // 아이디 중복 체크가 되지 않은 경우 메시지 출력
            alert("아이디 중복 체크를 해주세요.");
            $("#academyId").focus();
        }
		
	    // 중복 체크 필드 확인
	    if (!chkData && !chkRadioData && !chkCheckboxData) {
	        for (var i = 0; i < duplicateCheckInputs.length; i++) {
	            if (!duplicateCheckInputs[i].value) {
	                // 해당 필드로 스크롤 이동
	                duplicateCheckInputs[i].scrollIntoView({ block: 'center' });
	                // 해당 필드에 포커스 설정
	                duplicateCheckInputs[i].focus();
	                // targetInput에 할당하여 유효성 검사
	                targetInput = duplicateCheckInputs[i];
	                break; // 첫 번째로 발견된 빈 필드에 포커스 설정
	            }
	        }
	    }
		
		// 변수에 선택된 value 저장
		academyId = $("#academyId").val();
	    memberTypeId = $("#memberTypeId").val();
		academyNumber = $("#academyNumber").val();
		joinDate = $("#academyJoinDate").val();
		academyPasswd = $("#academyPasswd").val();
		academyName = $("#academyName").val();
		guValue = $("#academyGuAddress").val();
		dongValue = $("#academyDongAddress").val();
		roadValue = $("#academyRoadAddress").val();
		academyPhone = $("#academyPhone").val();
		managerName = $("#academyManagerName").val();
		managerEmail = $("#academyManagerEmail").val();
		managerPhone = $("#academyManagerPhone").val();
		targetGrade = $("input[name='academyTargetGrade']:checked").val();
		targetSubject = $("input[name='academyTargetSubject']:checked").val();		 
		fee = $("input[name='academyFee']:checked").val();
		passwdChange = $("#academyPasswdChangeDate").val();
		loginFail = $("#academyLoginFailCount").val();
		accountDate= $("#academyAccountBannedDate").val();		 
		keywordValue = [];
		$("input[name='keyword']:checked").each(function() {
		 	keywordValue.push($(this).val());
		}) 
		
		for(let i = 0; i < keywordValue.length; i++) {
			$("input[name='keyword" + (i+1) + "']").val(keywordValue[i]);
		}
				
		// 회원가입 정보들 value에 저장
 		let value = {
			 academyId : academyId,
			 academyNumber : academyNumber,
			 academyPasswd : academyPasswd,
			 academyName : academyName,
			 academyGuAddress : guValue,
			 academyDongAddress : dongValue,
			 academyRoadAddress : roadValue,
			 academyPhone : academyPhone,
			 academyManagerName : managerName,
			 academyManagerEmail : managerEmail,
			 academyManagerPhone : managerPhone,
			 academyTargetGrade : targetGrade,
			 academyTargetSubject : targetSubject,
			 academyFee : fee,
			 academyPasswdChangeDate : passwdChange,
			 academyLoginFailCount : loginFail,
			 academyAccountBannedDate : accountDate,
			 academyKeyword1: keywordValue[0],
		     academyKeyword2: keywordValue[1],
		     academyKeyword3: keywordValue[2],
		     academyKeyword4: keywordValue[3],
		     academyKeyword5: keywordValue[4]
	    }            
		
	    // 유효성 검사 후 회원가입 프로세스 진행
	    if (!targetInput) {
	        // 모든 조건을 만족했을 경우 회원가입 정보 저장 AJAX 요청
	        $.ajax({
	            url: "/insertAcademy", 
	            type: "POST",
	            headers : {
					"Content-Type" : "application/json"
				},
	            data: JSON.stringify(value),
	            success: function(data) {
					alert('회원가입이 완료되었습니다.');
					if(data == "TRUE") {
						window.location.href="/academy/join/complete";
					}
	            },
	            error: function(xhr, status, error) {
	            }
	        });
	    }
	});
	
/* 유효성 검사 */	
$(document).ready(function() {
	
    /* 아이디 중복 체크 버튼에 클릭 이벤트 핸들러 등록 */
    $(document).on('click', '#checkDuplicateBtn', function(event) {
       event.preventDefault(); // 기본 동작 방지
       
        // 입력된 아이디 가져오기
        var academyId = $('#academyId').val();
		
		// 잘못된 값 입력 후 중복체크 버튼 클릭 시 제어 (db에서는 중복된 값이 없으므로 '사용 가능한 아이디입니다'를 반환하기 때문)
	    const idRegex = /^[a-zA-Z0-9]{6,12}$/;
	    if (!idRegex.test(academyId)) {
	        alert("아이디를 올바른 형식으로 입력 후 다시 중복체크 버튼을 눌러주세요");
	        return; // 유효성 검사를 통과하지 못하면 중복 체크를 수행하지 않음
	    }
		
        // AJAX를 이용하여 서버로 중복 체크 요청
        $.ajax({
            url: "/checkId", // 중복 체크를 수행하는 컨트롤러의 URL
            type: "POST",
            data: {academyId: academyId},
            success: function(response) {
                // 서버로부터의 응답에 따라 중복 메시지 표시
                if (response == 0) {
                    $('#duplicate-message').text('사용 가능한 아이디입니다.');
                } else {
                    $('#duplicate-message').text('이미 사용 중인 아이디입니다.');
                }
            },
            error: function(xhr, status, error) {
            }
        });
    });
    
    /* 아이디 유효성 검사 */
    $('#academyId').on('input', function() {
        const idInput = $(this).val();
        const idRegex = /^[a-zA-Z0-9]{6,12}$/;
        const idError = $('#duplicate-message');
        
        if (!idRegex.test(idInput)) {
            idError.text('아이디는 6~12자의 영문, 숫자만 사용 가능합니다.');
        } else {
            idError.text('');
        }
    });
    
    /* 이메일 중복 체크 버튼에 클릭 이벤트 핸들러 등록 */
	$(document).on('click', '#emailCheckBtn', function(event) {
	    event.preventDefault(); // 기본 동작 방지
	
	    // 입력된 이메일 유효성 검사
	    const emailAddress = $('#academyManagerEmail').val();
	    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	    if (!emailRegex.test(emailAddress)) {
	        alert("이메일을 올바른 형식으로 입력 후 다시 중복체크 버튼을 눌러주세요");
	        return;
	    }
	
	    // 이메일 중복 체크 함수 호출
	    checkEmailDuplication(emailAddress);
	});	
	
	
	/* 이메일 중복 체크 함수 */
	function checkEmailDuplication(emailAddress) {
	    // AJAX를 이용하여 서버로 중복 체크 요청
	    $.ajax({
	        url: "/checkEmail", // 중복 체크를 수행하는 컨트롤러의 URL
	        type: "POST",
	        data: {academyManagerEmail: emailAddress}, // 서버로 전송할 데이터
	        success: function(response) {
	            // 서버로부터의 응답에 따라 중복 메시지 표시
	            if (response == 0) {
	                $('#email-check-message').text('사용 가능한 이메일 주소입니다.');
	                // 이메일 주소를 입력 필드에 채우고 readonly 처리
	                $('#academyManagerEmail').val(emailAddress).prop('readonly', true);
	            } else {
	                $('#email-check-message').text('이미 사용 중인 이메일 주소입니다, 다시 입력해주세요.');
	            }
	        },
	        error: function(xhr, status, error) {
	        }
	    });
	}
	
    /* 담당자 전화번호 유효성 검사 */
	$('#academyManagerPhone').on('input', function() {
	    const phoneInput = $(this).val();
	    const phoneRegex = /^[0-9]+$/; // 숫자만 허용
	    const phoneError = $('#managerPhoneError');
	    
	    if (!phoneRegex.test(phoneInput)) {
	        phoneError.text('담당자 전화번호는 숫자만 입력 가능합니다.');
	    } else {
	        phoneError.text('');
	    }
	});
    
    // 키워드 체크박스 클릭 이벤트 핸들러
    $(".keyword-checkbox").on("click", function() {
        // 최대 5개까지 선택 가능하도록 제어
        if (this.checked) {
            if ($(".keyword-checkbox:checked").length > 5) {
                this.checked = false; // 선택 취소
                alert('키워드는 최대 5개의 항목만 선택할 수 있습니다.');
            }
        }
    });
        
    /* 사업자등록번호 검색 이벤트 핸들러 등록 */
    $(document).on('click', '#searchDuplicateBtn', function(event) {
        event.preventDefault(); // 기본 동작 방지
	
        // 입력된 사업자등록번호 가져오기
        var academyNumber = $('#academyNumber').val();

        // AJAX를 이용하여 서버로 중복 체크 요청
        $.ajax({
		    url: "/findByNumber", // 중복 체크를 수행하는 컨트롤러의 URL
		    type: "POST",
		    data: {academyNumber: academyNumber}, // 요청할 때 필요한 데이터
		    success: function(response) {
		        // 서버로부터의 응답에 따라 중복 메시지 표시
		        if (response) {
		            // 사용 가능한 사업자등록번호인 경우 해당 번호를 입력 필드에 채우고 readonly 처리
		            $('#academyNumber').val(response.academyNumber).prop('readonly', true); 
		            $('#search-message').text('정상적으로 입력되었습니다.');
		
		            // 추가 정보를 조회하여 모든 필드에 값을 입력하고 readonly 처리 
		            $('#academyName').val(response.academyName).prop('readonly', true);
		            $('#academyGuAddress').val(response.academyGuAddress).prop('readonly', true);
		            $('#academyRoadAddress').val(response.academyRoadAddress).prop('readonly', true);
		            $('#academyDongAddress').val(response.academyDongAddress).prop('readonly', true);
		        } else {
		            // 사용할 수 없는 사업자등록번호인 경우 
		            $('#academyNumber').prop('readonly', false); // readonly 해제
		            $('#search-message').text('해당하는 사업자번호가 존재하지 않습니다. 다시 입력 후 검색버튼을 눌러주세요.');
		
		            // 추가 정보를 조회하여 모든 필드에 값을 입력하고 readonly 처리
		            $('#academyName').val('').prop('readonly', false);
		            $('#academyGuAddress').val('').prop('readonly', false);
		            $('#academyRoadAddress').val('').prop('readonly', false);
		            $('#academyDongAddress').val('').prop('readonly', false);
		        }
		    },
		    error: function(xhr, status, error) {				
		    }
		});
    });
});

/* 담당자 이름 유효성 검사 */
document.addEventListener('DOMContentLoaded', function() {
    const managerNameInput = document.getElementById('academyManagerName');
    const regex = /^[a-zA-Z가-힣]+$/; // 한글과 영문 대소문자만 허용하는 정규표현식
    
    managerNameInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(managerNameInput, '담당자 이름은 한글 또는 영문 대소문자만 입력 가능합니다.');
        } else {
            hideErrorMessage(managerNameInput);
        }
    });
    
    /* 유효성 실패 시 메시지 노출 */
    function showErrorMessage(inputElement, message) {
        const parentElement = inputElement.parentElement;
        let errorMessageElement = parentElement.querySelector('.error-message');
        if (!errorMessageElement) {
            errorMessageElement = document.createElement('span');
            errorMessageElement.className = 'error-message';
            parentElement.appendChild(errorMessageElement);
        }
        errorMessageElement.textContent = message;
    }
    
    /* 유효성 성공 시 메시지 가리기 */
    function hideErrorMessage(inputElement) {
        const parentElement = inputElement.parentElement;
        const errorMessageElement = parentElement.querySelector('.error-message');
        if (errorMessageElement) {
            parentElement.removeChild(errorMessageElement);
        }
    }
}); 

/* 학원전화번호, 담당자전화번호, 사업자등록번호 입력 필드 유효성 검사 */
document.addEventListener('DOMContentLoaded', function() {
    const managerPhoneInput = document.getElementById('academyManagerPhone');
    const academyPhoneInput = document.getElementById('academyPhone');
    const academyNumberInput = document.getElementById('academyNumber');
    const regex = /^[0-9]*$/; 
    
    managerPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(managerPhoneInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(managerPhoneInput);
        }
    });
    
    academyPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(academyPhoneInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(academyPhoneInput);
        }
    });
    
    academyNumberInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(academyNumberInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(academyNumberInput);
        }
    });
    
    /* 유효성 실패 시 메시지 노출 */
    function showErrorMessage(inputElement, message) {
        const parentElement = inputElement.parentElement;
        let errorMessageElement = parentElement.querySelector('.error-message');
        if (!errorMessageElement) {
            errorMessageElement = document.createElement('span');
            errorMessageElement.className = 'error-message';
            parentElement.appendChild(errorMessageElement);
        }
        errorMessageElement.textContent = message;
    }
    
    /* 유효성 성공 시 메시지 가리기 */
    function hideErrorMessage(inputElement) {
        const parentElement = inputElement.parentElement;
        const errorMessageElement = parentElement.querySelector('.error-message');
        if (errorMessageElement) {
            parentElement.removeChild(errorMessageElement);
        }
    }
});


// 비밀번호 확인 체크 이벤트 부여
document.getElementById('academyPasswd').addEventListener('input', function() {
  checkPassword();
});
document.getElementById('academyPasswd2').addEventListener('input', function() {
  checkPassword();
});

// 비밀번호 무결성 체크 로직
function checkPasswordStrength(password) {
    // 최소 8자리, 최대 20자리
    if (password.length < 8 || password.length > 20) {
        return false;
    }
    // 대문자/소문자/숫자/특수문자 중 하나 포함
    const regex = /(?=.*[a-z])|(?=.*[A-Z])|(?=.*[0-9])|(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}/;
    return regex.test(password);
}

function checkPassword() {
    const password = document.getElementById("academyPasswd").value;
    const passwordConfirm = document.getElementById("academyPasswd").value;
    const passwordConfirm2 = document.getElementById("academyPasswd2").value;
    const passwordCheckMessage = document.getElementById("password-check-message");

    // 비밀번호 강도 검사
    if (!checkPasswordStrength(password)) {
        passwordCheckMessage.textContent = "비밀번호는 8~20자 이내, 대문자/소문자/숫자/특수문자 중 하나를 포함해야 합니다.";
        return;
    }

    // 비밀번호 일치 여부 검사
    if (password !== passwordConfirm) {
        passwordCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
    } else {
        passwordCheckMessage.textContent = "비밀번호가 일치합니다.";
    }
    
    if (password !== passwordConfirm2) {
        passwordCheckMessage.textContent = "비밀번호가 일치하지 않습니다.";
    } else {
        passwordCheckMessage.textContent = "비밀번호가 일치합니다.";
    }
}

// academy_passwd2 필드에 입력값이 변경될 때마다 비밀번호 확인 체크 함수 호출
document.getElementById('academyPasswd2').addEventListener('input', function() {
    checkPassword();
});

// academy_passwd 필드에 입력값이 변경될 때마다 비밀번호 확인 체크 함수 호출
document.getElementById('academyPasswd').addEventListener('input', function() {
    checkPassword();
});

/* 아래부터 main.js 파일 */				
(function() {
	"use strict";

	/**
	 * Easy selector helper function
	 */
	const select = (el, all = false) => {
		el = el.trim()
		if (all) {
			return [...document.querySelectorAll(el)]
		} else {
			return document.querySelector(el)
		}
	}

	/**
	 * Easy event listener function
	 */
	const on = (type, el, listener, all = false) => {
		let selectEl = select(el, all)
		if (selectEl) {
			if (all) {
				selectEl.forEach(e => e.addEventListener(type, listener))
			} else {
				selectEl.addEventListener(type, listener)
			}
		}
	}

	/**
	 * Easy on scroll event listener 
	 */
	const onscroll = (el, listener) => {
		el.addEventListener('scroll', listener)
	}

	/**
	 * Navbar links active state on scroll
	 */
	let navbarlinks = select('#navbar .scrollto', true)
	const navbarlinksActive = () => {
		let position = window.scrollY + 200
		navbarlinks.forEach(navbarlink => {
			if (!navbarlink.hash) return
			let section = select(navbarlink.hash)
			if (!section) return
			if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
				navbarlink.classList.add('active')
			} else {
				navbarlink.classList.remove('active')
			}
		})
	}
	window.addEventListener('load', navbarlinksActive)
	onscroll(document, navbarlinksActive)

	/**
	 * Scrolls to an element with header offset
	 */
	const scrollto = (el) => {
		let header = select('#header')
		let offset = header.offsetHeight

		let elementPos = select(el).offsetTop
		window.scrollTo({
			top: elementPos - offset,
			behavior: 'smooth'
		})
	}

	/**
	 * Toggle .header-scrolled class to #header when page is scrolled
	 */
	let selectHeader = select('#header')
	if (selectHeader) {
		const headerScrolled = () => {
			if (window.scrollY > 100) {
				selectHeader.classList.add('header-scrolled')
			} else {
				selectHeader.classList.remove('header-scrolled')
			}
		}
		window.addEventListener('load', headerScrolled)
		onscroll(document, headerScrolled)
	}

	/**
	 * Back to top button
	 */
	let backtotop = select('.back-to-top')
	if (backtotop) {
		const toggleBacktotop = () => {
			if (window.scrollY > 100) {
				backtotop.classList.add('active')
			} else {
				backtotop.classList.remove('active')
			}
		}
		window.addEventListener('load', toggleBacktotop)
		onscroll(document, toggleBacktotop)
	}

	/**
	 * Mobile nav toggle
	 */
	on('click', '.mobile-nav-toggle', function(e) {
		select('#navbar').classList.toggle('navbar-mobile')
		this.classList.toggle('bi-list')
		this.classList.toggle('bi-x')
	})

	/**
	 * Mobile nav dropdowns activate
	 */
	on('click', '.navbar .dropdown > a', function(e) {
		if (select('#navbar').classList.contains('navbar-mobile')) {
			e.preventDefault()
			this.nextElementSibling.classList.toggle('dropdown-active')
		}
	}, true)

	/**
	 * Scrool with ofset on links with a class name .scrollto
	 */
	on('click', '.scrollto', function(e) {
		if (select(this.hash)) {
			e.preventDefault()

			let navbar = select('#navbar')
			if (navbar.classList.contains('navbar-mobile')) {
				navbar.classList.remove('navbar-mobile')
				let navbarToggle = select('.mobile-nav-toggle')
				navbarToggle.classList.toggle('bi-list')
				navbarToggle.classList.toggle('bi-x')
			}
			scrollto(this.hash)
		}
	}, true)

	/**
	 * Scroll with ofset on page load with hash links in the url
	 */
	window.addEventListener('load', () => {
		if (window.location.hash) {
			if (select(window.location.hash)) {
				scrollto(window.location.hash)
			}
		}
	});

	/**
	 * Preloader
	 */
	let preloader = select('#preloader');
	if (preloader) {
		window.addEventListener('load', () => {
			preloader.remove()
		});
	}

	/**
	 * Initiate  glightbox 
	 */
	const glightbox = GLightbox({
		selector: '.glightbox'
	});

	/**
	 * Skills animation
	 */
	let skilsContent = select('.skills-content');
	if (skilsContent) {
		new Waypoint({
			element: skilsContent,
			offset: '80%',
			handler: function(direction) {
				let progress = select('.progress .progress-bar', true);
				progress.forEach((el) => {
					el.style.width = el.getAttribute('aria-valuenow') + '%'
				});
			}
		})
	}

	/**
	 * Porfolio isotope and filter
	 */
	window.addEventListener('load', () => {
		let portfolioContainer = select('.portfolio-container');
		if (portfolioContainer) {
			let portfolioIsotope = new Isotope(portfolioContainer, {
				itemSelector: '.portfolio-item'
			});

			let portfolioFilters = select('#portfolio-flters li', true);

			on('click', '#portfolio-flters li', function(e) {
				e.preventDefault();
				portfolioFilters.forEach(function(el) {
					el.classList.remove('filter-active');
				});
				this.classList.add('filter-active');

				portfolioIsotope.arrange({
					filter: this.getAttribute('data-filter')
				});
				portfolioIsotope.on('arrangeComplete', function() {
					AOS.refresh()
				});
			}, true);
		}

	});

	/**
	 * Initiate portfolio lightbox 
	 */
	const portfolioLightbox = GLightbox({
		selector: '.portfolio-lightbox'
	});

	/**
	 * Portfolio details slider
	 */
	new Swiper('.portfolio-details-slider', {
		speed: 400,
		loop: true,
		autoplay: {
			delay: 5000,
			disableOnInteraction: false
		},
		pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
			clickable: true
		}
	});

	/**
	 * Animation on scroll
	 */
	window.addEventListener('load', () => {
		AOS.init({
			duration: 1000,
			easing: "ease-in-out",
			once: true,
			mirror: false
		});
	});

})()	