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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;
import com.myedumyselect.common.util.SessionCheckService;
import com.myedumyselect.common.vo.PageDTO;
import com.myedumyselect.matching.board.service.MatchingBoardService;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/matching/*")
@SessionAttributes(SessionInfo.COMMON)
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
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (academyResult != "TRUE") {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String pesronalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (pesronalResult != "TRUE") {
				return pesronalResult;
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
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (academyResult != "TRUE") {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String pesronalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (pesronalResult != "TRUE") {
				return pesronalResult;
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

		log.info(mbVO.getKeyword());

		return "matching/matchingBoardList";
	}
//   // 매칭게시판 전체보기 구현
//   @GetMapping("/boardList")
//   public String mBoardList(MatchingBoardVO mbVO, Model model, HttpSession session) {
//      log.info("mBoardList() 호출 성공");
//      
//      LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
//
//      // 세션이 있을 때만 아이디를 모델에 추가
//      if (loginVo != null) {
//         String userId = loginVo.getId();
//         model.addAttribute("userId", userId);
//      }
//
//      // 전체 레코드 조회
//      List<MatchingBoardVO> list = mbService.mBoardList(mbVO);
//      model.addAttribute("mBoardList", list);
//   
//      // 전체 레코드 수 반환
//      int total = mbService.mBoardListCnt(mbVO);
//  
//      // 페이징 처리
//      model.addAttribute("pageMaker", new PageDTO(mbVO, total));
//      model.addAttribute("kwd", mbVO.getKeyword());
//
//      log.info(mbVO.getKeyword());
//
//      return "matching/matchingBoardList";
//   }

	// 맞춤형 검색 결과 구현
	@PostMapping(value = "/result", consumes = "application/json", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<AcademyLoginVO> mResult(@RequestBody MatchingBoardVO mbVO) {
		log.info("맞춤형 검색 결과 호출");
		List<AcademyLoginVO> list = mbService.mResult(mbVO);
		return list;
	}

	// 공개매칭
	@PostMapping("/publicUpload")
	public String publicUpload(MatchingBoardVO mbVO, Model model, @SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		log.info("publicUpload 메소드 호출 성공");
		
		//세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}
		
		mbService.publicUpload(mbVO);

		return "matching/matchingMain";
	}
	
	

	// 비공개매칭
	@PostMapping("/privateUpload")
	public String privateUpload(MatchingBoardVO mbVO, Model model, @SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		log.info("privateUpload 메소드 호출 성공");
		
		//세션 검사
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}
		
		mbService.privateUpload(mbVO);
		mbService.sendEmail(mbVO);

		return "matching/matchingMain";
	}

	
	// 매칭게시글 상세보기
	@GetMapping("/boardDetail")
	public String mBoardDetail(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO) {
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (academyResult != "TRUE") {
				return academyResult;
			}
		} else if (personalLoginVO != null) {
			String pesronalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (pesronalResult != "TRUE") {
				return pesronalResult;
			}
		} else {
			return "redirect:/";
		}

		MatchingBoardVO detail = mbService.mBoardDetail(mbVO);
		model.addAttribute("detail", detail);
		// model.addAttribute("userId", userId);

		return "matching/matchingDetail";
	}

	// 매칭게시글 수정 폼 이동
	@GetMapping("/boardUpdate")
	public String mBoardUpdateForm(MatchingBoardVO mbVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}
		
		MatchingBoardVO updateData = mbService.mBoardUpdateForm(mbVO);
		model.addAttribute("updateData", updateData);
		return "matching/matchingUpdate";
	}

	// 매칭게시글 수정
	@PostMapping("/boardUpdate")
	public String mBoardUpdate(MatchingBoardVO mbVO, RedirectAttributes ras, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String pesronalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (pesronalResult != "TRUE") {
				return pesronalResult;
			}
		} else {
			return "redirect:/";
		}

		int result = 0;
		String url = "";

		result = mbService.mBoardUpdate(mbVO);

		if (result == 1) {
			ras.addFlashAttribute("popUp", "수정 완료되었습니다.");
			url = "/matching/boardDetail?matchingNo=" + mbVO.getMatchingNo();
		} else {
			ras.addFlashAttribute("popUp", "수정에 실패하였습니다. 다시 시도해 주세요.");
			url = "/matching/boardUpdate?matchingNo=" + mbVO.getMatchingNo();
		}

		return "redirect:" + url;
	}

	// 매칭 게시글 삭제
	@GetMapping("/boardDelete")
	public String mBoardDelete(MatchingBoardVO mbVO, RedirectAttributes ras, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String pesronalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (pesronalResult != "TRUE") {
				return pesronalResult;
			}
		} else {
			return "redirect:/";
		}
		int result = 0;
		result = mbService.mBoardDelete(mbVO);

		String url = "";

		if (result == 1) {
			ras.addFlashAttribute("popUp", "삭제 완료되었습니다.");
			url = "/matching/boardList";
		} else {
			ras.addFlashAttribute("popUp", "삭제에 실패하였습니다. 다시 시도해 주세요.");
			url = "/matching/boardDetail?matchingNo=" + mbVO.getMatchingNo();
		}

		return "redirect:" + url;
	}

//   //이전 게시글 이동
//   @GetMapping("/prev/{matchingNo}")
//   public String prevPost(MatchingBoardVO mbVO, @PathVariable int matchingNo) {
//      
//      //이전 게시글의 번호
//      int prevNo = mbService.prevMatchingNo(mbVO);
//      
//      //주소 담을 변수
//      String url = "";
//      
//      if(prevNo == -1) {
//         url = "redirect:/matching/boardDetail?matchingNo=" + matchingNo;
//      } else {
//         url =  "redirect:/matching/boardDetail?matchingNo=" + prevNo;
//      }
//      
//      return url;
//   }
//   
//   
//   //다음 게시글 이동
//   @GetMapping("/next/{matchingNo}")
//   public String nextPost(MatchingBoardVO mbVO, @PathVariable int matchingNo) {
//      
//      //다음 게시글의 번호
//      int nextNo = mbService.nextMatchingNo(mbVO);
//      
//      //주소 담을 변수
//      String url = "";
//      
//      if(nextNo == -1) {
//         url = "redirect:/matching/boardDetail?matchingNo=" + matchingNo;
//      } else {
//         url =  "redirect:/matching/boardDetail?matchingNo=" + nextNo;
//      }
//      
//      return url;
//   }

}