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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.common.util.SessionCheckService;
import com.myedumyselect.common.vo.PageDTO;
import com.myedumyselect.matching.board.service.MatchingBoardService;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;


@Controller
@RequestMapping("/matching/*")
public class MatchingBoardController {

	@Autowired
	private MatchingBoardService mbService;
	@Autowired
	private SessionCheckService sessionCheckService;

	// 매칭 메인 페이지에 글 목록 미리보기 구현
	@GetMapping("/")
	public String mBoardListPreview(@ModelAttribute MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		List<MatchingBoardVO> list = mbService.mBoardListPreview(mbVO);
		model.addAttribute("mBoardList", list);

		return "matching/matchingMain";
	}
	

	// 매칭게시판 전체보기 구현
	@GetMapping("/boardList")
	public String mBoardList(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		// 전체 레코드 조회
		List<MatchingBoardVO> list = mbService.mBoardList(mbVO);
		model.addAttribute("mBoardList", list);

		// 전체 레코드 수 반환
		int total = mbService.mBoardListCnt(mbVO);

		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(mbVO, total));
		model.addAttribute("kwd", mbVO.getKeyword());

		return "matching/matchingBoardList";
	}

	
	// 맞춤형 검색 결과 구현
	@PostMapping(value = "/result", consumes = "application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<AcademyLoginVO> mResult(@RequestBody MatchingBoardVO mbVO) {
		List<AcademyLoginVO> list = mbService.mResult(mbVO);
		return list;
	}
	

	// 공개매칭
	@PostMapping("/publicUpload")
	@ResponseBody
	public String publicUpload(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {

		// 세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}

		} else {
			return "학원 회원은 공개 매칭을 등록할 수 없습니다.";
		}

		mbService.publicUpload(mbVO);

		return "공개 매칭 게시글이 정상 등록되었습니다.";

	}
	

	// 비공개매칭
	@PostMapping("/privateUpload")
	@ResponseBody
	public String privateUpload(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {

		// 세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}

		} else {
			return "학원 회원은 비공개 매칭을 등록할 수 없습니다.";
		}

		mbService.privateUpload(mbVO);
		mbService.sendEmail(mbVO);

		return "비공개 매칭 게시글 등록과 메일 발송이 정상적으로 처리되었습니다.";
	}

	
	// 매칭게시글 상세보기
	@GetMapping("/boardDetail")
	public String mBoardDetail(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {
		
		//세션 검사
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (!academyResult.equals("TRUE")) {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		MatchingBoardVO detail = mbService.mBoardDetail(mbVO);
		model.addAttribute("detail", detail);

		return "matching/matchingDetail";
	}
	

	// 매칭게시글 수정 폼 이동
	@GetMapping("/boardUpdate")
	public String mBoardUpdateForm(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
	
		//세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		MatchingBoardVO updateData = mbService.mBoardDetail(mbVO);
		model.addAttribute("updateData", updateData);
		return "matching/matchingUpdate";
	}

	
	// 매칭게시글 수정
	@PostMapping("/boardUpdate")
	public String mBoardUpdate(@RequestParam("matchingNo") int matchingNo, MatchingBoardVO mbVO, RedirectAttributes ras,
			Model model, @SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO)
			throws Exception {

		// 세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/loginselect";
		}

		// 게시글 상세 정보를 거쳐 작성자 추출하기
		mbVO.setMatchingNo(matchingNo);
		MatchingBoardVO detail = mbService.mBoardDetail(mbVO);

		String writer = detail.getPersonalId();

		int result = 0;
		String url = "";

		// 작성자와 접속자가 동일할 때 구분
		if (writer.equals(personalLoginVO.getPersonalId())) {
			result = mbService.mBoardUpdate(mbVO);
		} else {
			result = 2;
		}

		// 결과에 따른 팝업
		if (result == 1) {
			ras.addFlashAttribute("popUp", "수정 완료되었습니다.");
			url = "/matching/boardDetail?matchingNo=" + matchingNo;
		} else if (result == 2) {
			ras.addFlashAttribute("popUp", "수정 권한이 없습니다.");
			url = "/matching/boardUpdate?matchingNo=" + matchingNo;
		} else {
			ras.addFlashAttribute("popUp", "수정에 실패하였습니다. 다시 시도해 주세요.");
			url = "/matching/boardUpdate?matchingNo=" + matchingNo;
		}

		return "redirect:" + url;
	}
	

	// 매칭 게시글 삭제
	@PostMapping("/boardDelete")
	public String mBoardDelete(@RequestParam("matchingNo") int matchingNo, RedirectAttributes ras, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO)
			throws Exception {

		// 세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (!personalResult.equals("TRUE")) {
				return personalResult;
			}
		} else {
			return "redirect:/loginselect";
		}

		// 게시글 상세 정보를 거쳐 작성자 추출하기
		MatchingBoardVO mbvo = new MatchingBoardVO();
		mbvo.setMatchingNo(matchingNo);
		MatchingBoardVO detail = mbService.mBoardDetail(mbvo);

		String writer = detail.getPersonalId();

		int result = 0;
		String url = "";

		// 작성자와 접속자가 동일할 때 구분
		if (writer.equals(personalLoginVO.getPersonalId())) {
			result = mbService.mBoardDelete(mbvo);
		} else {
			result = 2;
		}

		// 결과에 따른 팝업
		if (result == 1) {
			ras.addFlashAttribute("popUp", "삭제 완료되었습니다.");
			url = "/matching/boardList";
		} else if (result == 2) {
			ras.addFlashAttribute("popUp", "삭제 권한이 없습니다.");
			url = "/matching/boardDetail?matchingNo=" + matchingNo;
		} else {
			ras.addFlashAttribute("popUp", "삭제에 실패하였습니다. 다시 시도해 주세요.");
			url = "/matching/boardDetail?matchingNo=" + matchingNo;
		}

		return "redirect:" + url;
	}

}