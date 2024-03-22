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

	/***********************************************************************************
	 * 로그인 처리 메서드 참고 : 자바단에서 세션의 값을 사용할 경우 로그인을 처리하는 컨트롤러 클래스
	 * 위에 @SessionAttributes("adminLogin") 명시해 준 이름을 로그인 정보가 필요한 Controller 내 메서드에서
	 * 다음과 같이 매개변수를 명시해 주면 된다. public 반환형 메서드명(@SessionAttribute("adminLogin")
	 * VO클래스명 참조변수)로 정의하고 사용하면 된다.
	 * 
	 * RedirectAttributes 객체는 리다이렉트 시점(return "redirect:/경로")에 한번만 사용되는 데이터를 전송할 수
	 * 있는 addFlashAttribute()라는 기능을 지원한다. addFlashAttribute() 메서드는 브라우저까지 전송되기는 하지만,
	 * URI에는 보이지 않는 숨겨진 데이터의 형태로 전달된다. redirect:/admin/login?errorMsg=error이라고 전송을
	 * 하여야 하는데 이때 ras.addFlashAttribute("errorMsg", "error");
	 * redirect:/admin/login으로 명시하면 된다.
	 ***********************************************************************************/
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
	public String myPageView(@SessionAttribute("adminLogin") AdminLoginVO adminLoginVO) {
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
			@SessionAttribute("adminLogin") AdminLoginVO adminLoginVO, RedirectAttributes ras, Model model) {
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