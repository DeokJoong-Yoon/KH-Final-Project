package com.myedumyselect.client.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {

	@GetMapping("/")
	public String mainIndex() {
		return "main/main";
	}
}
