package com.myedumyselect.commonboard.free.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.common.file.FileUploadUtil;
import com.myedumyselect.common.vo.PageDTO;
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
		log.info("freeList 호출 성공") ;
		
		List<FreeVO> freeList = freeService.freeList(fvo);
		model.addAttribute("freeList", freeList);
		
		int total = freeService.freeListCnt(fvo);
		
		model.addAttribute("pageMaker", new PageDTO(fvo, total));
		return "board/free/freeBoardList";
		
	}
	
	
	/* 글 쓰기 구현
	@PostMapping("/freeInsert")
	public String freeInsert(FreeVO fvo) throws Exception{
		int result = 0;
		if(fvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(fvo.getFile(), "free");
			fvo.setcommonFile(fileName);
		}
		result = freeDAO.freeInsert(fvo);
		return result;
	}*/
	
	
	/* 글쓰기 폼 구현*/
	@GetMapping(value = "/freeWriterForm")
	public String freeWriterForm() {
		log.info("freeWriterForm 호출 성공");

		return "board/free/freeWriterForm";
	}
	
	/*@PostMapping("/freeInsert")
	public String freeInsert(FreeVO fvo) throws Exception{
		log.info("freeInsert 호출 성공");
		freeService.freeInsert(fvo);
		return "redirect:/free/freeList";
	}*/
	
	@PostMapping("/freeInsert")
	public String freeInsert(FreeVO fvo) throws Exception {
		log.info("freeInsert 호출 성공");
		freeService.freeInsert(fvo);

		log.info(fvo.toString());
		return "redirect:/free/freeList";
	}

	
	
	/*글 상세 구현*/
	@GetMapping("/freeDetail")
	public String freeDetail(@ModelAttribute FreeVO fvo, Model model) {
		log.info("freeDetail 호출 성공");

		FreeVO detail = freeService.freeDetail(fvo);
		model.addAttribute("detail", detail);

		return "board/free/freeBoardDetail";
	}

	
	
	//글 수정 구현
	
	@GetMapping(value="/freeUpdateForm")
	public String freeUpdateForm(@ModelAttribute FreeVO fvo, Model model) {
	    log.info("freeUpdateForm 호출 성공");
	    log.info("commonNo = " + fvo.getCommonNo());
	    
	    FreeVO freeUpdateData = freeService.freeUpdateForm(fvo);
	    
	    model.addAttribute("freeUpdateData", freeUpdateData);
	    return "board/free/freeUpdateForm";
	}

	

	/*@PostMapping("/freeUpdate")
	public String freeUpdate(@ModelAttribute FreeVO fvo, RedirectAttributes ras) {
	    log.info("freeUpdate 호출 성공");
	    
	    int result = 0;
	    String url = "";
	    
	    result = freeService.freeUpdate(fvo);
	    ras.addFlashAttribute("freeVO", fvo);
		/* model.addAttribute("freeUpdateData", fvo);
	    
	    if(result == 1) {
	        url = "/free/freeDetail?commonNo=" + fvo.getCommonNo();
	    } else {
	        url = "/free/freeUpdateForm?commonNo=" + fvo.getCommonNo();
	    }
	    return "redirect:" + url;
	}*/
	
	
	 //글 삭제
	
	/*@PostMapping("/freeDelete")
	public String freeDelete(@ModelAttribute FreeVO fvo){
		log.info("freeDelete 호출 성공");
		
		int result = 0;
		String url="";
		result = freeService.freeDelete(fvo);
		
		if(result == 1) {
			url="/free/freeList";
		} else {
			url="/free/freeDetail?commonNo="+fvo.getCommonNo();
		}
		return "redirect:"+url;
	}*/
	
	@PostMapping("/freeUpdate")
	public String freeUpdate(@ModelAttribute FreeVO fvo) throws Exception{
		log.info("freeUpdate 호출 성공");
		freeService.freeUpdate(fvo);
		return "redirect:/free/freeList";
	}
	
	@PostMapping("/freeDelete")
	public String freeDelete(@ModelAttribute FreeVO fvo) throws Exception{
		log.info("freeDelete 호출 성공");
		freeService.freeDelete(fvo);
		return "redirect:/free/freeList";
	}

	
	
	
	@ResponseBody
	@PostMapping(value="/freeReplyCnt", produces=MediaType.TEXT_PLAIN_VALUE)
	public String freeReplyCnt(@RequestParam("commonNo") int commonNo) {
		log.info("freeReplyCnt 호출 성공");
		
		int result = 0;
		result = freeService.freeReplyCnt(commonNo);
		
		return String.valueOf(result);
	}

}
