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
    
    const regex = /^[0-9]*$/; // 숫자만 허용하는 정규표현식
    
    managerPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(managerPhoneInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(managerPhoneInput);
        }
    });
    /*
    academyPhoneInput.addEventListener('input', function(event) {
        const inputValue = event.target.value;
        if (!regex.test(inputValue)) {
            showErrorMessage(academyPhoneInput, '숫자만 입력 가능합니다.');
        } else {
            hideErrorMessage(academyPhoneInput);
        }
    });    
    */
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

$(document).ready(function() {
    // 이메일 중복체크 버튼에 클릭 이벤트 핸들러 등록
    /*$('#emailCheckBtn').on('click', function(event) {
        event.preventDefault(); // 기본 동작 방지

        // 입력된 이메일 유효성 검사
        const emailPrefix = $('#academyManagerEmail1').val();
        const emailSuffix = $('#academyManagerEmail2').val();
        const emailAddress = emailPrefix + '@' + emailSuffix;
        const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!emailRegex.test(emailAddress)) {
            alert("이메일을 올바른 형식으로 입력 후 다시 중복체크 버튼을 눌러주세요");
            return;
        }

        // 이메일 중복 체크 함수 호출
        checkEmailDuplication(emailAddress);
    });*/
    $('#emailCheckBtn').on('click', function(event) {
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

    /*// 이메일 선택
    $('#domain-list').on('change', function() {
        const selectedDomain = $(this).val(); // 선택된 도메인 값 가져오기
        if (selectedDomain === 'custom') {
            // "직접입력" 옵션이 선택된 경우 입력 필드를 초기화하고 readonly 속성 해제
            $('#academyManagerEmail2').val('').prop('readonly', false);
        } else {
            // 선택된 도메인을 이메일 주소 뒤에 추가하여 입력 필드에 설정하고 readonly 속성 적용
            $('#academyManagerEmail2').val(selectedDomain).prop('readonly', true);
        }
    });*/

    // 이메일 중복 체크 함수
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
                    console.log("이메일 입력 성공!");
                } else {
                    $('#email-check-message').text('이미 사용 중인 이메일 주소입니다, 다시 입력해주세요.');
                }
            },
            error: function(xhr, status, error) {
                console.error("서버 에러 발생: " + error);
            }
        });
    }
});

// 회원정보 수정하기 버튼 눌렀을 때
$(function() {
    $("#updateBtn").on("click", function() {
    	//event.preventDefault(); // 기본 제출 동작 방지
    	console.log("폼 제출 버튼 클릭!");	        	
    	/*$("#academyUpdateForm").attr({
			"method" : "POST",
			"action" : "/academy/mypage"
		});
		$("#academyUpdateForm").submit();*/
    	/*
    	var academyManagerName = $("#academyManagerName").val();    	
    	var academyManagerEmail = $("#academyManagerEmail").val();
    	var academyManagerPhone = $("#academyManagerPhone").val();*/	        	
    	var academyTargetSubject = $("#academyTargetSubject").val();
    	var academyFee = $("#academyFee").val();
    	var academyTargetGrade = $("#academyTargetGrade").val();
    	var academyKeyword1 = $("#academyKeyword1").val();
    	var academyKeyword2 = $("#academyKeyword2").val();
    	var academyKeyword3 = $("#academyKeyword3").val();
    	var academyKeyword4 = $("#academyKeyword4").val();
    	var academyKeyword5 = $("#academyKeyword5").val();
    	 
        /* 수정 여부를 사용자에게 확인하기 위해 알림창을 표시합니다.*/ 
        if (confirm("회원 정보를 수정하시겠습니까?")) {
            // 사용자가 확인을 누른 경우, AJAX를 통해 서버로 업데이트 요청을 전송합니다.
            $.ajax({
                url: "/academyUpdate",
                type: "POST",
                data: $("#academyUpdateForm").serialize(),
                success: function(response) {
                    // 서버에서 성공적인 응답을 받았을 때 실행되는 부분
                    alert("회원 정보가 성공적으로 업데이트되었습니다.");
                    // 성공한 경우 페이지를 새로고침하여 변경된 정보를 반영할 수 있도록 한다.
                    window.location.href = "/academy/mypage";
                },
                error: function(xhr, status, error) {
                    alert("회원 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
                    console.error(xhr.responseText);
                }
            });
        } else {
            return false;
        }
    });

    $("#changePasswdBtn").on("click", function() {
        // 사용자에게 비밀번호를 수정할 것인지 묻는 알림
        if (confirm("비밀번호 변경 페이지로 이동하시겠습니까?")) {
            window.location.href = "/passwdChangePage";
        } else {
            // 사용자가 취소를 누른 경우 아무 동작 없음
        }
    });
});
	



/* 아래 부터는 main.js 내용 */
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