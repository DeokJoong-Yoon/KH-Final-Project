package com.myedumyselect.admin.board.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.admin.board.academy.service.AcademySourceAdminService;
import com.myedumyselect.admin.board.free.reply.service.FreeReplyAdminService;
import com.myedumyselect.admin.board.free.reply.vo.FreeReplyAdminVO;
import com.myedumyselect.admin.board.free.service.FreeBoardAdminService;
import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;
import com.myedumyselect.admin.board.matching.reply.service.MatchingReplyAdminService;
import com.myedumyselect.admin.board.matching.reply.vo.MatchingReplyAdminVO;
import com.myedumyselect.admin.board.matching.service.MatchingBoardAdminService;
import com.myedumyselect.admin.login.vo.AdminLoginVO;
import com.myedumyselect.admin.member.service.AcademyAdminService;
import com.myedumyselect.admin.member.service.PersonalAdminService;
import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.member.vo.PersonalAdminVO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;
import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.commonboard.advertise.service.AdvertiseService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.commonboard.notice.service.NoticeBoardService;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.payment.vo.PaymentVO;

import lombok.Setter;

@Controller
@RequestMapping("/adminBoard/*")
public class AdminBoardController {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardService noticeBoardService;

	@Setter(onMethod_ = @Autowired)
	private MatchingBoardAdminService matchingBoardAdminService;

	@Setter(onMethod_ = @Autowired)
	private FreeBoardAdminService freeBoardAdminService;

	@Setter(onMethod_ = @Autowired)
	private AdvertiseService advertiseService;

	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;

	@Setter(onMethod_ = @Autowired)
	private PersonalAdminService personalAdminService;

	@Setter(onMethod_ = @Autowired)
	private AcademyAdminService academyAdminService;

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	@Setter(onMethod_ = @Autowired)
	private AcademySourceAdminService academySourceAdminService;

	@Setter(onMethod_ = @Autowired)
	private FreeReplyAdminService freeReplyAdminService;

	@Setter(onMethod_ = @Autowired)
	private MatchingReplyAdminService matchingReplyAdminService;

	/*************************************************************
	 * Admin notice
	 *************************************************************/

	@GetMapping("/notice")
	public String adminNoticeBoardView(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		// 전체 레코드 조회
		List<NoticeBoardVO> boardList = noticeBoardService.boardList(noticeBoardVO);
		model.addAttribute("boardList", boardList);

		// 전체 레코드수 반환.
		int total = noticeBoardService.boardListCnt(noticeBoardVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(noticeBoardVO, total));

		return "admin/board/adminNoticeBoardView";
	}

	@GetMapping(value = "/writeForm")
	public String writeForm(@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		return "admin/board/adminNoticeBoardWriteForm";
	}

	@PostMapping("/noticeInsert")
	public String boardInsert(NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardService.boardInsert(noticeBoardVO);

		return "redirect:/adminBoard/notice";
	}

	@GetMapping("/boardDetail")
	public String boardDetail(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		NoticeBoardVO detail = noticeBoardService.boardDetail(noticeBoardVO);
		model.addAttribute("detail", detail);
		return "admin/board/adminNoticeBoardDetail";
	}

	@PostMapping("/boardDelete")
	public String boardDelete(@ModelAttribute NoticeBoardVO noticeBoardVO) throws Exception {
		noticeBoardService.boardDelete(noticeBoardVO);
		return "redirect:/adminBoard/notice";
	}

	@GetMapping("/updateForm")
	public String updateForm(@ModelAttribute NoticeBoardVO noticeBoardVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) throws Exception {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		NoticeBoardVO updateData = noticeBoardService.updateForm(noticeBoardVO);

		model.addAttribute("updateData", updateData);
		return "admin/board/adminNoticeBoardUpdateForm";
	}

	@PostMapping("/boardUpdate")
	public String boardUpdate(@ModelAttribute NoticeBoardVO noticeBoardVO) throws Exception {
		int result = 0;
		String url = "";

		result = noticeBoardService.boardUpdate(noticeBoardVO);
		if (result == 1) {
			url = "/adminBoard/boardDetail?commonNo=" + noticeBoardVO.getCommonNo();
		} else {
			url = "/adminBoard/updateForm?commonNo=" + noticeBoardVO.getCommonNo();
		}
		return "redirect:" + url;
	}

