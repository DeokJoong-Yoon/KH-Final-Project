package com.myedumyselect.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.academy.vo.AcademyLoginVo;
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

	@GetMapping("/payMain")
	public String paymentBoardView(HttpSession session, Model model) {
		AcademyLoginVo academyLoginVo = (AcademyLoginVo) session.getAttribute("academyLoginVo");
		if (academyLoginVo == null) {
			return "redirect:/userAccount/login";
		}
//		academyLoginVo.setAcademyId("C1Math153");
//		academyLoginVo.setAcademyNumber("1000043685");
//		academyLoginVo.setAcademyManagerName("KHKH");
//		academyLoginVo.setAcademyName("유덕중");
//		academyLoginVo.setAcademyManagerEmail("ykdj92@naver.com");
//		academyLoginVo.setAcademyManagerPhone("01012341234");
		model.addAttribute("academyLoginVo", academyLoginVo);
		return "payment/payMain";
	}

	@PostMapping("/paySuccess")
	public String paySuccessView(@ModelAttribute PaymentVO pvo, Model model, HttpSession session) {
		AcademyLoginVo academyLoginVo = (AcademyLoginVo) session.getAttribute("academyLoginVo");
//		if (academyLoginVo == null) {
//			return "redirect:/userAccount/login";
//		}

		paymentService.paymentInsert(pvo);
		PaymentVO result = paymentService.paymentSelect(pvo);
		model.addAttribute("paymentVO", result);
		return "payment/paySuccess";
	}

	@GetMapping("/payFail")
	public String paymentFailView(HttpSession session) {
		AcademyLoginVo academyLoginVo = (AcademyLoginVo) session.getAttribute("academyLoginVo");
//		if (academyLoginVo == null) {
//			return "redirect:/userAccount/login";
//		}
		return "redirect:/userAccount/login";
	}
}
