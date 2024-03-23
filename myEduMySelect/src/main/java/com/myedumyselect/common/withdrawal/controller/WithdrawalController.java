package com.myedumyselect.common.withdrawal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.common.withdrawal.service.WithdrawalService;
import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Controller
@RequestMapping("/withdrawal/*")
public class WithdrawalController {

	@Setter(onMethod_ = @Autowired)
	private WithdrawalService withdrawalService;

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginService personalLoginService;

	@PostMapping("/personal")
	public String personalWithdrawal(
			@SessionAttribute(value = "personalLogin", required = false) PersonalLoginVO personalLoginVO, Model model,
			SessionStatus sessionStatus) {
		if (personalLoginVO == null) {
			return "redirect:/";
		}
		withdrawalService.personalDelete(personalLoginVO);
		sessionStatus.setComplete();
		return "redirect:/";
	}

	@PostMapping("/academy")
	public String academyWithdrawal(
			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO,
			SessionStatus sessionStatus) {
		if (academyLoginVO == null) {
			return "redirect:/";
		}

		withdrawalService.academyDelete(academyLoginVO);
		sessionStatus.setComplete();
		return "redirect:/";
	}

//	@PostMapping("/personal")
//	public String personalWithdrawal(
//			@SessionAttribute(value = "personalLogin", required = false) PersonalLoginVO personalLoginVO, Model model,
//			SessionStatus sessionStatus, HttpServletRequest request) {
//		if (personalLoginVO == null) {
//			return "redirect:/";
//		}
//		withdrawalService.personalDelete(personalLoginVO);
//		HttpSession session = request.getSession(false);
//		if (session != null) {
//			session.invalidate(); // 세션 무효화
//		}
//		return "redirect:/";
//	}
//	
//	@PostMapping("/academy")
//	public String academyWithdrawal(
//			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO,
//			SessionStatus sessionStatus, HttpServletRequest request) {
//		if (academyLoginVO == null) {
//			return "redirect:/";
//		}
//		
//		withdrawalService.academyDelete(academyLoginVO);
//	    HttpSession session = request.getSession(false);
//	    if (session != null) {
//	        session.invalidate(); // 세션 무효화
//	    }
//		return "redirect:/";
//	}
}
