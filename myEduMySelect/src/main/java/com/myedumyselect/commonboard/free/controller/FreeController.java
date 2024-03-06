package com.myedumyselect.commonboard.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.commonboard.free.service.FreeService;
import com.myedumyselect.commonboard.free.vo.FreeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequestMapping("/free/*")
@Slf4j
public class FreeController {
	@Setter(onMethod_ = @Autowired)
	private FreeService freeService;
	
	@GetMapping("/freeList")
	public String freeList(@ModelAttribute FreeVO fvo, Model model) {
		log.info("freeList 호출 성공");
		List<FreeVO> freeList = freeService.freeList(fvo);
		model.addAttribute("freeList", freeList);
		
		return "/board/free/freeBoardList";
	}
	
	@GetMapping("/freeDetail")
	public String freeDetail(@ModelAttribute FreeVO fvo, Model model) {
		log.info("freeDetail 호출 성공");
		
		FreeVO detail = freeService.freeDetail(fvo);
		model.addAttribute("detail", detail);
		
		return "/board/free/freeBoardDetail";
	}
}
