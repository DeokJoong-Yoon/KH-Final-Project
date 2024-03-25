package com.myedumyselect.academy.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.academy.service.AcademyAdvertiseService;
import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.service.AcademyMatchingBoardService;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.client.main.vo.PageDTO;
import com.myedumyselect.common.util.SessionCheckService;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

//import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("academyLogin")
public class AcademyLoginController {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginService academyLoginService;

	@Autowired
	private AcademyAdvertiseService academyAdvertiseService;

	@Autowired
	private AcademyMatchingBoardService academyMatchingBoardService;

	@Autowired
	private SessionCheckService sessionCheckService;	

	/*************************************************************
	 * Academy Login
	 *************************************************************/
	// 학원회원 로그인으로 이동
	@GetMapping("/academy/login")
	public String loginform() {
		return "academy/login";
	}

	// 학원회원 로그인 POST
	@PostMapping("/academy/login")
	public String loginProcess(AcademyLoginVO login, Model model, RedirectAttributes ras, HttpSession session) {

		Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
		Date bannedUntil = (Date) session.getAttribute("bannedUntil");
		// 세션에서 loginAttempts와 bannedUntil 속성을 가져온다. 결국 얘네도 변수 이름이다.
		// loginAttempts는 로그인 시도 횟수를, bannedUntil은 계정 잠금이 해제되는 시간을 나타낸다.
		// currentTiem는 현재시간을 나타내는 변수이다 . 밑에 System.currentTimeMillis()을 통해
		// 현재 시간을 밀리초 단위로 가져온다. 결론적으로 이 변수는 계정 잠금 해제 시간을 계산할때 사용한다.
		// lockoutTime 계정이 잠금되는 시간을 나타내는 변수이다 currentTime 와 똑같은 개념이다
		// ex) 1분은 60초 1초는 1000밀리초 그래서 10분을 밀리초 단위로 계산하면 10 * 60 * 1000 이렇게된다 10분 =
		// 600000 밀리초
		// currentTime + 600000 잠금이 풀리는 시간을 계산하면 이런식이다.

		// 즉시 잠금 해제
		// session.removeAttribute("bannedUntil");

		// 계정이 잠겨 있을 때
		if (bannedUntil != null && new Date().before(bannedUntil)) {
			long remainingTime = (bannedUntil.getTime() - new Date().getTime()) / (1000 * 60); // 잔여 시간(분)
			ras.addFlashAttribute("errorMsg", "계정이 잠겨 있습니다. 잠금 해제 시간까지 약 " + remainingTime + "분 남았습니다.");
			return "redirect:/academy/login";
		}
		// 계정이 잠겨 있고, 잠금 해제 시간이 현재 시간 이후인 경우를 검사한다.
		// 계정이 잠겨 있을 때 사용자에게 알림 메시지를 추가하고, 로그인 페이지로 리다이렉트한다.

		// 로그인 시도 횟수 카운트
		if (loginAttempts == null) {
			loginAttempts = 0;
		}
		// 로그인 시도 횟수를 확인하고, 값이 없으면 0으로 초기화한다.

		// 로그인 시도
		AcademyLoginVO academyLogin = academyLoginService.loginProcess(login);

		// AcademyLoginService를 통해 로그인을 시도한다.

		if (academyLogin != null) {
			model.addAttribute("academyLogin", academyLogin);
			session.removeAttribute("loginAttempts");// 로그인이 성공한 경우, 모델에 로그인 정보를 추가하고, 세션에서 로그인 시도 횟수 속성을 제거한다.
			log.info("로그인 성공!");
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

				return "redirect:/academy/login";
			} else {
				ras.addFlashAttribute("errorMsg",
						"아이디 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.로그인 시도 횟수: " + loginAttempts + "/5");
				log.warn("로그인 실패  현재 로그인 시도 횟수: " + loginAttempts);
				return "redirect:/academy/login";
			} // 로그인이 실패한 경우, 로그인 시도 횟수를 증가시키고, 잠금 시간을 설정한다.
				// 잠금 시간까지 남은 시간을 계산하고, 알림 메시지를 추가하여 사용자에게 알린다.
				// 로그인 시도 횟수가 5회 이상이면 계정을 잠그고, 잠금 해제 시간까지 알려주는 알림 메시지를 추가한다.
				// 로그인 시도 횟수가 5회 미만인 경우, 실패 메시지와 함께 로그인 페이지로 리다이렉트한다.
		}
		// log.info("학원 회원 로그인 성공");
		log.info("로그인 성공: 학원회원 ID - " + academyLogin.getAcademyId());
		return "redirect:/academy/login"; // 로그인이 성공하거나 실패한 후에는 항상 로그인 페이지로 리다이렉트한다.
	}

	/*************************************************************
	 * Academy Logout
	 *************************************************************/
	// 로그아웃 처리
	@PostMapping("/academy/logout")
	public String logout(SessionStatus sessionStatus) {
		log.info("로그아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/loginselect";
	}

	@GetMapping("/academy/logout")
	public String getLogout(SessionStatus sessionStatus) {
		log.info("로그아웃 처리");
		sessionStatus.setComplete();
		return "redirect:/loginselect";
	}

	/*************************************************************
	 * Academy Join
	 *************************************************************/
	// 학원회원 가입 페이지
	@GetMapping(value = "/academy/join")
	public String academyjoinForm() {
		log.info("academyjoinForm 호출 성공");
		return "academy/academyJoin";
	}

	// 학원회원 회원가입 POST
	@PostMapping(value = "/academyInsert")
	@ResponseBody
	public String academyInsert(@RequestBody AcademyLoginVO login) {

		System.out.println(login.toString());

		log.info("academyInsert 호출 성공");
		academyLoginService.academyInsert(login);
		return "TRUE";
	}

	// 학원회원 회원가입 완료 페이지로 이동
	@GetMapping("/academy/join/complete")
	public String completeSignUp(@ModelAttribute AcademyLoginVO academyLoginVO) {
		// 회원가입 완료 페이지로 이동
		return "/academy/completeJoin";
	}

	/*************************************************************
	 * Academy mypage
	 *************************************************************/
	// 학원회원 마이페이지로 이동
	@GetMapping(value = "/academy/mypage")
	public String academyMypage(
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
			RedirectAttributes ras, Model model) {

		/*
		 * 학원전용 GetMapping 제어 if(academyLoginVO != null) { String academyResult =
		 * sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
		 * if(academyResult != "TRUE") { return academyResult; } } else { return
		 * "redirect:/loginselect"; }
		 */

		if (academyLoginVO == null) {
			model.addAttribute("confirmMsg", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			return "/loginselect";
		} else if (academyLoginVO.getMemberTypeId() == 1) {
			ras.addFlashAttribute("errorMsg", "잘못된 접근입니다.");
			return "/loginselect";
		}

		log.info("학원회원 mypage 호출");

		// model.addAttribute("academyLoginVO", academyLoginVO);
		log.info("학원회원 정보 불러오기 {} : ", academyLoginVO);
		return "/academy/mypage";

	}

	// 아이디 중복체크
	@PostMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestParam("academyId") String academyId) {
		return academyLoginService.checkId(academyId);
	}

	// 이메일 중복체크
	@PostMapping("/checkEmail")
	@ResponseBody
	public int checkEmail(@RequestParam("academyManagerEmail") String academyManagerEmail) {
		return academyLoginService.checkEmail(academyManagerEmail);
	}

	// 사업자등록번호 조회 및 중복여부 확인
	@PostMapping("/findByNumber")
	@ResponseBody
	public AcademyLoginVO findByNumber(@RequestParam("academyNumber") String academyNumber) {
		return academyLoginService.findByNumber(academyNumber);
	}

	// 마이페이지 회원정보 수정
	@PostMapping("/academyUpdate")
	public String academyUpdate(@ModelAttribute AcademyLoginVO academyLogin,
			@SessionAttribute("academyLogin") AcademyLoginVO sessionAcademyLogin, Model model) {

		System.out.println(sessionAcademyLogin.toString());
		sessionAcademyLogin.setAcademyManagerName(academyLogin.getAcademyManagerName());
		sessionAcademyLogin.setAcademyManagerEmail(academyLogin.getAcademyManagerEmail());
		sessionAcademyLogin.setAcademyManagerPhone(academyLogin.getAcademyManagerPhone());
		sessionAcademyLogin.setAcademyPhone(academyLogin.getAcademyPhone());
		sessionAcademyLogin.setAcademyTargetSubject(academyLogin.getAcademyTargetSubject());
		sessionAcademyLogin.setAcademyTargetGrade(academyLogin.getAcademyTargetGrade());
		sessionAcademyLogin.setAcademyFee(academyLogin.getAcademyFee());
		sessionAcademyLogin.setAcademyKeyword1(academyLogin.getAcademyKeyword1());
		sessionAcademyLogin.setAcademyKeyword2(academyLogin.getAcademyKeyword2());
		sessionAcademyLogin.setAcademyKeyword3(academyLogin.getAcademyKeyword3());
		sessionAcademyLogin.setAcademyKeyword4(academyLogin.getAcademyKeyword4());
		sessionAcademyLogin.setAcademyKeyword5(academyLogin.getAcademyKeyword5());

		// 학원 정보 업데이트
		// academyLoginService의 academyUpdate 메서드를 호출하여 데이터베이스에 개인 정보를 업데이트
		int result = academyLoginService.academyUpdate(sessionAcademyLogin);
		// log.info("sessionAcademyLogin.toString() 2번 {} : ",
		// academyLoginVo.toString());
		log.info("result값 {} : ", result);

		// 업데이트가 실패하면 에러 메시지를 추가하고 로그인 페이지로 리다이렉트
		if (result == 0) {
			model.addAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
			return "redirect:/academy/mypage";
		}

		// 업데이트 성공 시
		model.addAttribute("academyLogin", sessionAcademyLogin);
		// 업데이트가 성공하면 세션에 업데이트된 academyLoginVo 객체를 저장하고 마이 페이지로 리다이렉트

		return "/academy/mypage";
		// model.addAttribute(result);
	}

	/* 비밀번호 변경 */
	@GetMapping("/passwdChangePage")
	public String passwdChangePage(@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO) {

		if (academyLoginVO == null) {
			return "redirect:/academy/login";
		}

		return "academy/passWd";
	}

	/* 비밀번호 변경 POST */
	@ResponseBody
	@PostMapping("/updatePasswdChangeDate")
	public String updatePasswdChangeDate(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("renewPassword") String renewPassword,
			@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, RedirectAttributes ras, Model model) {
		AcademyLoginVO curAcademyLogin = new AcademyLoginVO();
		curAcademyLogin.setAcademyId(academyLoginVO.getAcademyId());
		curAcademyLogin.setAcademyPasswd(currentPassword);
		AcademyLoginVO checkPassword = academyLoginService.loginProcess(curAcademyLogin);
		// 현재 계정의 패스워드 재확인
		if (checkPassword != null) {
			if (!renewPassword.equals(newPassword)) {
				ras.addFlashAttribute("errorMsg", "새 비밀번호가 일치하지 않습니다.");
				return "FALSE";
			}
			int result = 0;
			checkPassword.setAcademyPasswd(renewPassword);
			result = academyLoginService.updatePasswdChangeDate(checkPassword);
			if (result == 1) {
				model.addAttribute("academyLogin", academyLoginService.loginProcess(checkPassword));
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
	 * Academy Advertise
	 *************************************************************/
	/* 사용자가 작성한 홍보 게시글 목록 보기 페이지로 이동 */
	@GetMapping("/academy/advertiseList")
	public String academyAdvertiseList(
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
			RedirectAttributes ras, Model model, AdvertiseVO advertiseVO) {
		/* 학원전용 GetMapping 제어 */
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (academyResult != "TRUE") {
				return academyResult;
			}
		} else {
			model.addAttribute("confirmMsg", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			return "redirect:/loginselect";
		}

		advertiseVO.setAcademyId(academyLoginVO.getAcademyId());
		academyAdvertiseService.advertiseList(advertiseVO);
		List<AdvertiseVO> advertiseList = academyAdvertiseService.advertiseList(advertiseVO);
		model.addAttribute("advertiseList", advertiseList);

		// 전체 레코드수 반환.
		int total = academyAdvertiseService.advertiseListCnt(advertiseVO);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(advertiseVO, total));
		model.addAttribute("kwd", advertiseVO.getKeyword());
		return "academy/academyAdvertiseList"; // 사용자가 작성한 홍보 게시글 목록을 보여주는 페이지로 이동
	}

	/*************************************************************
	 * Academy Matching
	 *************************************************************/
	/* 사용자가 작성한 매칭 게시글 댓글 목록 보기 페이지로 이동 */
	@GetMapping("/academy/matchingBoardList")
	public String academyMatchingBoardList(MatchingBoardVO matchingBoardVO, MatchingCommentVO mcVO, Model model,
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO,
			RedirectAttributes ras) {

		/* 학원전용 GetMapping 제어 */
		if (academyLoginVO != null) {
			String academyResult = sessionCheckService.isAcademySessionCheck(academyLoginVO, model);
			if (academyResult != "TRUE") {
				ras.addFlashAttribute("errorMsg", "잘못된 접근입니다.");
				return academyResult;
			}
		} else {
			model.addAttribute("confirmMsg", "로그인이 필요합니다. 로그인 페이지로 이동하시겠습니까?");
			return "redirect:/loginselect";
		}

		// 본인 아이디 가져오기
		String academyId = academyLoginVO.getAcademyId();
		// 댓글 단 게시물 번호 목록 조회 (성능 최적화)
		List<Integer> commentedNos = academyMatchingBoardService.getCommentMatchingNos(academyLoginVO);

		List<MatchingBoardVO> matchingBoardList = academyMatchingBoardService.getCommented(academyLoginVO);
		
        // 전체 레코드 수 반환
        int total = academyMatchingBoardService.boardListCnt(matchingBoardVO);
        
        // model에 저장
        model.addAttribute("commentedNos", commentedNos);
		model.addAttribute("academyId", academyId);
		model.addAttribute("matchingBoardList", matchingBoardList);
        model.addAttribute("pageMaker", new PageDTO(matchingBoardVO, total));
        model.addAttribute("kwd", matchingBoardVO.getKeyword());
        
        return "academy/academyMatchingBoardList"; // 사용자가 작성한 매칭 게시글 목록을 보여주는 페이지로 이동
	}

	/*************************************************************
	 * Academy FreeBoard
	 *************************************************************/
	/*
	 * 사용자가 작성한 자유게시판 게시글, 댓글 목록 보기 페이지로 이동
	 * 
	 * @GetMapping("/academy/freeList")
	 */

	/*************************************************************
	 * Academy Withdrawal passCheck
	 *************************************************************/
	/* 회원탈퇴 하기 전 비밀번호 현재 비밀번호 인증하는 페이지로 이동 */
	@GetMapping("/academyWithdrawal")
	public String academyWithdrawal(
			@SessionAttribute(required = false, value = "academyLogin") AcademyLoginVO academyLoginVO, Model model) {
		if (academyLoginVO == null) {
			return "redirect:/";
		}
		return "academy/withdrawalAcademy";
	}
	
	/* 회원탈퇴페이지 POST */
	@ResponseBody
	@PostMapping(value = "/withdrawalAcademy")
	public String withdrawalAcademy(@RequestParam("currentPassword") String currentPassword,
			@SessionAttribute("academyLogin") AcademyLoginVO academyLoginVO, RedirectAttributes ras) {
		AcademyLoginVO curAcademyLogin = new AcademyLoginVO();
		curAcademyLogin.setAcademyId(academyLoginVO.getAcademyId());
		curAcademyLogin.setAcademyPasswd(currentPassword);

		AcademyLoginVO checkPasswd = academyLoginService.loginProcess(curAcademyLogin);

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