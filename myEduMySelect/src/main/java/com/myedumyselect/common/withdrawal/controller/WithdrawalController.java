package com.myedumyselect.common.withdrawal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.common.withdrawal.service.WithdrawalService;
import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Controller
@RequestMapping("/withdrawal/*")
@SessionAttributes(SessionInfo.COMMON)
public class WithdrawalController {

	@Setter(onMethod_ = @Autowired)
	private WithdrawalService withdrawalService;

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginService personalLoginService;

	@PostMapping("/personal")
	public String personalWithdrawal(@SessionAttribute("personalLogin") PersonalLoginVO personalLoginVO, Model model,
			SessionStatus sessionStatus) {
		withdrawalService.personalDelete(personalLoginVO);
		sessionStatus.setComplete();
		return "redirect:/";
	}

	@PostMapping("/academy")
	public String academyWithdrawal(@SessionAttribute("personalLogin") AcademyLoginVO academyLoginVO,
			SessionStatus sessionStatus) {

		withdrawalService.academyDelete(academyLoginVO);
		sessionStatus.setComplete();
		return "redirect:/";
	}
}
