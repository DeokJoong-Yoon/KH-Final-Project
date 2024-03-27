package com.myedumyselect.personal.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.common.util.SessionCheckService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.commonboard.free.vo.FreeVO;
import com.myedumyselect.commonboard.like.vo.LikeVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.personal.service.PersonalFreeBoardService;
import com.myedumyselect.personal.service.PersonalLikeService;
import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.service.PersonalMatchingBoardService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("personalLogin")
public class PersonalLoginController {

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginService personalLoginService;

	@Autowired
	private PersonalMatchingBoardService personalMatchingBoardService;

	@Autowired
	private PersonalFreeBoardService personalFreeBoardService;

	@Autowired
	private PersonalLikeService personalLikeService;

	@Autowired
	private SessionCheckService sessionCheckService;
	
	/*************************************************************
	 * Personal Login
	 *************************************************************/

	@GetMapping("/personal/login")
	public String loginForm() {
		return "personal/login"; // login.jsp 호출

	}
	
	@PostMapping("/personal/login")
	public String loginProcess(PersonalLoginVO login, Model model, RedirectAttributes ras, HttpSession session) {
		
		Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
		Date bannedUntil = (Date) session.getAttribute("bannedUntil");

		// 계정이 잠겨 있을 때
		if (bannedUntil != null && new Date().before(bannedUntil)) {
			long remainingTime = (bannedUntil.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
			ras.addFlashAttribute("errorMsg", "계정이 잠겨 있습니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
			return "redirect:/personal/login";
		}

		// 로그인 시도 횟수 카운트
		if (loginAttempts == null) {
			loginAttempts = 0;
		}
	
		// 로그인 시도
		PersonalLoginVO personalLogin = personalLoginService.loginProcess(login);

		if (personalLogin != null) {
			model.addAttribute("personalLogin", personalLogin);
			session.removeAttribute("loginAttempts"); 
		} else {
			loginAttempts++;
			session.setAttribute("loginAttempts", loginAttempts);

			if (loginAttempts >= 5) {
				long currentTime = System.currentTimeMillis();
				Date lockoutTime = new Date(currentTime + (10 * 60 * 1000)); // 10분 후 시간
				session.setAttribute("bannedUntil", lockoutTime);

				long remainingTime = (lockoutTime.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
				ras.addFlashAttribute("loginAttempts", "5/5");
				ras.addFlashAttribute("errorMsg",
						"아이디 및 비밀번호 입력 5회 이상 실패하였습니다. 계정 로그인이 10분간 제한됩니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
				ras.addFlashAttribute("bannedUntil", lockoutTime);

				return "redirect:/personal/login";
			} else {
				ras.addFlashAttribute("errorMsg",
						"아이디 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.로그인 시도 횟수: " + loginAttempts + "/5");
				log.warn("로그인 실패  현재 로그인 시도 횟수: " + loginAttempts);
				return "redirect:/personal/login";
			} 
		}
		
		return "redirect:/personal/login"; 
	}
	
	/*************************************************************
	 * Personal Logout
	 *************************************************************/

	// 로그아웃
	@PostMapping("/personal/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/loginselect";
	}
	
	@GetMapping("/personal/logout")
	public String getLogout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}
	

	/*************************************************************
	 * Personal Join
	 *************************************************************/

	// 개인회원 가입 페이지
	@GetMapping(value = "/personal/join")
	public String personalJoinForm() {
		return "personal/personalJoin";
	}
	
	// 회원가입 페이지로 이동
	@GetMapping("/useraccount/join")
	public String signUp() {
		return "/main/join"; // join.jsp
	}


	// 아이디 중복체크
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("personalId") String personalId) {
		return personalLoginService.idCheck(personalId);
	}

	// 이메일 중복체크 
	@PostMapping("/emailCheck")
	@ResponseBody
	public int emailCheck(@RequestParam("personalEmail") String personalEmail) {
		return personalLoginService.emailCheck(personalEmail);
	}

	// 개인회원 회원가입 POST
	@PostMapping("/personalInsert")
	public String personalInsert(PersonalLoginVO login) {
		personalLoginService.personalInsert(login);
		return "redirect:/useraccount/join/complete";
	}
	
	// 회원가입 완료 페이지로 이동
	@GetMapping("/useraccount/join/complete")
	public String completeSignUp() {
		return "/personal/completeJoin";
	}

	// 로그인 선택창으로 이동
	@GetMapping("/loginselect")
	public String loginSelect() {
		return "/main/loginSelect";
	}

	
	/*************************************************************
	 * Personal Mypage
	 *************************************************************/

	// 개인회원 마이페이지
	@GetMapping("/myPage")
	public String personalMyPage(Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "/redirect:/";
		}

		model.addAttribute("personalLoginVO", personalLoginVO); 

		// 로그인한 사용자만이 마이 페이지에 접근할 수 있음
		return "personal/myPage";
	}

	/// 회원정보수정
	@PostMapping("/personalUpdate")
	public String personalUpdate(@ModelAttribute PersonalLoginVO personalLogin, HttpSession session,
			RedirectAttributes redirectAttributes) {
		PersonalLoginVO sessionPersonalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");
		sessionPersonalLogin.setPersonalEmail(personalLogin.getPersonalEmail());
		if (!personalLogin.getPersonalAddress().equals(",,")) {
			sessionPersonalLogin.setPersonalAddress(personalLogin.getPersonalAddress());
		} else {
			PersonalLoginVO pvo = personalLoginService.personalMyPage(sessionPersonalLogin);
			sessionPersonalLogin.setPersonalAddress(pvo.getPersonalAddress());
		}
		sessionPersonalLogin.setPersonalPhone(personalLogin.getPersonalPhone());


		// 개인 정보 업데이트
		int result = personalLoginService.personalUpdate(sessionPersonalLogin);
	
		if (result == 0) {
			redirectAttributes.addFlashAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
			return "redirect:/useraccount/login";
		}
		session.setAttribute("personalLogin", sessionPersonalLogin);
		return "redirect:/myPage";
	}
	
	/*************************************************************
	 * Personal Matching
	 *************************************************************/

	// 사용자가 작성한 매칭 게시글 목록 보기 페이지로 이동
	@GetMapping("/personalMatchingView")
	public String getMatchingView(MatchingBoardVO matchingBoardVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		matchingBoardVO.setPersonalId(personalLoginVO.getPersonalId());
		List<MatchingBoardVO> matchingBoardList = personalMatchingBoardService.boardList(matchingBoardVO);
		model.addAttribute("matchingBoardList", matchingBoardList);

		
		int total = personalMatchingBoardService.boardListCnt(matchingBoardVO);
	
		model.addAttribute("pageMaker", new PageDTO(matchingBoardVO, total));
		return "personal/personalMatchingView";
	}
	
	/*************************************************************
	 * Personal Free
	 *************************************************************/

	// 사용자가 작성한 자유 게시판 목록 보기 페이지로 이동
	@GetMapping("/personalFreeView")
	public String getFreeView(FreeVO freeVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		freeVO.setPersonalId(personalLoginVO.getPersonalId());
		List<FreeVO> freeBoardList = personalFreeBoardService.boardList(freeVO);
		model.addAttribute("freeBoardList", freeBoardList);

		
		int total = personalFreeBoardService.boardListCnt(freeVO);

		
		model.addAttribute("pageMaker", new PageDTO(freeVO, total));
		return "personal/personalFreeView";

	}
	
	/*************************************************************
	 * Personal Like
	 *************************************************************/

	// 사용자가 찜한 자유 게시판 목록 보기 페이지로 이동
	@GetMapping("/personalLikeView")
	public String getLikeView(LikeVO likeVO, Model model,
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO) {
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}

		List<AdvertiseVO> advertiseVO = personalLikeService.getLikedCommon(personalLoginVO);
		List<LikeVO> likeList = personalLikeService.likeList(likeVO);

		model.addAttribute("advertiseVO", advertiseVO);
		model.addAttribute("likeList", likeList);

		return "personal/personalLikeView";
	}
	
	

