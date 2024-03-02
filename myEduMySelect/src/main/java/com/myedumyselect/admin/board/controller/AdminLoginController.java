package com.myedumyselect.admin.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/*")
@Slf4j
public class AdminLoginController {

//	@Setter(onMethod_ = @Autowired)
//	private AdminLoginService adminLoginService;

	@GetMapping("/login")
	public String loginProcess() {
		log.info("admin 로그인 화면 호출");
		return "admin/index"; // /WEB-INF/views/admin/main.jsp로 포워드(관리자 페이지로 구분)
	}
//	@PostMapping("/login")
//	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
//		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);
//
//		/* 로그인 확인 */
//		if (adminLogin != null) {
//			model.addAttribute("adminLogin", adminLogin);
//		} else {
//			ras.addFlashAttribute("errorMsg", "로그인 실패");
//		}
//		return "redirect:/admin/login";
//
//		/*
//		 * 실제 로직
//		 * String url = "";
//		 * if (adminLogin != null) {
//		 * 	model.addAttribute("adminLogin", adminLogin);
//		 *  // url = "/admin/board/boardList";
//		 *  url = "/admin/member/memberList";
//		 *  } else {
//		 *  ras.addFlashAttribute("errorMsg", "로그인 실패");
//		 *  }
//		 *  return "redirect:" + url;
//		 */
//	}

	/**
	 * 로그아웃 처리 메서드 setComplete() 메서드를 활용하여 세션을 할당 해지
	 */
	@GetMapping("/logout")
	public String logoutProcess(SessionStatus sessionStatus) {
		log.info("admin 로그인 아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}
}