package com.myedumyselect.client.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;
import com.myedumyselect.client.main.service.MainService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Controller
public class mainController {

	@Setter(onMethod_ = @Autowired)
	private MainService mainService;

	@GetMapping("/")
	public String mainIndex(Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLogin,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLogin) {

		String userId = "";

		// 개인 로그인 세션
		if (personalLogin != null) {
			userId = personalLogin.getPersonalId();
		}

		// 개인 로그인 세션
		if (academyLogin != null) {
			userId = academyLogin.getAcademyId();
		}

		model.addAttribute("userId", userId);

		return "main/main";
	}

	@PostMapping(value = "/mainSearchList")
	public String mainSearchList(@ModelAttribute AcademySourceVO avo, Model model) {
		List<AcademySourceVO> mainSearchList = mainService.mainSearchList(avo);
		model.addAttribute("mainSearchList", mainSearchList);

		return "main/mainSearchList";
	}
}
