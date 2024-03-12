package com.myedumyselect.client.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;
import com.myedumyselect.client.main.service.MainService;

import lombok.Setter;

@Controller
public class mainController {

	@Setter(onMethod_ = @Autowired)
	private MainService mainService;
	
	@GetMapping("/")
	public String mainIndex() {
		return "main/main";
	}
	
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
