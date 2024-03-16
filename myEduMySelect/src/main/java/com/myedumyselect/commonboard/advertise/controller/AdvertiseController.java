package com.myedumyselect.commonboard.advertise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.commonboard.advertise.service.AdvertiseService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/advertise/*")
@Slf4j
public class AdvertiseController {
	
	@Setter(onMethod_ = @Autowired)
	private AdvertiseService advertiseService;
	
	// 목록 구현
	@GetMapping("/advertiseList")
	public String advertiseList(@ModelAttribute AdvertiseVO avo, Model model) {
		log.info("advertiseList 호출 성공");
		List<AdvertiseVO> advertiseList = advertiseService.advertiseList(avo);
		model.addAttribute("advertiseList", advertiseList);
		return "/board/advertise/advertiseBoardList";
	}
}