	/*************************************************************
	 * Personal NewPasswd
	 *************************************************************/

	//개인회원 비밀번호 변경 페이지
	@GetMapping("/newPasswd")
	public String passwordChangePage(
			@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO, Model model) {
		if (personalLoginVO != null) {
			String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
			if (personalResult != "TRUE") {
				return personalResult;
			}
		} else {
			return "redirect:/";
		}
		return "personal/newPasswd";
	}
	

	//비밀번호 변경 
	@ResponseBody
	@PostMapping(value = "/updatePersonalPasswd")
	public String updatePersonalPasswd(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("renewPassword") String renewPassword,
			@SessionAttribute("personalLogin") PersonalLoginVO personalLoginVO, RedirectAttributes ras, Model model) {
		PersonalLoginVO curPersonalLogin = new PersonalLoginVO();
		curPersonalLogin.setPersonalId(personalLoginVO.getPersonalId());
		curPersonalLogin.setPersonalPasswd(currentPassword);
		PersonalLoginVO checkPassword = personalLoginService.loginProcess(curPersonalLogin);
		
		// 현재 계정의 패스워드 재확인
		if (checkPassword != null) {
			if (!renewPassword.equals(newPassword)) {
				ras.addFlashAttribute("errorMsg", "New Password 와 Re-enter New Password 가 일치하지 않습니다.");
				return "FALSE";
			}
			int result = 0;
			checkPassword.setPersonalPasswd(renewPassword);
			result = personalLoginService.updatePersonalPasswd(checkPassword);
			if (result == 1) { 
 
				model.addAttribute("personalLogin", personalLoginService.loginProcess(checkPassword));
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
	
	/*************************************************************
	 * Personal Withdrawal
	 *************************************************************/
	
		//회원 탈퇴 페이지
		@GetMapping("/personalWithdrawal")
		public String personalWithdrawal(  
				@SessionAttribute(required = false, value = "personalLogin") PersonalLoginVO personalLoginVO, Model model) {
			if (personalLoginVO != null) {
				String personalResult = sessionCheckService.isPersonalSessionCheck(personalLoginVO, model);
				if (personalResult != "TRUE") {
					return personalResult;
				}
			} else {
				return "redirect:/";
			}
			return "personal/withdrawalPersonal";
		}
		
		@ResponseBody
		@PostMapping(value = "/withdrawalPersonal")
		public String withdrawalPersonal(@RequestParam("currentPassword") String currentPassword,
		        @SessionAttribute("personalLogin") PersonalLoginVO personalLoginVO, RedirectAttributes ras) {
		    PersonalLoginVO curPersonalLogin = new PersonalLoginVO();
		    curPersonalLogin.setPersonalId(personalLoginVO.getPersonalId());
		    curPersonalLogin.setPersonalPasswd(currentPassword);
		    
		    PersonalLoginVO checkPasswd = personalLoginService.loginProcess(curPersonalLogin);
		    
		    if (checkPasswd != null) {
		        // 현재 비밀번호 일치
		        return "TRUE";
		    } else {
		        // 현재 비밀번호 불일치
		        ras.addFlashAttribute("errorMsg", "현재 비밀번호가 일치하지 않습니다.");
		        return "FALSE";
		}
	}
}
