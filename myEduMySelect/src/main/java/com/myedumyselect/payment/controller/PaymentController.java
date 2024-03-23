package com.myedumyselect.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.payment.vo.PaymentVO;

import lombok.Setter;

@RequestMapping("/payment/*")
@Controller
public class PaymentController {

	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	@GetMapping("/payMain")
	public String paymentBoardView(
			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO, Model model) {
		if (academyLoginVO == null) {
			return "redirect:/academy/login";
		}
		model.addAttribute("academyLoginVO", academyLoginVO);
		return "payment/payMain";
	}

	@PostMapping("/paySuccess")
	public String paySuccessView(@ModelAttribute PaymentVO paymentVO, Model model,
			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO) {
		if (academyLoginVO == null || paymentVO == null) {
			return "redirect:/academy/login";
		}

		paymentService.paymentInsert(paymentVO);
		PaymentVO result = paymentService.paymentSelect(paymentVO);
		model.addAttribute("paymentVO", result);
		return "payment/paySuccess";
	}

	@GetMapping("/payFail")
	public String paymentFailView(
			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO) {
		if (academyLoginVO == null) {
			return "redirect:/academy/login";
		}
		return "payment/payFail";
	}

	@GetMapping("/accountInfo")
	public String accountInfo(
			@SessionAttribute(value = "academyLogin", required = false) AcademyLoginVO academyLoginVO) {
		if (academyLoginVO == null) {
			return "redirect:/academy/login";
		}
		return "payment/accountInfo";
	}
}
