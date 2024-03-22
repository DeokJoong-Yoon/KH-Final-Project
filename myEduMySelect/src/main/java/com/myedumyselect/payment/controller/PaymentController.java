package com.myedumyselect.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;
import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.payment.vo.PaymentVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/payment/*")
@Controller
@Slf4j
public class PaymentController {

	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	@GetMapping("/payMain")
	public String paymentBoardView(HttpSession session, Model model) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		String academyId = loginVo.getId();
		AcademyLoginVO academyLoginVo = academyLoginService.findById(academyId);
		
		if (academyLoginVo == null) {
			return "redirect:/academyaccount/login";
		}

		model.addAttribute("academyLoginVo", academyLoginVo);
		
		log.info("로그인 학원 정보 : " + academyLoginVo.toString());
		
		return "payment/payMain";
	}

	@PostMapping("/paySuccess")
	public String paySuccessView(@ModelAttribute PaymentVO pvo, Model model, HttpSession session) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		String academyId = loginVo.getId();
		AcademyLoginVO academyLoginVo = academyLoginService.findById(academyId);
		if (academyLoginVo == null) {
			return "redirect:/academyaccount/login";
		}

		paymentService.paymentInsert(pvo);
		PaymentVO result = paymentService.paymentSelect(pvo);
		model.addAttribute("paymentVO", result);
		return "payment/paySuccess";
	}

	@GetMapping("/payFail")
	public String paymentFailView(HttpSession session) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		String academyId = loginVo.getId();
		AcademyLoginVO academyLoginVo = academyLoginService.findById(academyId);
		if (academyLoginVo == null) {
			return "redirect:/academyaccount/login";
		}
		return "redirect:/userAccount/login";
	}
}
