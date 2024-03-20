package com.myedumyselect.academy.controller;

import java.util.Date;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.academy.vo.AcademySignUpVo;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;
import com.myedumyselect.common.vo.CommonVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

//import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("academyLogin")
public class AcademyLoginController {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	// 학원회원 로그인으로 이동
	@GetMapping("/academyaccount/login")
	public String userAccountLoginForm(Model model, HttpSession session) {

		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		if (loginVo != null) {
			if (loginVo.getMemberTypeId() == 1) {
				log.info("잘못된 접근");
				model.addAttribute("confirmMessage", "잘못된 접근입니다.");
				return "/main/loginSelect";
			}
		}

		model.addAttribute("loginVo", new LoginVo());
		return "/academy/login";
	}

	// 학원회원 로그인 POST
	@PostMapping("/academyaccount/login")
	public String userAccountLogin(LoginVo loginVo, Model model, RedirectAttributes ras, HttpSession session,
			BindingResult bindingResult) {
		// 바인딩 에러 확인
		if (bindingResult.hasErrors()) {
			return "/academy/login";
		}

		// POST 방식으로 /academyaccount/login 엔드포인트에 대한 요청을 처리하는 메서드이다.
		// 요청에서 AcademyLoginVO 객체, Model 객체, RedirectAttributes 객체, HttpSession 객체를 받는다
		Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
		Date bannedUntil = (Date) session.getAttribute("bannedUntil");
		// 세션에서 loginAttempts와 bannedUntil 속성을 가져온다. 결국 얘네도 변수 이름이다.
		// loginAttempts는 로그인 시도 횟수를, bannedUntil은 계정 잠금이 해제되는 시간을 나타낸다.
		// currentTiem는 현재시간을 나타내는 변수이다 . 밑에 System.currentTimeMillis()을 통해
		// 현재 시간을 밀리초 단위로 가져온다. 결론적으로 이 변수는 계정 잠금 해제 시간을 계산할때 사용한다.
		// lockoutTime 계정이 잠금되는 시간을 나타내는 변수이다 currentTime 와 똑같은 개념이다
		// ex) 1분은 60초 1초는 1000밀리초 그래서 10분을 밀리초 단위로 계산하면 10 * 60 * 1000 이렇게된다 10분 =
		// 600000 밀리초
		// currentTime + 600000 잠금이 풀리는 시간을 계산하면 이런식이다.

		// 즉시 잠금 해제
		// session.removeAttribute("bannedUntil");

		// 계정이 잠겨 있을 때
		if (bannedUntil != null && new Date().before(bannedUntil)) {
			long remainingTime = (bannedUntil.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
			ras.addFlashAttribute("errorMsg", "계정이 잠겨 있습니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
			return "redirect:/academyaccount/login";
		}
		// 계정이 잠겨 있고, 잠금 해제 시간이 현재 시간 이후인 경우를 검사한다.
		// 계정이 잠겨 있을 때 사용자에게 알림 메시지를 추가하고, 로그인 페이지로 리다이렉트한다.

		// 로그인 시도 횟수 카운트
		if (loginAttempts == null) {
			loginAttempts = 0;
		}
		// 로그인 시도 횟수를 확인하고, 값이 없으면 0으로 초기화한다.
		
		
		
		// 로그인 시도
		AcademyLoginVo academyLogin = academyLoginService.loginProcess(loginVo.getId(), loginVo.getPasswd());
		// AcademyLoginService를 통해 로그인을 시도한다.

		if (academyLogin != null) {
			loginVo.setName(academyLogin.getAcademyName());
			model.addAttribute("academyLogin", academyLogin);
			session.removeAttribute("loginAttempts");// 로그인이 성공한 경우, 모델에 로그인 정보를 추가하고, 세션에서 로그인 시도 횟수 속성을 제거한다.
			log.info("로그인 성공!");
		} else {
			loginAttempts++;
			session.setAttribute("loginAttempts", loginAttempts);

			if (loginAttempts >= 5) {
				long currentTime = System.currentTimeMillis();
				Date lockoutTime = new Date(currentTime + (10 * 60 * 1000)); // 10분 후 시간
				session.setAttribute("bannedUntil", lockoutTime);

				long remainingTime = (lockoutTime.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
				ras.addFlashAttribute("loginAttempts", "5/5");
				ras.addFlashAttribute("errorMsg",
						"아이디 및 비밀번호 입력 5회 이상 실패하였습니다. 계정 로그인이 10분간 제한됩니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
				ras.addFlashAttribute("bannedUntil", lockoutTime);

				return "redirect:/academyaccount/login";
			} else {
				ras.addFlashAttribute("errorMsg",
						"아이디 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.로그인 시도 횟수: " + loginAttempts + "/5");

				return "redirect:/academyaccount/login";
			} // 로그인이 실패한 경우, 로그인 시도 횟수를 증가시키고, 잠금 시간을 설정한다.
				// 잠금 시간까지 남은 시간을 계산하고, 알림 메시지를 추가하여 사용자에게 알린다.
				// 로그인 시도 횟수가 5회 이상이면 계정을 잠그고, 잠금 해제 시간까지 알려주는 알림 메시지를 추가한다.
				// 로그인 시도 횟수가 5회 미만인 경우, 실패 메시지와 함께 로그인 페이지로 리다이렉트한다.
		}

		return "redirect:/academyaccount/login"; // 로그인이 성공하거나 실패한 후에는 항상 로그인 페이지로 리다이렉트한다.
	}

	// 학원회원 회원가입으로 이동
	@GetMapping(value = "/academyaccount/join")
	public String joinForm(Model model, HttpSession session) {

		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		if (loginVo != null) {
			if (loginVo.getMemberTypeId() == 1) {
				log.info("잘못된 접근");
				model.addAttribute("confirmMessage", "잘못된 접근입니다.");
				return "/main/loginSelect";
			} else {
				return "/main/main";
			}
		}
		log.info("academyJoin 호출 성공");
		// 모델 등록
		model.addAttribute("academySignUpVo", new AcademySignUpVo());
		return "academy/academyJoin";

		/*
		 * AcademyLoginVo academyLogin = (AcademyLoginVo)
		 * session.getAttribute("academyLogin"); if(academyLogin == null) {
		 * log.info("잘못된 접근"); model.addAttribute("confirmMessage",
		 * "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?"); return "main/loginSelect";
		 * 
		 * } else if(loginVo != null) { model.addAttribute("confirmMessage",
		 * "잘못된 접근입니다"); return "main/errorPage"; }
		 */
	}

	// 학원회원 회원가입 POST
	@PostMapping("/academyInsert")
	public String academyInsert(@Valid @ModelAttribute AcademySignUpVo academySignUpVo, BindingResult bindingResult,
			HttpSession session, Model model, LoginVo loginVo) {

		if (bindingResult.hasErrors()) {
			return "academy/academyJoin";
		}
		
		// 학원회원 회원가입 처리
		try {
			log.info("academyInsert 호출 성공");
			log.info("academySignUpVo : {}", academySignUpVo);
			academyLoginService.academyInsert(academySignUpVo);
			log.info("회원가입 성공!");
		} catch (AcademyIdDuplicateException e) {
			bindingResult.reject("duplicateAcademyId", "이미 존재하는 아이디입니다.");
			return "academy/academyJoin";
		}

		return "redirect:/userAccount/join/complete";
	}

	/*
	 * 학원회원 회원가입 페이지로 이동
	 * 
	 * @GetMapping("/academyaccount/join") public String signUp() { // 회원가입 페이지(폼)로
	 * 이동 return "/academy/join"; // join.jsp }
	 */

	// 학원회원 회원가입 완료 페이지로 이동
	@GetMapping("/userAccount/join/complete")
	public String completeSignUp(@ModelAttribute AcademyLoginVo academyLoginVo) {
		// 회원가입 완료 페이지로 이동
		return "/academy/completeJoin";
	}

	// 학원회원 마이페이지로 이동
	@GetMapping("/academyaccount/mypage")
	public String mypage(Model model, HttpSession session) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		if (loginVo != null) {
			if (loginVo.getMemberTypeId() == 1) {
				log.info("잘못된 접근");
				model.addAttribute("confirmMessage", "잘못된 접근입니다.");
				return "/main/main";
			}
		}

		// 로그인이 되어있지 않다면
		if (ObjectUtils.isEmpty(loginVo)) {
			model.addAttribute("confirmMessage", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			// 로그인 페이지로 리다이렉트
			return "redirect:/academyaccount/login";
		}
		log.info("mypage 호출 성공");
		// 로그인된 경우에는 학원 정보를 가져와서 모델에 추가
		String academyId = loginVo.getId();
		AcademyLoginVo academyLoginVo = academyLoginService.findById(academyId);
						
		if (academyLoginVo != null) {
			model.addAttribute("academyLoginVo", academyLoginVo);
		} else {
			// 학원 정보가 없을 경우 처리
			academyLoginVo = new AcademyLoginVo();
			model.addAttribute("academyLoginVo", academyLoginVo);
		}
		
		// 담당자 전화번호 모델에 등록
		if(academyLoginVo.getAcademyManagerPhone() != null) {
			model.addAttribute("academyManagerPhone", academyLoginVo.getAcademyManagerPhone());
		}
		// 학원 전화번호 모델에 등록
		if(academyLoginVo.getAcademyPhone() != null) {
			model.addAttribute("academyPhone", academyLoginVo.getAcademyPhone());
		}		
		// 담당자 이름 모델에 등록
		if(academyLoginVo.getAcademyManagerName() != null) {
			model.addAttribute("academyManagerName", academyLoginVo.getAcademyManagerName());
		}

		return "/academy/mypage";
	}

	// 아이디 중복체크
	@PostMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestParam("academyId") String academyId) {
		return academyLoginService.checkId(academyId);
	}

	// 이메일 중복체크
	@PostMapping("/checkEmail")
	@ResponseBody
	public int checkEmail(@RequestParam("academyManagerEmail") String academyManagerEmail) {
	    return academyLoginService.checkEmail(academyManagerEmail);
	}

	// 사업자등록번호 조회 및 중복여부 확인
	@PostMapping("/findByNumber")
	@ResponseBody
	public AcademyLoginVo findByNumber(@RequestParam("academyNumber") String academyNumber) {
		return academyLoginService.findByNumber(academyNumber);
	}

	// 마이페이지 회원정보 수정
	@PostMapping("/academyUpdate")
	public String academyUpdate(HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		log.info("컨트롤러 /academyUpdate 호출!");
		
		AcademyLoginVo academyLogin = academyLoginService.loginProcess(loginVo.getId(), loginVo.getPasswd());
		
		// 세션에서 로그인 정보 가져오기
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		if(loginVo != null) {
			if(loginVo.getMemberTypeId() == 1) {
				redirectAttributes.addFlashAttribute("errorMsg", "잘못된 접근입니다");
				return "/loginselect";
			}
		}
		log.info("loginVo null값 아니며 memberTypeId==2 {} : ", loginVo);
		// 수정할 학원 회원의 아이디 가져오기
		String academyId = loginVo.getId();
		
		// 학원 회원 정보 가져오기
		AcademyLoginVo academyLoginVo = academyLoginService.findById(academyId);
		
		// 학원 회원 정보가 null이 아니면 모델에 추가
		if(academyLoginVo != null) {			
			model.addAttribute("academyLoginVo", academyLoginVo);
			log.info("academyLoginVo null값 아닐 때 모델에 정상 등록 {} : ", academyLoginVo);
		} else {
			academyLoginVo = new AcademyLoginVo();
			model.addAttribute("academyLoginVo", academyLoginVo);
			
		} 
		
		// 각 정보가 null이 아니면
		if(academyLoginVo.getAcademyManagerName() != null) {
			model.addAttribute("academyManagerName", academyLoginVo.getAcademyManagerName());
		}
		
		if(academyLoginVo.getAcademyManagerEmail() != null) {
			model.addAttribute("academyManagerEmail", academyLoginVo.getAcademyManagerEmail());
		}
		
		if(academyLoginVo.getAcademyManagerPhone() != null) {
			model.addAttribute("academyManagerPhone", academyLoginVo.getAcademyManagerPhone());
		}
		
		if(academyLoginVo.getAcademyTargetSubject() != null) {
			model.addAttribute("academyTargetSubject", academyLoginVo.getAcademyTargetSubject());
		}
		
		if(academyLoginVo.getAcademyFee() != null) {
			model.addAttribute("academyFee", academyLoginVo.getAcademyFee());
		}
		
		if(academyLoginVo.getAcademyTargetGrade() != null) {
			model.addAttribute("academyTargetGrade", academyLoginVo.getAcademyTargetGrade());
		}
		
		if(academyLoginVo.getAcademyKeyword1() != null) {
			model.addAttribute("academyKeyword1", academyLoginVo.getAcademyKeyword1());
		}
		
		log.info("academyLoginVo 모델 정보 등록 {} : ", academyLoginVo);
		// 세션에서 가져온 academyLogin 객체에 업데이트된 정보를 적용,결론적으로 VO를 들고 오는구조
		//AcademyLoginVo sessionAcademyLogin = academyLoginService.findById(loginVo.getAcademyId());
		
		//log.info("매니저 이름 : {}", sessionAcademyLogin.getAcademyManagerName());
		//log.info("아이디로 불러온 정보 {} ", sessionAcademyLogin.getAcademyId());
		academyLoginVo.setAcademyManagerName(academyLoginVo.getAcademyManagerName());
		academyLoginVo.setAcademyManagerEmail(academyLoginVo.getAcademyManagerEmail());
		academyLoginVo.setAcademyManagerPhone(academyLoginVo.getAcademyManagerPhone());
		academyLoginVo.setAcademyPhone(academyLoginVo.getAcademyPhone());
		academyLoginVo.setAcademyTargetSubject(academyLoginVo.getAcademyTargetSubject());
		academyLoginVo.setAcademyFee(academyLoginVo.getAcademyFee());
		academyLoginVo.setAcademyTargetGrade(academyLoginVo.getAcademyTargetGrade());
		/*academyLoginVo.setAcademyKeyword1(academyLoginVo.getAcademyKeyword1());
		academyLoginVo.setAcademyKeyword1(academyLoginVo.getAcademyKeyword2());
		academyLoginVo.setAcademyKeyword1(academyLoginVo.getAcademyKeyword3());
		academyLoginVo.setAcademyKeyword1(academyLoginVo.getAcademyKeyword4());
		academyLoginVo.setAcademyKeyword1(academyLoginVo.getAcademyKeyword5());
		*/
		
		/*
		String academyManagerName = academyLoginVo.getAcademyId();
		academyLoginVo.setAcademyId(academyManagerName);
		log.info("academyManagerName 수정 반영 {} : ", academyManagerName);
		/* AcademyLoginVo academyLoginVo = academyLoginService.findById(academyId); 
		
		model.addAttribute("academyLoginVo", academyLoginVo);
		
		log.info("academyLoginVo 객체 정보 {} : ", academyLoginVo);
		*/
		
		
		// 학원 정보 업데이트
		// academyLoginService의 academyUpdate 메서드를 호출하여 데이터베이스에 개인 정보를 업데이트
		int result = academyLoginService.academyUpdate(academyLoginVo);
		//log.info("sessionAcademyLogin.toString() 2번 {} : ", academyLoginVo.toString());
		log.info("result값 {} : ", result);
		
		// 업데이트가 실패하면 에러 메시지를 추가하고 로그인 페이지로 리다이렉트
		if (result == 0) {			
			redirectAttributes.addFlashAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
			return "redirect:/academyaccount/login";
		} 
		
		// 업데이트 성공 시
		session.setAttribute("academyLoginVo", academyLoginVo);
		log.info("세션에 academyLoginVo 등록 {} : ", session);
		model.addAttribute("academyLoginVo", academyLoginVo);
		log.info("모델에 academyLoginVo 등록 {} : ", model);
		
		
		return "redirect:/academyaccount/mypage";
		// 업데이트가 성공하면 세션에 업데이트된 academyLoginVo 객체를 저장하고 마이 페이지로 리다이렉트
		
		//model.addAttribute(result);
		
		
		
		
	}

	/* 비밀번호 변경 */
	@GetMapping("/passwdChangePage")
	public String passwdChangePage(Model model, HttpSession session, RedirectAttributes redirectAttributes) {

		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		if (loginVo != null) {
			if (loginVo.getMemberTypeId() == 1) {
				log.info("잘못된 접근");
				model.addAttribute("confirmMessage", "잘못된 접근입니다.");
				return "/main/main";
			}
		} else {
			model.addAttribute("confirmMessage", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			return "main/loginSelect";
		}

		model.addAttribute("academyId", loginVo.getId());
		return "academy/passWd";
	}

	/* 비밀번호 변경 POST */
	@PostMapping("/passwdChange")
	public String updatePasswdChangeDate(@ModelAttribute AcademyLoginVo login, HttpSession session, Model model,
	        RedirectAttributes redirectAttributes) {
		
		
	    // 세션에서 LoginVo 객체 가져오기
	    LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
	    log.info("세션에서 가져온 LoginVo 객체 정보 {} : ", loginVo);
	    // 새로운 비밀번호 설정
	    loginVo.setPasswd(login.getAcademyPasswd());

	    // 변경된 비밀번호 업데이트
	    int result = academyLoginService.updatePasswdChangeDate(login);

	    if (result == 0) {
	        redirectAttributes.addFlashAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
	        return "redirect:/academyaccount/login";
	    }

	    // 세션에 LoginVo 객체를 다시 설정
	    session.setAttribute(SessionInfo.COMMON, loginVo);
	    log.info("비밀번호 변경 완료 ", loginVo);
	    redirectAttributes.addFlashAttribute("errorMsg", "비밀번호 변경 완료");

	    // 로그아웃 후 리다이렉트
	    session.invalidate(); // 세션 무효화
	    log.info("비밀번호 변경완료, 다시 로그인");
	    return "redirect:/academyaccount/login";
	}


	/*
	 * @PostMapping("/checkCurrentPassword")
	 * 
	 * @ResponseBody public boolean checkCurrentPassword(@RequestParam("academyId")
	 * String academyId,
	 * 
	 * @RequestParam("currentPassword") String currentPassword) { // 현재 비밀번호가 일치하는지
	 * 확인하는 로직을 추가 //boolean isValidPassword =
	 * academyLoginService.updatePasswdChangeDate(AcademyLoginVo
	 * AcademyLoginVo.builder()); //return isValidPassword; }
	 */

	


}
