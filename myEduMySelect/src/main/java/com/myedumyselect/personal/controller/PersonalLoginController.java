package com.myedumyselect.personal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.vo.PersonalLoginVO;


import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
//@RequestMapping("/personal/*")
@Slf4j
@SessionAttributes("personalLogin")
public class PersonalLoginController {

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginService personalLoginService;

	@GetMapping("/useraccount/login")
	public String loginForm() {
		log.info("로그인 화면 호출");
		return "personal/login"; // login.jsp 호출
	}

	@PostMapping("/useraccount/login")
	public String loginProcess(PersonalLoginVO login, Model model, RedirectAttributes ras) {
		PersonalLoginVO personalLogin = personalLoginService.loginProcess(login);

		if (personalLogin != null) {
			model.addAttribute("personalLogin", personalLogin);
		} else {
			ras.addFlashAttribute("errorMsg", "다시 로그인 해주세요.");
			return "redirect:/useraccount/login";
		}
		return "redirect:/useraccount/login";
	}

	@GetMapping("/useraccount/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("personal 로그아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/useraccount/login";
	}

	@GetMapping(value = "/useraccount/join/personal")
	public String joinForm() {
		log.info("personaljoin 호출 성공");

		return "personal/personalJoin";
	}

	@PostMapping("/personalInsert")
	public String personalInsert(PersonalLoginVO login) {
		log.info("personalInsert 호출 성공");
		personalLoginService.personalInsert(login);
		return "redirect:/useraccount/join/complete";
	}

	//@GetMapping("/")
	//public String home() {
		// 홈 페이지로 이동
		//return "/personal/home"; // home.jsp
	//}

	@GetMapping("/useraccount/join")
	public String signUp() {
		// 회원가입 페이지로 이동
		return "/personal/join"; // join.jsp
	}

	@GetMapping("/useraccount/join/complete")
	public String completeSignUp() {
		// 회원가입 완료 페이지로 이동
		return "/personal/completeJoin";
	}
}

/*
 * 회원가입 페이지로 이동 /useraccount/join 개인회원가입 페이지로 이동/useraccount/join/personal 회원가입
 * 완료 페이지로 이동/useraccount/join/complete 홈페이지에서 로그인/회원가입 버튼을 눌렀을때 로그인 페이지로
 * /useraccount/login
 */
