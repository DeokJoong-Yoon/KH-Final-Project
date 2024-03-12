package com.myedumyselect.commonboard.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	
	/* 글 목록 구현*/
	@GetMapping("/freeList")
	public String freeList(@ModelAttribute FreeVO fvo, Model model) {
		log.info("freeList 호출 성공");
		List<FreeVO> freeList = freeService.freeList(fvo);
		model.addAttribute("freeList", freeList);
		return "/board/free/freeBoardList";
	}
	
	
	/* 글쓰기 구현*/
	@PostMapping("/freeInsert")
	public String freeInsert(FreeVO fvo, RedirectAttributes ras) {
		log.info("freeInsert 호출 성공");

		int result = 0;
		String url = "";

		result = freeService.freeInsert(fvo);
		if (result == 1) {
			url = "/board/free/freeList";
		} else {
			ras.addFlashAttribute("errorMsg", "입력에 문제가 있어 다시 진행해 주세요.");
			url = "/board/free/freeWriterForm";
		}
		return "redidect:"+url;
		/*freeService.freeInsert(fvo);
		return "redirect:/board/free/freeList";*/
	}
	
	
	/* 글쓰기 폼 구현*/
	@GetMapping(value = "/freeWriterForm")
	public String freeWriterForm() {
		log.info("freeWriterForm 호출 성공");

		return "/board/free/freeWriterForm";
	}

	
	
	/*글 상세 구현*/
	@GetMapping("/freeDetail")
	public String freeDetail(@ModelAttribute FreeVO fvo, Model model) {
		log.info("freeDetail 호출 성공");

		FreeVO detail = freeService.freeDetail(fvo);
		model.addAttribute("detail", detail);

		return "/board/free/freeBoardDetail";
	}

	
	

	/*글 수정 폼 구현*/
	@GetMapping(value = "/freeUpdateForm")
	public String freeUpdateForm(@ModelAttribute FreeVO fvo, Model model) {
		log.info("freeUpdateForm 호출 성공");
		log.info("common_no = " + fvo.getCommon_no());

		FreeVO freeUpdateData = freeService.freeUpdateForm(fvo);

		model.addAttribute("freeUpdateData", freeUpdateData);
		return "/board/free/freeUpdateForm";
	}

	@PostMapping("/freeUpdate")
	public String freeUpdate(@ModelAttribute FreeVO fvo, RedirectAttributes ras) {
		log.info("freeUpdate 호출 성공");

		int result = 0;
		String url = "";

		result = freeService.freeUpdate(fvo);
		ras.addFlashAttribute("freeVO", fvo);

		if (result == 1) {
			//url = "/board/free/freeDetail?common_no=" + fvo.getCommon_no();
			url="/board/free/freeDetail";
		} else {
			//url = "/board/free/freeUpdateForm?common_no=" + fvo.getCommon_no();
			url="/board/free/freeUpdateForm";
		}

		return "redirect:" + url;
	}

	@PostMapping("/freeDelete")
	public String freeDelete(@ModelAttribute FreeVO fvo, RedirectAttributes ras) {
		log.info("freeDelete 호출 성공");

		int result = 0;
		String url = "";
		result = freeService.freeDelete(fvo);

		if (result == 1) {
			url = "/board/free/freeList";
		} else {
			ras.addFlashAttribute("errorMsg", "삭제에 문제가 있어 다시 진행해 주세요.");
			url = "/board/free/freeDetail?common_no=" + fvo.getCommon_no();
		}
		return "redirect:" + url;
	}

}
