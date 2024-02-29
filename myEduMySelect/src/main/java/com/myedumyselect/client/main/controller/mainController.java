package com.myedumyselect.client.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j	// 개발용 어노테이션 ( 배포시 삭제 처리 )
public class mainController {
	
	@GetMapping("/")
	public String mainIndex() {
		return "main/main";
	}
}
