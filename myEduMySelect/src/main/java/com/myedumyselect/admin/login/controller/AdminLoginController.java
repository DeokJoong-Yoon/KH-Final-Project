package com.myedumyselect.admin.login.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

/**
 * @SessionAttribute : 모델(Model) 정보를 HTTP 세션에 저장해주는 어노테이션 HttpSession을 직접 사용할
 *                   수도있지만 이 어노테이션에 설정한 이름에 해당하는 모델 정보를 자동으로 세선에 넣어준다.
 */

@Controller
/**
 * @SessionAttributes 파라미터로 지정된 이름과 같은 이름이
 * @ModelAttribute에 지정 있을 겨웅 메소드가 반환되는 값은 세션에 저장된다.
 */
//@SessionAttributes({"adminLogin", "boardList"})
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
	public String myPageView(HttpSession session) {

		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");

		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}

		return "/admin/login/myPage";
	}
}