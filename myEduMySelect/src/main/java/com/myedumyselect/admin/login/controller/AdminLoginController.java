package com.myedumyselect.admin.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.admin.board.free.service.FreeBoardAdminService;
import com.myedumyselect.admin.board.free.vo.FreeBoardAdminVO;
import com.myedumyselect.admin.board.matching.service.MatchingBoardAdminService;
import com.myedumyselect.admin.login.service.AdminLoginService;
import com.myedumyselect.admin.login.vo.AdminLoginVO;
import com.myedumyselect.admin.member.service.AcademyAdminService;
import com.myedumyselect.admin.member.service.PersonalAdminService;
import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.member.vo.PersonalAdminVO;
import com.myedumyselect.commonboard.notice.service.NoticeBoardService;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SessionAttributes("adminLogin")
@RequestMapping("/admin/*")
@Slf4j
@Controller
public class AdminLoginController {
	@Setter(onMethod_ = @Autowired)
	private AdminLoginService adminLoginService;

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardService noticeBoardService;

	@Setter(onMethod_ = @Autowired)
	private MatchingBoardAdminService matchingBoardAdminService;

	@Setter(onMethod_ = @Autowired)
	private FreeBoardAdminService freeBoardAdminService;

	@Setter(onMethod_ = @Autowired)
	private AcademyAdminService academyAdminService;

	@Setter(onMethod_ = @Autowired)
	private PersonalAdminService personalAdminService;

	@GetMapping("/login")
	public String loginProcess(Model model) {

		System.out.println("로그인");

		if (model.containsAttribute("adminLogin")) {

			// Board 리스트 결과
			NoticeBoardVO noticeBoardVO = new NoticeBoardVO();
			List<NoticeBoardVO> noticeBoardList = noticeBoardService.boardList(noticeBoardVO);
			model.addAttribute("noticeBoardList", noticeBoardList);
			MatchingBoardVO matchingBoardVO = new MatchingBoardVO();
			List<MatchingBoardVO> matchingBoardList = matchingBoardAdminService.boardList(matchingBoardVO);
			model.addAttribute("matchingBoardList", matchingBoardList);
			FreeBoardAdminVO freeBoardAdminVO = new FreeBoardAdminVO();
			List<FreeBoardAdminVO> freeBoardList = freeBoardAdminService.boardList(freeBoardAdminVO);
			model.addAttribute("freeBoardList", freeBoardList);

			// 회원 리스트 결과
			PersonalAdminVO personalAdminVO = new PersonalAdminVO();
			List<PersonalAdminVO> personalAdminList = personalAdminService.memberList(personalAdminVO);
			model.addAttribute("personalAdminList", personalAdminList);
			AcademyAdminVO academyAdminVO = new AcademyAdminVO();
			List<AcademyAdminVO> academyAdminList = academyAdminService.memberList(academyAdminVO);
			model.addAttribute("academyAdminList", academyAdminList);

		}

		return "admin/login/adminMain";
	}

	@PostMapping("/login")
	public String loginProcess(AdminLoginVO login, Model model, RedirectAttributes ras) {
		AdminLoginVO adminLogin = adminLoginService.loginProcess(login);

		/* 로그인 확인 */
		if (adminLogin != null) {
			model.addAttribute("adminLogin", adminLogin);

		} else {

			ras.addFlashAttribute("errorMsg", "아이디 혹은 패스워드가 맞지 않습니다.");
		}
		return "redirect:/admin/login";

	}

	@GetMapping("/logout")
	public String logoutProcess(SessionStatus sessionStatus) {
		log.info("admin 로그인 아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/admin/login";
	}

	@GetMapping(value = "/myPage")
	public String myPageView(@SessionAttribute(value = "adminLogin", required = false) AdminLoginVO adminLoginVO) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		return "/admin/login/myPage";
	}

	@PostMapping(value = "/updateAdminInfo")
	public String updateAdminInfo(AdminLoginVO newAdminInfo, Model model) {

		adminLoginService.updateAdminInfo(newAdminInfo);
		model.addAttribute("adminLogin", newAdminInfo);
		return "/admin/login/myPage";
	}

	@ResponseBody
	@PostMapping(value = "/updateAdminPasswd")
	public String updateAdminPasswd(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("renewPassword") String renewPassword,
			@SessionAttribute(value = "adminLogin", required = false) AdminLoginVO adminLoginVO, RedirectAttributes ras,
			Model model) {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		AdminLoginVO curAdminLogin = new AdminLoginVO();
		curAdminLogin.setAdminId(adminLoginVO.getAdminId());
		curAdminLogin.setAdminPasswd(currentPassword);
		AdminLoginVO checkPassword = adminLoginService.loginProcess(curAdminLogin);
		// 현재 계정의 패스워드 재확인
		if (checkPassword != null) {
			if (!renewPassword.equals(newPassword)) {
				ras.addFlashAttribute("errorMsg", "New Password 와 Re-enter New Password 가 일치하지 않습니다.");
				return "FALSE";
			}
			int result = 0;
			checkPassword.setAdminPasswd(renewPassword);
			result = adminLoginService.updateAdminPasswd(checkPassword);
			if (result == 1) {
				model.addAttribute("adminLogin", adminLoginService.loginProcess(checkPassword));
				ras.addFlashAttribute("successMsg", "패스워드 변경 완료");
				return "TRUE";
			}
		} else {
			ras.addFlashAttribute("errorMsg", "패스워드가 맞지 않습니다.");
			return "FALSE";
		}

		ras.addFlashAttribute("errorMsg", "패스워드 변경 실패");
		return "FALSE";
	}
}