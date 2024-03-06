package com.myedumyselect.payment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.payment.vo.PaymentVO;

import lombok.Setter;

@RequestMapping("/payment/*")
@Controller
public class PaymentController {
	
	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	@GetMapping("/payMain")
	public String paymentBoardView() {
		
		return "payment/payMain";
	}
	
	@PostMapping("/paySuccess")
	public String paySuccessView(PaymentVO pvo, Model model) {
		paymentService.paymentInsert(pvo);
		model.addAttribute("paymentVO", pvo);
		return "payment/paySuccess";
	}
}
