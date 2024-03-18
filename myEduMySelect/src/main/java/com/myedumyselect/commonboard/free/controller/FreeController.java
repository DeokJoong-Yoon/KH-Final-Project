package com.myedumyselect.commonboard.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		return "redirect:"+url;
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

	
	
	/*글 수정 구현
	@GetMapping(value="/freeUpdateForm")
	public String freeUpdateForm(@RequestParam("common_no") int common_no, Model model) {
	    log.info("freeUpdateForm 호출 성공");
	    log.info("common_no = " + common_no);
	    
	    FreeVO fvo = new FreeVO();
	    fvo.setCommon_no(common_no);
	    
	    FreeVO freeUpdateData = freeService.freeUpdateForm(fvo);
	    
	    model.addAttribute("freeUpdateData", freeUpdateData);
	    return "/board/free/freeUpdateForm";
	}

	@PostMapping("/freeUpdate")
	public String freeUpdate(@ModelAttribute FreeVO fvo, RedirectAttributes ras, Model model) {
	    log.info("freeUpdate 호출 성공");
	    
	    int result = 0;
	    String url = "";
	    
	    result = freeService.freeUpdate(fvo);
	    ras.addFlashAttribute("freeVO", fvo);
	    model.addAttribute("freeUpdateData", fvo);
	    
	    if(result == 1) {
	        url = "/board/freeDetail?common_no=" + fvo.getCommon_no();
	    } else {
	        url = "/board/freeUpdateForm?common_no=" + fvo.getCommon_no();
	    }
	    return "redirect:" + url;
	}*/
	
	// 수정기능이 되지 않아 우선 보류....


	
	/* 글 삭제
	
	@PostMapping("/freeDelete")
	public String freeDelete(@ModelAttribute FreeVO fvo, RedirectAttributes ras) {
		log.info("freeDelete 호출 성공");
		
		int result = 0;
		String url="";
		result = freeService.freeDelete(fvo);
		
		if(result == 1) {
			url="/free/freeList";
		} else {
			ras.addFlashAttribute("errorMsg", "삭제에 문제가 있어 다시 진행해 주세요.");
			url="/free/freeDetail?common_no="+fvo.getCommon_no();
		}
		return "redirect:"+url;
	}*/
	
	
	// 삭제는 정상처리로 알려주는데 실제로 삭제가 안되서 이것도 보류...
	
	/*@ResponseBody
	@PostMapping(value="/replyCount", produces=MediaType.TEXT_PLAIN_VALUE)
	public String replyCount(@RequestParam("common_no") int common_no) {
		log.info("replyCount 호출 성공");
		
		int result = 0;
		result = freeService.replyCount(common_no);
		
		return String.valueOf(result);
	}*/

}
