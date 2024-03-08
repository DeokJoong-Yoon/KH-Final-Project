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
import org.springframework.web.bind.annotation.ResponseBody;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.service.MatchingBoardService;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/matching/*")
public class MatchingBoardController {

	@Autowired
	private MatchingBoardService mbService;
	
	
	//글 목록 미리보기 구현
	@GetMapping("/")
	public String mBoardListPreview(@ModelAttribute MatchingBoardVO mbVO, Model model) {
		//log.info("mBoardListPreview() 호출 성공");
		List<MatchingBoardVO> list = mbService.mBoardListPreview(mbVO);
		model.addAttribute("mBoardList", list);
		
		return "matching/matchingMain";
	}
	
	
	//매칭게시판 전체보기 구현
	@GetMapping("/boardList")
	public String mBoardList() {
		return "matching/matchingBoardList";
	}
	
	
	//맞춤형 검색 결과 구현
	@PostMapping(value="/result", consumes="application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<AcademyLoginVo> mResult(@RequestBody MatchingBoardVO mbVO) {
		List<AcademyLoginVo> list = mbService.mResult(mbVO);
		return list;
        
	}

	//맞춤형 검색 결과 구현
	@PostMapping(value="/result", consumes="application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	public String mResult(@RequestBody MatchingBoardVO mbVO, Model model) {
		
		log.info("mResult() 호출 성공");
		log.info("MatchingBoardVO : " + mbVO);
		
		List<AcademyLoginVo> list = mbService.mResult(mbVO);
		model.addAttribute("mResult", list);
		
		log.info("mResult 리스트 내용:");
		for (AcademyLoginVo academyVo : list) {
			if (academyVo != null) {
				log.info(academyVo.toString());
			} else {
				log.info("리스트 요소가 null입니다.");
			}
		}
		
		return "matching/matchingMain";
	}
	
	

	//공개매칭
	@PostMapping("/publicUpload")
	public String publicUpload( MatchingBoardVO mbVO) {
		log.info("publicUpload 메소드 호출 성공");
		mbService.publicUpload(mbVO);
		
		
		System.out.println("구 : " + mbVO.getMatchingGuAddress());
		System.out.println("코멘트 : " + mbVO.getMatchingComment());
		System.out.println("키워드1" + mbVO.getMatchingKeyword1());
		System.out.println("키워드2 : " + mbVO.getMatchingKeyword2());
		System.out.println("키워드3 : " + mbVO.getMatchingKeyword3());
		
		return "redirect:/matching/matchingMain";
	}
}
