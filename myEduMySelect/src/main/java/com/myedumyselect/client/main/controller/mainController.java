package com.myedumyselect.client.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;
import com.myedumyselect.client.main.service.MainService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes(SessionInfo.COMMON)
public class mainController {

	@Setter(onMethod_ = @Autowired)
	private MainService mainService;
	
//	@GetMapping("/")
//	public String mainIndex() {
//		return "main/main";
//	}
	
	@GetMapping("/")
	public String mainIndex(@ModelAttribute Model model,  HttpSession session) {
		
		//개인+학원 공통 로그인 세션(통합)
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		String userId = "";
		if(loginVo != null) {
			log.info("로그인 세션 있음");
			userId = loginVo.getId();
		} else {
			log.info("로그인 세션 없음");
		}
		model.addAttribute("userId", userId);
		
		return "main/main";
	}
	
	// 개인/학원 로그인 선택화면
	@GetMapping("/loginselect")
	public String loginSelect() {
		return "main/loginSelect";
	}
	
	/*
	@GetMapping("/")
	public String mainIndex( Model model,  HttpSession session) {
		
		//개인 로그인 세션
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		String userId = "";
		if(personalLogin != null) {
			log.info("로그인 세션 있음");
			userId = personalLogin.getPersonalId();
		} else {
			log.info("로그인 세션 없음");
		}
		model.addAttribute("userId", userId);
		
		return "main/main";
	}*/
	
	
	
	@PostMapping(value = "/mainSearchList")
	public String mainSearchList(@ModelAttribute AcademySourceVO avo, Model model) {
		List<AcademySourceVO> mainSearchList = mainService.mainSearchList(avo);
		model.addAttribute("mainSearchList", mainSearchList);
		
//		int total = mainService.mainListCnt(avo);
//		
//		model.addAttribute("pageMaker", new PageDTO(avo, total));
//		
		return "main/mainSearchList";
	}
}
