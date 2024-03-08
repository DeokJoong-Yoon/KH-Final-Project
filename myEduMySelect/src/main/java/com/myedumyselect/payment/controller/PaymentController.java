package com.myedumyselect.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.payment.vo.PaymentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/payment/*")
@Controller
@Slf4j
public class PaymentController {

	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;

	@GetMapping("/payMain")
	public String paymentBoardView() {

		return "payment/payMain";
	}

	@PostMapping("/paySuccess")
	public String paySuccessView(@ModelAttribute PaymentVO pvo, Model model) {
		paymentService.paymentInsert(pvo);
		PaymentVO result = paymentService.paymentSelect(pvo);
		model.addAttribute("paymentVO", result);
		return "payment/paySuccess";
	}
	
	@GetMapping("/payFail")
	public String paymentFailView() {

		return "payment/payFail";
	}
}