	/*************************************************************
	 * Admin Mathcing
	 *************************************************************/
	@GetMapping("/matching")
	public String matchingBoardAdminView(@ModelAttribute MatchingBoardVO matchingBoardVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
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
	public String matchingBoardAdminDetail(@ModelAttribute MatchingBoardVO matchingBoardVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
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
	public String freeBoardAdminView(@ModelAttribute FreeBoardAdminVO freeBoardAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
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

	@GetMapping("/freeBoardDetail")
	public String freeBoardAdminDetail(@ModelAttribute FreeBoardAdminVO freeBoardAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		FreeBoardAdminVO detail = freeBoardAdminService.boardDetail(freeBoardAdminVO);
		model.addAttribute("detail", detail);
		return "admin/board/freeBoardAdminDetail";
	}

	@PostMapping("/freeBoardDelete")
	public String freeBoardAdminDelete(@ModelAttribute FreeBoardAdminVO freeBoardAdminVO, Model model)
			throws Exception {
		freeBoardAdminService.boardDelete(freeBoardAdminVO);
		return "redirect:/adminBoard/free";
	}

	/*************************************************************
	 * Admin advertise
	 *************************************************************/
	@GetMapping("/advertise")
	public String advertiseBoardAdminView(@ModelAttribute AdvertiseVO advertiseVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<AdvertiseVO> advertiseBoardList = advertiseService.advertiseList(advertiseVO);
		model.addAttribute("advertiseBoardList", advertiseBoardList);

		// 전체 레코드수 반환.
		int total = advertiseService.advertiseListCnt(advertiseVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(advertiseVO, total));

		return "admin/board/advertiseBoardAdminView";
	}

	@PostMapping("/advertiseBoardDelete")
	public String advertiseBoardDelete(@ModelAttribute AdvertiseVO advertiseVO, Model model) throws Exception {
		advertiseService.advertiseDelete(advertiseVO);
		return "redirect:/adminBoard/advertise";
	}

	@GetMapping("/advertiseBoardDetail")
	public String advertiseBoardDetail(@ModelAttribute AdvertiseVO advertiseVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		AdvertiseVO detail = advertiseService.advertiseDetail(advertiseVO);
		model.addAttribute("detail", detail);
		return "admin/board/advertiseBoardAdminDetail";
	}

	/*************************************************************
	 * Admin freeComment
	 *************************************************************/
	@GetMapping("/freeComment")
	public String freeCommentAdminView(@ModelAttribute FreeReplyAdminVO freeReplyAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<FreeReplyAdminVO> commentList = freeReplyAdminService.commentList(freeReplyAdminVO);
		model.addAttribute("commentList", commentList);

		// 전체 레코드수 반환.
		int total = freeReplyAdminService.commentListCnt(freeReplyAdminVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(freeReplyAdminVO, total));

		return "admin/board/freeCommentAdminView";
	}

	@PostMapping("/freeCommentDelete")
	public String freeCommentDelete(@ModelAttribute FreeReplyAdminVO freeReplyAdminVO, Model model) throws Exception {
		freeReplyAdminService.commentDelete(freeReplyAdminVO);
		return "redirect:/adminBoard/freeComment";
	}

	/*************************************************************
	 * Admin matchingComment
	 *************************************************************/
	@GetMapping("/matchingComment")
	public String matchingCommentAdminView(@ModelAttribute MatchingReplyAdminVO matchingReplyAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<MatchingReplyAdminVO> commentList = matchingReplyAdminService.commentList(matchingReplyAdminVO);
		model.addAttribute("commentList", commentList);

		// 전체 레코드수 반환.
		int total = matchingReplyAdminService.commentListCnt(matchingReplyAdminVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(matchingReplyAdminVO, total));

		return "admin/board/matchingCommentAdminView";
	}

	@PostMapping("/matchingCommentDelete")
	public String freeCommentDelete(@ModelAttribute MatchingReplyAdminVO matchingReplyAdminVO, Model model)
			throws Exception {
		matchingReplyAdminService.commentDelete(matchingReplyAdminVO);
		return "redirect:/adminBoard/matchingComment";
	}

	/*************************************************************
	 * Admin payment
	 *************************************************************/
	@GetMapping("/payment")
	public String paymentBoardAdminView(@ModelAttribute PaymentVO paymentVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<PaymentVO> paymentList = paymentService.boardList(paymentVO);
		model.addAttribute("paymentList", paymentList);
		// 전체 레코드수 반환.
		int total = paymentService.boardListCnt(paymentVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(paymentVO, total));

		return "admin/board/paymentBoardView";
	}

	@GetMapping("/paymentBoardDetail")
	public String paymentBoardDetail(@ModelAttribute PaymentVO paymentVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		PaymentVO detail = paymentService.boardDetail(paymentVO);
		model.addAttribute("detail", detail);

		return "admin/board/paymentBoardDetail";
	}

	@PostMapping("/paymentBoardDelete")
	public String paymentBoardDelete(@ModelAttribute PaymentVO paymentVO, Model model) throws Exception {
		paymentService.boardDelete(paymentVO);
		return "redirect:/adminBoard/payment";
	}

	/*************************************************************
	 * Admin personal
	 *************************************************************/
	@GetMapping("/personal")
	public String personalBoardAdminView(@ModelAttribute PersonalAdminVO personalAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<PersonalAdminVO> personalAdminList = personalAdminService.memberList(personalAdminVO);
		model.addAttribute("personalAdminList", personalAdminList);
		// 전체 레코드수 반환.
		int total = personalAdminService.memberListCnt(personalAdminVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(personalAdminVO, total));

		return "admin/board/personalListView";
	}

	@GetMapping("/personalListDetail")
	public String personalListDetail(@ModelAttribute PersonalAdminVO personalAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		PersonalAdminVO detail = personalAdminService.memberDetail(personalAdminVO);
		model.addAttribute("detail", detail);

		return "admin/board/personalListDetail";
	}

	@PostMapping("/personalDelete")
	public String personalDelete(@ModelAttribute PersonalAdminVO personalAdminVO, Model model) throws Exception {
		personalAdminService.memberDelete(personalAdminVO);
		return "redirect:/adminBoard/personal";
	}

	/*************************************************************
	 * Admin academy
	 *************************************************************/
	@GetMapping("/academy")
	public String academyBoardAdminView(@ModelAttribute AcademyAdminVO academyAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<AcademyAdminVO> academyAdminList = academyAdminService.memberList(academyAdminVO);
		model.addAttribute("academyAdminList", academyAdminList);
		// 전체 레코드수 반환.
		int total = academyAdminService.memberListCnt(academyAdminVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(academyAdminVO, total));

		return "admin/board/academyListView";
	}

	@GetMapping("/acadmeyListDetail")
	public String academyListDetail(@ModelAttribute AcademyAdminVO academyAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		AcademyAdminVO detail = academyAdminService.memberDetail(academyAdminVO);
		model.addAttribute("detail", detail);

		return "admin/board/academyListDetail";
	}

	@PostMapping("/academyDelete")
	public String academyDelete(@ModelAttribute AcademyAdminVO academyAdminVO, Model model) throws Exception {
		academyAdminService.memberDelete(academyAdminVO);
		return "redirect:/adminBoard/academy";

	}

	/*************************************************************
	 * Admin academySource
	 *************************************************************/
	@GetMapping("/academySource")
	public String academySourceBoardAdminView(@ModelAttribute AcademySourceVO academySourceVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		List<AcademySourceVO> academySourceList = academySourceAdminService.academySourceList(academySourceVO);
		model.addAttribute("academySourceList", academySourceList);
		// 전체 레코드수 반환.
		int total = academySourceAdminService.academySourceListCnt(academySourceVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(academySourceVO, total));

		return "admin/board/academySourceListView";
	}

	@GetMapping("/acadmeySourceListDetail")
	public String academySourceListDetail(@ModelAttribute AcademySourceVO academyAdminVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		AcademySourceVO detail = academySourceAdminService.memberDetail(academyAdminVO);
		model.addAttribute("detail", detail);

		return "admin/board/academySourceListDetail";
	}

	/*************************************************************
	 * Admin academySourceLoad
	 *************************************************************/
	@GetMapping("/academySourceLoad")
	public String academySourceLoadView(@ModelAttribute AcademySourceVO academySourceVO, Model model,
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		return "admin/board/adminAcademySourceLoad";
	}

}
