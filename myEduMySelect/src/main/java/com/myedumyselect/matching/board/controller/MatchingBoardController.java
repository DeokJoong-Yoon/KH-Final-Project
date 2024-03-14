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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.common.vo.PageDTO;
import com.myedumyselect.matching.board.service.MatchingBoardService;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/matching/*")
public class MatchingBoardController {

	@Autowired
	private MatchingBoardService mbService;
	
	
	//매칭 메인 페이지에 글 목록 미리보기 구현
	@GetMapping("/")
	public String mBoardListPreview(@ModelAttribute MatchingBoardVO mbVO, Model model,  HttpSession session) {
		log.info("mBoardListPreview() 호출 성공");
		
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		if (personalLogin == null) {
			model.addAttribute("confirmMessage", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
	        return "matching/matchingMain";
        }
		
		List<MatchingBoardVO> list = mbService.mBoardListPreview(mbVO);
		model.addAttribute("mBoardList", list);
		
		return "matching/matchingMain";
	}
	
	
	//매칭게시판 전체보기 구현
	@GetMapping("/boardList")
	public String mBoardList(MatchingBoardVO mbVO, Model model, HttpSession session) {
		log.info("mBoardList() 호출 성공");
		
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		
		//세션이 있을 때만 아이디를 모델에 추가
		if(personalLogin != null) {
			String userId = personalLogin.getPersonalId();
			model.addAttribute("userId", userId);
		} 
		
		
		//전체 레코드 조회
		List<MatchingBoardVO> list = mbService.mBoardList(mbVO);
		model.addAttribute("mBoardList", list);
		
		//전체 레코드 수 반환
		int total = mbService.mBoardListCnt(mbVO);
		
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(mbVO, total));
		model.addAttribute("kwd", mbVO.getKeyword());
		
		log.info(mbVO.getKeyword());
		
		return "matching/matchingBoardList";
	}
	
	
	
	
	//맞춤형 검색 결과 구현
	@PostMapping(value="/result", consumes="application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<AcademyLoginVo> mResult(@RequestBody MatchingBoardVO mbVO) {
		log.info("맞춤형 검색 결과 호출");
		List<AcademyLoginVo> list = mbService.mResult(mbVO);
		return list;
	}
	
	

	//공개매칭
	@PostMapping("/publicUpload")
	public String publicUpload(MatchingBoardVO mbVO) {
		log.info("publicUpload 메소드 호출 성공");
		mbService.publicUpload(mbVO);
		
		return "matching/matchingMain";
	}
	
	
	//비공개매칭
	@PostMapping("/privateUpload")
	public String privateUpload(MatchingBoardVO mbVO) {
		log.info("privateUpload 메소드 호출 성공");
		log.info(mbVO.getPrivateChecked().toString());
		mbService.privateUpload(mbVO);
		mbService.sendEmail(mbVO);
		
		return "matching/matchingMain";
	}
	
	
	//매칭게시글 상세보기
	@GetMapping("/boardDetail")
	public String mBoardDetail(MatchingBoardVO mbVO, Model model, HttpSession session) {
		
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		
		if(personalLogin != null) {
			String userId = personalLogin.getPersonalId();
			model.addAttribute("userId", userId);
			model.addAttribute("confirmMsg", "로그인 후 열람할 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		}
		
		MatchingBoardVO detail = mbService.mBoardDetail(mbVO);
		model.addAttribute("detail", detail);
		//model.addAttribute("userId", userId);

		return "matching/matchingDetail";
	}
	
	
	
	//매칭게시글 수정 폼 이동
	@GetMapping("/boardUpdate")
	public String mBoardUpdateForm(MatchingBoardVO mbVO, Model model) {
		MatchingBoardVO updateData = mbService.mBoardUpdateForm(mbVO);
		model.addAttribute("updateData", updateData);
		
		return "matching/matchingUpdate";
	}
	
	//매칭게시글 수정
	@PostMapping("/boardUpdate")
	public String mBoardUpdate(MatchingBoardVO mbVO) {
		
		log.info("boardUpdate 호출 성공");
		
		int result = 0;
		String url = "";
		
		result = mbService.mBoardUpdate(mbVO);
		
		if(result == 1) {
			url = "/matching/boardDetail?matchingNo=" + mbVO.getMatchingNo();
		} else {
			url = "/matching/boardUpdate?matchingNo=" + mbVO.getMatchingNo();
		}
		
		return "redirect:" + url;
	}
	
	
	//매칭 게시글 삭제
	@GetMapping("/boardDelete")
	public String mBoardDelete(MatchingBoardVO mbVO, RedirectAttributes ras) {
		log.info("boardDelete 호출 성공");
		
		int result = 0;
		result = mbService.mBoardDelete(mbVO);
		
		String url = "";
		
		if(result == 1) {
			url = "/matching/boardList";
		} else {
			ras.addFlashAttribute("errorMsg", "삭제에 실패하였습니다. 다시 시도해 주세요.");
			url = "/matching/boardDetail?matchingNo=" + mbVO.getMatchingNo();
		}
		
		return "redirect:" + url;
	}
	
}
