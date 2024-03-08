package com.myedumyselect.academy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVo;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
//@RequestMapping("/academy/*")
@Slf4j
@SessionAttributes("academyLogin")
public class AcademyLoginController {
    
	@Setter(onMethod_ = @Autowired)
    private AcademyLoginService academyLoginService;
	
//	@GetMapping("/useraccount/login")
//	public String loginForm() {
//		log.info("로그인 화면 호출");
//		return "academy/login"; // login.jsp 호출
//	}
//	
//	@PostMapping("/useraccount/login")
//	public String loginProcess(AcademyLoginVo login, Model model, RedirectAttributes ras) {
//		AcademyLoginVo academyLogin = academyLoginService.loginProcess(login);
//		
//		if (academyLogin != null) {
//			model.addAttribute("AcademyLogin", academyLogin);
//		} else {
//			ras.addFlashAttribute("errorMsg", "다시 로그인 해주세요.");
//			return "redirect:/useraccount/login";
//		}
//		return "redirect:/useraccount/login";
//	}
	
//	@GetMapping("/useraccount/logout")
//	public String logout(SessionStatus sessionStatus) {
//		log.info("academy 로그아웃 처리");
//		sessionStatus.setComplete();
//		return "redirect:/useraccount/login";
//	}

	@GetMapping(value = "/useraccount/join/academy")
	public String joinForm() {
		log.info("academyJoin 호출 성공");

		return "academy/academyJoin";
	}

	@PostMapping("/academyInsert")
	public String academyInsert(AcademyLoginVo login) {
		log.info("academyInsert 호출 성공");
		academyLoginService.academyInsert(login);
		return "redirect:/useraccount/join/complete";
	}

	//@GetMapping("/")
	//public String home() {
		// 홈 페이지로 이동
		//return "/academy/index"; // index.jsp
	//}

//	@GetMapping("/useraccount/join")
//	public String signUp() {
//		// 회원가입 페이지로 이동
//		return "/academy/join"; // join.jsp
//	}
//
//	@GetMapping("/useraccount/join/complete")
//	public String completeSignUp() {
//		// 회원가입 완료 페이지로 이동
//		return "/academy/completeJoin";
//	}
//	
	
	/*
	 * @GetMapping("/userAccount/join/academy") public String signUpForm(Model
	 * model) { AcademyVo academyVo = academyService.getAcademyVo();
	 * model.addAttribute("academyInfo", academyVo); return "academySignUp"; //
	 * signUp.jsp 페이지로 이동 }
	 */
    
    
}
