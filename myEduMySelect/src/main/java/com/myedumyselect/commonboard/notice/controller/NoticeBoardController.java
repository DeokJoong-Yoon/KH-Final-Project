package com.myedumyselect.commonboard.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.commonboard.notice.service.NoticeBoardService;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/notice/*")
@Controller
@Slf4j
public class NoticeBoardController {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardService noticeBoardServcie;

	@GetMapping("/boardList")
	public String noticeBoardList(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model) {
		// 전체 레코드 조회
		List<NoticeBoardVO> boardList = noticeBoardServcie.boardList(noticeBoardVO);
		model.addAttribute("boardList", boardList);
		log.info(noticeBoardVO.getKeyword());
		// 전체 레코드수 반환.
		int total = noticeBoardServcie.boardListCnt(noticeBoardVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(noticeBoardVO, total));
		return "commonboard/notice/noticeBoardList";
	}
	
	@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model) {
		
		NoticeBoardVO detail = noticeBoardServcie.boardDetail(noticeBoardVO);
		model.addAttribute("detail", detail);
		return "commonboard/notice/noticeBoardDetail";
	}
	
}
