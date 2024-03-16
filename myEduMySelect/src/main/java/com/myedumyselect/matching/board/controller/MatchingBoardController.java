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
import org.springframework.web.bind.annotation.RequestParam;
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
		
		log.info("mBoardDetail 호출");
		
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		
		if(personalLogin != null) {
			String userId = personalLogin.getPersonalId();
			String userName = personalLogin.getPersonalName();
			model.addAttribute("userId", userId);
			model.addAttribute("userName", userName);
			model.addAttribute("confirmMsg", "로그인 후 열람할 수 있습니다. 로그인 페이지로 이동하시겠습니까?");
		}
		
		MatchingBoardVO detail = mbService.mBoardDetail(mbVO);
		model.addAttribute("detail", detail);
		//model.addAttribute("userId", userId);
		
		log.info(detail.toString());

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
	public String mBoardUpdate(@RequestParam("matchingNo") int matchingNo, MatchingBoardVO mbVO, RedirectAttributes ras, HttpSession session) {
		
		log.info("boardUpdate 호출 성공");
		
		//로그인 세션을 personalLogin에 담음
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		
		//로그인 된 id 추출
		String loginId = personalLogin.getPersonalId();
		log.info("loginId : " + loginId);
		
		//게시글 상세정보 가져오기
	    MatchingBoardVO detail = mbService.mBoardDetail(mbVO);
		
		//게시글 작성자 id 추출
	    String boardId = detail.getPersonalId();
	    log.info("boardId : " + boardId);
		
		int result = 0;
		String url = "";
		
		if (boardId.equals(loginId)) {
			result = mbService.mBoardUpdate(mbVO);
			
			if(result == 1) {
				ras.addFlashAttribute("popUp", "수정 완료되었습니다.");
				url = "/matching/boardDetail?matchingNo=" + matchingNo;
				log.info("result : 1");
			} 
			else {
				ras.addFlashAttribute("popUp", "수정에 실패하였습니다. 다시 시도해 주세요.");
				url = "/matching/boardUpdate?matchingNo=" + matchingNo;
				log.info("result : 0");
			}
			
		}
		else {
	        ras.addFlashAttribute("popUp", "수정 권한이 없습니다.");
	        url = "/matching/boardDetail?matchingNo=" + matchingNo;
	        log.info("No permission to delete");
		}
			
		return "redirect:" + url;
	}
	
	
	//매칭 게시글 삭제
	@GetMapping("/boardDelete")
	public String mBoardDelete(@RequestParam("matchingNo") int matchingNo, RedirectAttributes ras, HttpSession session) {
		log.info("boardDelete 호출 성공");
		
		//로그인 세션을 personalLogin에 담음
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		
		//로그인 된 id 추출
		String loginId = personalLogin.getPersonalId();
		log.info("loginId : " + loginId);
		
		//게시글 상세정보 가져오기
		MatchingBoardVO mbVO = new MatchingBoardVO();
	    mbVO.setMatchingNo(matchingNo);
	    MatchingBoardVO detail = mbService.mBoardDetail(mbVO);
		
		//게시글 작성자 id 추출
	    String boardId = detail.getPersonalId();
	    log.info("boardId : " + boardId);
		
		int result = 0;
		String url = "";
		
		if (boardId.equals(loginId)) {
			result = mbService.mBoardDelete(mbVO);
			
			if(result == 1) {
				ras.addFlashAttribute("popUp", "삭제 완료되었습니다.");
				url = "/matching/boardList";
				log.info("result : 1");
			} 
			else {
				ras.addFlashAttribute("popUp", "삭제에 실패하였습니다. 다시 시도해 주세요.");
				url = "/matching/boardDetail?matchingNo=" + mbVO.getMatchingNo();
				log.info("result : 0");
			}
			
		}
		else {
	        ras.addFlashAttribute("popUp", "삭제 권한이 없습니다.");
	        url = "/matching/boardDetail?matchingNo=" + mbVO.getMatchingNo();
	        log.info("No permission to delete");
		}
			
		return "redirect:" + url;
	}
	
}