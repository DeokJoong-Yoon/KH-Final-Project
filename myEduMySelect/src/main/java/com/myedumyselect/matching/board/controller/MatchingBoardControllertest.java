package com.myedumyselect.matching.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.academy.vo.AcademyVo;
import com.myedumyselect.matching.board.service.MatchingBoardService;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/matchingtest/*")
public class MatchingBoardControllertest {

	@Autowired
	private MatchingBoardService mbService;
	
	
	//글 목록 미리보기 구현
	@GetMapping("/")
	public String mBoardListPreview(@ModelAttribute MatchingBoardVO mbVO, Model model) {
		//log.info("mBoardListPreview() 호출 성공");
		List<MatchingBoardVO> list = mbService.mBoardListPreview(mbVO);
		model.addAttribute("mBoardList", list);
		
		return "matching/matchingMaintest";
	}
	
	
	//매칭게시판 전체보기 구현
	@GetMapping("/boardList")
	public String mBoardList() {
		return "matching/matchingBoardList";
	}
	
	/*
	//맞춤형 검색 결과 구현
	@PostMapping(value="/result", consumes="application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	public String mResult(@RequestBody MatchingBoardVO mbVO, Model model) {
		
		log.info("mResult() 호출 성공");
		log.info("MatchingBoardVO : " + mbVO);
		
		List<AcademyVo> list = mbService.mResult(mbVO);
        model.addAttribute("mResult", list);
        
        log.info("mResult 리스트 내용:");
        for (AcademyVo academyVo : list) {
            if (academyVo != null) {
                log.info(academyVo.toString());
            } else {
                log.info("리스트 요소가 null입니다.");
            }
        }
        
        return "matching/matchingMain";
	}
	*/
	//맞춤형 검색 결과 구현
	@PostMapping(value="/result", consumes="application/json")
	public String mResult(@RequestBody MatchingBoardVO mbVO, Model model) {
		
		log.info("mResult() 호출 성공");
		log.info("MatchingBoardVO : " + mbVO);
		
		List<AcademyVo> list = mbService.mResult(mbVO);
		model.addAttribute("mResult", list);
		
		log.info("mResult 리스트 내용:");
		for (AcademyVo academyVo : list) {
			if (academyVo != null) {
				log.info(academyVo.toString());
			} else {
				log.info("리스트 요소가 null입니다.");
			}
		}
		
//		return "matching/testtest";
		return "/matching/matchingtest";
	}
	
	
//	//공개매칭
//	@ResponseBody
//	@PostMapping(value="/publicUpload", produces="text/plain; charset=UTF-8") 
//	public String mPublicUpload(MatchingBoardVO mbVO) {
//		log.info("mPublicUpload 호출 완료");
//		int result = mbService.mPublicUpload(mbVO);
//		
//		String value = "";
//		if (result == 1) {
//			value = "성공";
//		} else {
//			value = "실패";
//		}
//		log.info("result : " + result);
//		
//		return value;
//	}
}
