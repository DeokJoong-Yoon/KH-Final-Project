$(document).ready(function() {
	
    /* 중복 체크 버튼에 클릭 이벤트 핸들러 등록 */
    $(document).on('click', '#checkDuplicateBtn', function(event) {
       event.preventDefault(); // 기본 동작 방지
	
        // 입력된 아이디 가져오기
        var academyId = $('#academyId').val();
		
		// 잘못된 값 입력 후 중복체크 버튼 클릭 시 제어
		// (db에서는 중복된 값이 없으므로 '사용 가능한 아이디입니다'를 반환하기 때문)
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
                console.error("서버 에러 발생: " + error);
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
		            // 이미 사용 중인 사업자등록번호인 경우
		            $('#academyNumber').val(response.academyNumber).prop('readonly', true); // 해당 번호를 입력 필드에 채우고 readonly 처리
		            $('#search-message').text('정상적으로 입력되었습니다.');
		
		            // 추가 정보를 조회하여 모든 필드에 값을 입력하고 readonly 처리
		            $('#academyName').val(response.academyName).prop('readonly', true);
		            $('#academyGuAddress').val(response.academyGuAddress).prop('readonly', true);
		            $('#academyRoadAddress').val(response.academyRoadAddress).prop('readonly', true);
		            $('#academyDongAddress').val(response.academyDongAddress).prop('readonly', true);
		        } else {
		            // 사용 가능한 사업자등록번호인 경우
		            $('#academyNumber').prop('readonly', false); // readonly 해제
		            $('#search-message').text('해당하는 사업자번호가 존재하지 않습니다. 다시 입력 후 검색버튼을 눌러주세요.');
		
		            // 추가 정보 필드의 값을 초기화하고 readonly 상태 해제
		            $('#academyName').val('').prop('readonly', false);
		            $('#academyGuAddress').val('').prop('readonly', false);
		            $('#academyRoadAddress').val('').prop('readonly', false);
		            $('#academyDongAddress').val('').prop('readonly', false);
		        }
		    },
		    error: function(xhr, status, error) {
		        console.error("서버 에러 발생: " + error);
		    }
		});
    });
    
    
	/* 키워드 선택 최대 5개까지 제어 */
	var selectedKeywords = []; // 사용자가 선택한 키워드를 저장할 배열
    // 체크박스를 클릭할 때마다 선택된 항목을 추적하여 배열에 저장
    $('input[name="academyKeyword"]').change(function() {
        var keywordSelect = $('input[name="academyKeyword"]:checked');
        selectedKeywords = []; // 배열 초기화
        keywordSelect.each(function() {
            selectedKeywords.push($(this).val());
        });

        // 최대 선택 항목 수를 확인하고 초과할 경우 마지막 항목을 해제
        if (selectedKeywords.length > 5) {
            alert('키워드는 최대 5개까지 선택 가능합니다.');
            keywordSelect.last().prop('checked', false);
            selectedKeywords.pop(); // 배열에서도 마지막 항목 제거
        }
    });

    // 선택된 조건의 내용을 담을 변수 선언
    let academyId, memberTypeId, academyNumber, joinDate, academyPasswd, academyName,
    	guValue, dongValue, roadValue, academyPhone, managerName,
    	managerEmail, managerPhone, targetGrade, targetSubject,
    	keywordValue, fee, passwdChange, loginFail, accountDate;
    	
	
    
    /* 회원가입 버튼 클릭 이벤트 핸들러 */
	document.getElementById('submit-btn').addEventListener('click', function(event) {
	    event.preventDefault(); // 기본 동작 방지
	
	    // 필수 입력 사항을 체크할 요소들의 배열
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

	    // 중복 체크 필드 확인
	    if (!targetInput) {
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
	    	
		// 사용자가 선택한 키워드를 배열로 저장
	    keywordSelect = [];
	    $('input[name="academyKeyword"]:checked').each(function() {
	        keywordSelect.push($(this).val());
	    });
		console.log(keywordValue.length);
		for(let i = 0; i < keywordValue.length;i++) {
			$("input[name='academyKeyword" + (i+1) + "']").val(keywordValue[i]);
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
		 managerName = $("#academyManagerPhone").val();
		 managerEmail = $("#academyManagerEmail").val();
		 managerPhone = $("#academyManagerPhone").val();
		 targetGrade = $("input[name='academyTargetGrade']:checked").val();
		 targetSubject = $("#academyTargetSubject").val();		 
		 fee = $("input[name='academyFee']:checkded").val();
		 passwdChange = $("#academyPasswdChangeDate").val();
		 loginFail = $("#academyLoginFailCount").val();
		 accountDate= $("#academyAccountBannedDate")	
		 keywordValue = [];
		 $("input[name='academyKeyword']:checked").each(function() {
             keywordValue.push($(this).val());
         });
		
		 academyId, memberTypeId, academyNumber, joinDate, academyPasswd, academyName,
    	guValue, dongValue, roadValue, academyPhone, managerName,
    	managerEmail, managerPhone, targetGrade, targetSubject,
    	keywordValue, fee, passwdChange, loginFail, accountDate;
		
		
		
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
			 academyManagerPhone : managerName,
			 academyManagerEmail : managerEmail,
			 academyManagerPhone : managerPhone,
			 academyTargetGrade : targetGrade,
			 academyTargetSubject : targetSubject,
			 academyFee : fee,
			 academyPasswdChangeDate : passwdChange,
			 academyLoginFailCount : loginFail,
			 academyAccountBannedDate : accountDate,
			 academyKeyword1 : keywordValue[0],
			 academyKeyword2 : keywordValue[1],
			 academyKeyword3 : keywordValue[2],
			 academyKeyword4 : keywordValue[3],
			 academyKeyword5 : keywordValue[4]
	    }            
		
	    // 유효성 검사 후 회원가입 프로세스 진행
	    if (!targetInput) {
	        
	 		
	        // 모든 조건을 만족했을 경우 회원가입 프로세스 진행
	        // 회원가입 정보 저장 AJAX 요청
	        $.ajax({
	            url: "/academyInsert", // 키워드 저장을 수행하는 컨트롤러의 URL
	            type: "POST",
	            headers : {
					"Content-Type" : "application/json"
				},
	            data: JSON.stringify(value),
	            dataType : "json",
	            success: function(data) {
					console.log(data);
					
	                alert('회원가입이 완료되었습니다.');
	                // 저장 후 필요한 작업 수행
	                // 회원가입 폼 제출
	                document.getElementById('join').submit();
	            },
	            error: function(xhr, status, error) {
	                console.error("서버 에러 발생: " + error);
	            }
	        });
	    }
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
    
    function hideErrorMessage(inputElement) {
        const parentElement = inputElement.parentElement;
        const errorMessageElement = parentElement.querySelector('.error-message');
        if (errorMessageElement) {
            parentElement.removeChild(errorMessageElement);
        }
    }
}); 

/* 교습과목 유효성 검사 */
document.addEventListener('DOMContentLoaded', function() {
    const subjectInput = document.getElementById('academyTargetSubject');

    subjectInput.addEventListener('input', function(event) {
        const inputValue = event.target.value.trim();

        if (/^[가-힣]*$/.test(inputValue)) { // 한글만 포함된 경우
            hideErrorMessage();
        } else { // 다른 문자가 포함된 경우
            showErrorMessage('교습과목은 공백, 특수문자 없이 한글로만 입력해주세요.');
        }
    }); 

    function showErrorMessage(message) {
        const parentElement = subjectInput.parentElement;
        let errorMessageElement = parentElement.querySelector('.error-message');
        if (!errorMessageElement) {
            errorMessageElement = document.createElement('span');
            errorMessageElement.className = 'error-message';
            parentElement.appendChild(errorMessageElement);
        }
        errorMessageElement.textContent = message;
    }

    function hideErrorMessage() {
        const parentElement = subjectInput.parentElement;
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
    
    const regex = /^[0-9]*$/; // 숫자만 허용하는 정규표현식
    
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


/* 담당자 이메일 제어 */
const domainTxt = document.getElementById('academyManagerEmail2'); 
const domainList = document.getElementById('domain-list');
const emailError = document.getElementById('email-error');

// select 옵션 변경 이벤트 처리
domainList.addEventListener('change', function() {
    const selectedValue = this.value;

    // 'custom' 선택 시
    if (selectedValue === 'custom') {
        // domain-txt 필드 초기화
        domainTxt.value = '';
        // 포커스 설정
        domainTxt.focus();
        // 읽기 전용 해제
        domainTxt.removeAttribute('readonly');
        // 에러 메시지 초기화
        emailError.textContent = '';
    } else {
        // 선택한 값으로 domain-txt 필드 값 설정
        domainTxt.value = selectedValue;
        // 읽기 전용으로 설정
        domainTxt.setAttribute('readonly', true);
    }
});

/* 수강료, 대상학년, 키워드 부분 컬럼 배치
const specificInputGroup = document.querySelector('.specific-input-group');

specificInputGroup.style.display = 'flex';
specificInputGroup.style.flexDirection = 'row';
specificInputGroup.style.justifyContent = 'space-between';
*/

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

/* 마이페이지 버튼 클릭 시 세션값 확인 후 결과에 따라 제어 */
document.getElementById("mypageBtn").addEventListener("click", function(event) {
    if (!commonLogin) {
		event.preventDefault();
        alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
        window.location.href = "/academyaccount/login";
	} else {
        window.location.href = "/academyaccount/mypage"; // 세션값이 있을 경우 마이페이지로 이동
    }
});


				
    
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