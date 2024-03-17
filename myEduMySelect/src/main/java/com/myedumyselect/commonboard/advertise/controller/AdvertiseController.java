package com.myedumyselect.commonboard.advertise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.common.vo.PageDTO;
import com.myedumyselect.commonboard.advertise.service.AdvertiseService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/advertise/*")
@Slf4j
public class AdvertiseController {
	
	@Setter(onMethod_ = @Autowired)
	private AdvertiseService aService;
	
	// 홍보게시판 목록 전체보기 구현
	@GetMapping("/advertiseBoardList")
	public String advertiseList(@ModelAttribute AdvertiseVO aVO, Model model, HttpSession session) {
		log.info("advertiseBoardList() 호출 성공");
		
		//전체 레코드 조회
		List<AdvertiseVO> advertiseList = aService.advertiseList(aVO);
		model.addAttribute("advertiseList", advertiseList);
		
		//전체 레코드 수 반환
		int total = aService.advertiseListCnt(aVO);
		
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(aVO, total));
		model.addAttribute("kwd", aVO.getKeyword());
		
		return "board/advertise/advertiseBoardList";
	}
}
