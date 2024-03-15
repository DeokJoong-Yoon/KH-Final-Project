$(document).ready(function() {
    // 중복 체크 버튼에 클릭 이벤트 핸들러 등록
    //$(document).on('click', '#checkDuplicateBtn', function(event) {
        //
	$('#join').submit(function(event) {
		event.preventDefault(); // 기본 동작 방지
	
        // 입력된 아이디 가져오기
        var academyId = $('#academyId').val();

        // AJAX를 이용하여 서버로 중복 체크 요청
        $.ajax({
            url: "/checkDuplicate", // 중복 체크를 수행하는 컨트롤러의 URL
            type: "POST",
            data: {academyId: academyId},
            success: function(response) {
                // 서버로부터의 응답에 따라 중복 메시지 표시
                if (response === "true") {
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
    
    // 사업자등록번호 검색 이벤트 핸들러 등록



    // 회원가입 폼 제출 이벤트 처리
    document.getElementById('join').addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 동작 방지
        
        var duplicateMessage = document.getElementById('duplicate-message').textContent;

        // 중복 체크 결과에 따라 제어
        if (duplicateMessage === '이미 사용 중인 아이디입니다.') {
            alert('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
        } else {
            // 중복된 아이디가 없을 경우 폼 제출
            this.submit();
        }
    });
});



/* 학원전화번호, 담당자전화번호, 사업자등록번호 입력 필드 (-)하이폰 기호 유효성 검사 */
document.addEventListener('DOMContentLoaded', function() {
    const managerPhoneInput = document.getElementById('academyManagerPhone');
    const academyPhoneInput = document.getElementById('academyPhone');
    const academyNumberInput = document.getElementById('academyNumber');
    
    managerPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (inputValue.includes('-')) {
            showErrorMessage(managerPhoneInput, '하이픈 기호를 제외한 전화번호를 입력해주세요.');
        } else {
            hideErrorMessage(managerPhoneInput);
        }
    });
    
    academyPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (inputValue.includes('-')) {
            showErrorMessage(academyPhoneInput, '하이픈 기호를 제외한 전화번호를 입력해주세요.');
        } else {
            hideErrorMessage(academyPhoneInput);
        }
    });
    
    academyNumberInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (inputValue.includes('-')) {
            showErrorMessage(academyNumberInput, '하이픈 기호를 제외한 사업자 등록번호 10자리를 입력해주세요.');
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

/*// 담당자 전화번호 최대 11자리까지 제한 / 총 9,10,11자리 일 경우에 대한 모든 제어문
var AcademyManagerPhoneInput = document.getElementById('academyManagerPhone');

AcademyManagerPhoneInput.addEventListener('blur', function(event) {
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
});*/


// 담당자 이메일 제어
const domainTxt = document.getElementById('academyManagerEmail2'); 
const domainList = document.getElementById('domain-list'); 

// select 옵션 변경 이벤트 처리
domainList.addEventListener('change', function() {
    const selectedValue = this.value;

    // 'custom' 선택 시
    if (selectedValue === 'custom') {
        // domain-txt 필드 초기화
        domainTxt.value = '';
        // 포커스 설정
        domainTxt.focus();
    } else {
        // 선택한 값으로 domain-txt 필드 값 설정
        domainTxt.value = selectedValue;
    }
});

/*// 학원 전화번호 최대 11자리까지 제한 / 총 9,10,11자리 일 경우에 대한 모든 제어문
var academyPhoneInput = document.getElementById('academyPhone');

academyPhoneInput.addEventListener('blur', function(event) {
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
*/

/**/
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
        document.getElementById('join').submit(); // 수정: '#' 제거
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

// 마이페이지 버튼 클릭 시 세션값 확인 후 결과에 따라 제어
/**/
if (!academyLoginVo || !personalLoginVO) {
	document.getElementById("mypageBtn").addEventListener("click", function(event) {
    event.preventDefault();
    alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
    window.location.href = "/userAccount/login";
});
}

// 세션값이 있는지 확인
document.getElementById("mypageBtn").addEventListener("click", function(event) {
    if (!academyLoginVo) {
		event.preventDefault();
        alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
        window.location.href = "/userAccount/login";	
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