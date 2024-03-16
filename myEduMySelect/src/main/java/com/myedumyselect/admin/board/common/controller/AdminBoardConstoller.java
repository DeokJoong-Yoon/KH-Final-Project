package com.myedumyselect.admin.board.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myedumyselect.admin.board.free.service.FreeBoardAdminService;
import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;
import com.myedumyselect.admin.board.matching.service.MatchingBoardAdminService;
import com.myedumyselect.admin.login.vo.AdminLoginVO;
import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.commonboard.notice.service.NoticeBoardService;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;

@Controller
@RequestMapping("/adminBoard/*")
public class AdminBoardConstoller {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardService noticeBoardServcie;
	
	@Setter(onMethod_ = @Autowired)
	private MatchingBoardAdminService matchingBoardAdminService;
	
	@Setter(onMethod_ = @Autowired)
	private FreeBoardAdminService freeBoardAdminService;

	/*************************************************************
	 * Admin notice
	 *************************************************************/

	@GetMapping("/notice")
	public String adminNoticeBoardView(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		// 전체 레코드 조회
		List<NoticeBoardVO> boardList = noticeBoardServcie.boardList(noticeBoardVO);
		model.addAttribute("boardList", boardList);

		// 전체 레코드수 반환.
		int total = noticeBoardServcie.boardListCnt(noticeBoardVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(noticeBoardVO, total));

		return "admin/board/adminNoticeBoardView";
	}

	@GetMapping(value = "/writeForm")
	public String writeForm(HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		return "admin/board/adminNoticeBoardWriteForm";
	}

	@PostMapping("/noticeInsert")
	public String boardInsert(NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardServcie.boardInsert(noticeBoardVO);

		return "redirect:/adminBoard/notice";
	}

	@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		NoticeBoardVO detail = noticeBoardServcie.boardDetail(noticeBoardVO);
		model.addAttribute("detail", detail);
		return "admin/board/adminNoticeBoardDetail";
	}

	@PostMapping("/boardDelete")
	public String boardDelete(@ModelAttribute NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardServcie.boardDelete(noticeBoardVO);
		return "redirect:/adminBoard/notice";
	}

	@GetMapping("/updateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model, HttpSession session) throws Exception {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		NoticeBoardVO updateData = noticeBoardServcie.updateForm(noticeBoardVO);

		model.addAttribute("updateData", updateData);
		return "admin/board/adminNoticeBoardUpdateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute NoticeBoardVO noticeBoardVO) throws Exception {
		int result = 0;
		String url = "";
		
		result = noticeBoardServcie.boardUpdate(noticeBoardVO);
		if(result == 1) {
			url = "/adminBoard/boardDetail?commonNo=" + noticeBoardVO.getCommonNo();
		} else {
			url = "/adminBoard/updateForm?commonNo=" +  noticeBoardVO.getCommonNo();
		}
		return "redirect:" + url;
	}
	
	/*************************************************************
	 * Admin Mathcing
	 *************************************************************/
	@GetMapping("/matching")
	public String matchingBoardAdminView(@ModelAttribute MatchingBoardVO matchingBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<MatchingBoardVO> matchingBoardList = matchingBoardAdminService.boardList(matchingBoardVO);
		model.addAttribute("matchingBoardList", matchingBoardList);

		// 전체 레코드수 반환.
		int total = matchingBoardAdminService.boardListCnt(matchingBoardVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(matchingBoardVO, total));

		return "admin/board/matchingBoardAdminView";
	}
	
	@GetMapping("/matchingBoardDetail")
	public String matchingBoardAdminDetail(@ModelAttribute MatchingBoardVO matchingBoardVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		MatchingBoardVO detail = matchingBoardAdminService.boardDetail(matchingBoardVO);
		model.addAttribute("detail", detail);
		return "admin/board/matchingBoardAdminDetail";
	}
	
	@PostMapping("/matchingBoardDelete")
	public String matchingBoardAdminDelete(@ModelAttribute MatchingBoardVO matchingBoardVO) throws Exception {
		matchingBoardAdminService.boardDelete(matchingBoardVO);
		return "redirect:/adminBoard/matching";
	}
	
	
	/*************************************************************
	 * Admin free
	 *************************************************************/
	@GetMapping("/free")
	public String freeBoardAdminView(@ModelAttribute FreeBoardAdminVO freeBoardAdminVO, Model model, HttpSession session) {
		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		
		List<FreeBoardAdminVO> freeBoardList = freeBoardAdminService.boardList(freeBoardAdminVO);
		model.addAttribute("freeBoardList", freeBoardList);
		
		// 전체 레코드수 반환.
		int total = freeBoardAdminService.boardListCnt(freeBoardAdminVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(freeBoardAdminVO, total));
		
		return "admin/board/freeBoardAdminView";
	}
//	
//	@GetMapping("/matchingBoardDetail")
//	public String matchingBoardAdminDetail(@ModelAttribute MatchingBoardVO matchingBoardVO, Model model, HttpSession session) {
//		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
//		if (adminLoginVO == null) {
//			return "redirect:/admin/login";
//		}
//		MatchingBoardVO detail = matchingBoardAdminService.boardDetail(matchingBoardVO);
//		model.addAttribute("detail", detail);
//		return "admin/board/matchingBoardAdminDetail";
//	}
//	
//	@PostMapping("/matchingBoardDelete")
//	public String matchingBoardAdminDelete(@ModelAttribute MatchingBoardVO matchingBoardVO) throws Exception {
//		matchingBoardAdminService.boardDelete(matchingBoardVO);
//		return "redirect:/adminBoard/matching";
//	}

}
