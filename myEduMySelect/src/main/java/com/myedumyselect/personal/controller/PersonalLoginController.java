package com.myedumyselect.personal.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;

import com.myedumyselect.commonboard.advertise.service.AdvertiseService;
import com.myedumyselect.commonboard.free.service.FreeService;
import com.myedumyselect.commonboard.free.vo.FreeVO;
import com.myedumyselect.matching.board.service.MatchingBoardService;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.personal.service.PersonalLoginService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
//@RequestMapping("/personal/*")
@Slf4j
@SessionAttributes(SessionInfo.COMMON)
public class PersonalLoginController {

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginService personalLoginService;

	@Setter(onMethod_ = @Autowired)
	private MatchingBoardService mbService;

	@Setter(onMethod_ = @Autowired)
	private FreeService freeService;

	@Setter(onMethod_ = @Autowired)
	private AdvertiseService aService;

	@GetMapping("/useraccount/login")
	public String loginForm() {
		return "personal/login"; // login.jsp 호출
	}

	@PostMapping("/useraccount/login")
	public String loginProcess(LoginVo loginVo, Model model, RedirectAttributes ras, HttpSession session) {
		// POST 방식으로 /useraccount/login 엔드포인트에 대한 요청을 처리하는 메서드이다.
		// 요청에서 PersonalLoginVO 객체, Model 객체, RedirectAttributes 객체, HttpSession 객체를 받는다
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
			return "redirect:/useraccount/login";
		}
		// 계정이 잠겨 있고, 잠금 해제 시간이 현재 시간 이후인 경우를 검사한다.
		// 계정이 잠겨 있을 때 사용자에게 알림 메시지를 추가하고, 로그인 페이지로 리다이렉트한다.

		// 로그인 시도 횟수 카운트
		if (loginAttempts == null) {
			loginAttempts = 0;
		}
		// 로그인 시도 횟수를 확인하고, 값이 없으면 0으로 초기화한다.

		// 로그인 시도
		PersonalLoginVO personalLogin = personalLoginService
				.loginProcess(new PersonalLoginVO(loginVo.getId(), loginVo.getPasswd()));
		// PersonalLoginService를 통해 로그인을 시도한다.

		if (personalLogin != null) {
			loginVo.setName(personalLogin.getPersonalName());
			model.addAttribute(SessionInfo.COMMON, loginVo);
			session.removeAttribute("loginAttempts"); // 로그인이 성공한 경우, 모델에 로그인 정보를 추가하고, 세션에서 로그인 시도 횟수 속성을 제거한다.
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

				return "redirect:/useraccount/login";
			} else {
				ras.addFlashAttribute("errorMsg",
						"아이디 또는 비밀번호를 잘못 입력하셨습니다. 입력하신 내용을 다시 확인해주세요.로그인 시도 횟수: " + loginAttempts + "/5");

				return "redirect:/useraccount/login";
			} // 로그인이 실패한 경우, 로그인 시도 횟수를 증가시키고, 잠금 시간을 설정한다.
				// 잠금 시간까지 남은 시간을 계산하고, 알림 메시지를 추가하여 사용자에게 알린다.
				// 로그인 시도 횟수가 5회 이상이면 계정을 잠그고, 잠금 해제 시간까지 알려주는 알림 메시지를 추가한다.
				// 로그인 시도 횟수가 5회 미만인 경우, 실패 메시지와 함께 로그인 페이지로 리다이렉트한다.
		}
		return "redirect:/useraccount/login"; // 로그인이 성공하거나 실패한 후에는 항상 로그인 페이지로 리다이렉트한다.
	}

	// 개인회원 가입 페이지
	@GetMapping(value = "/useraccount/join/personal")
	public String personalJoinForm() {
		log.info("personaljoinForm 호출 성공");

		return "personal/personalJoin";
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

	// 회원가입
	@PostMapping("/personalInsert")
	public String personalInsert(PersonalLoginVO login) {
		log.info("personalInsert 호출 성공");
		personalLoginService.personalInsert(login);
		return "redirect:/useraccount/join/complete";
	}

	// @GetMapping("/")
	// public String home() {
	// 홈 페이지로 이동
	// return "/personal/main"; // home.jsp
	// }

	@GetMapping("/useraccount/join")
	public String signUp() {
		// 회원가입 페이지로 이동
		return "/main/join"; // join.jsp
	}

	@GetMapping("/useraccount/join/complete")
	public String completeSignUp() {
		// 회원가입 완료 페이지로 이동
		return "/personal/completeJoin";
	}

	// PRG 패턴 (Post-Redirect-Get)
	// 웹 개발 패턴 중 자주 쓰이는 패턴으로 HTTP POST 요청에 대한 응답이 또 다른 URL로의 GET 요청을 위한 리다이렉트(응답 코드가
	// 3XX) 여야 한다는 것을 의미
	// POST 방식으로 온 요청에 대해서 GET 방식의 웹페이지로 리다이렉트 시키는 패턴 마이페이지(GET) > 회원정보수정 (POST) >
	// 마이페이지(GET)

	// 마이페이지
	@GetMapping("/myPage")
	public String personalMyPage(Model model, HttpSession session) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		// 세션에서 personalLogin 속성을 가져옴 (세션에서 로그인 정보를 가져와서 personalLoginVO 객체로 캐스팅)

		// 로그인이 되어있지 않다면
		if (ObjectUtils.isEmpty(loginVo)) {
			// 로그인 페이지로 리다이렉트
			return "redirect:useraccount/login";
		}
		log.info("myPage 호출성공");

		String personalId = loginVo.getId();
		PersonalLoginVO personalLoginVO = personalLoginService.findId(personalId);

		if (personalLoginVO != null) {
			model.addAttribute("personalLoginVO", personalLoginVO);
		} else {
			personalLoginVO = new PersonalLoginVO();
			model.addAttribute("personalLoginVO", personalLoginVO);

		}

		return "personal/myPage";
		// TODO: findById 필요!

	}

	/// 회원정보수정
	@PostMapping("/personalUpdate")
	// @ModelAttribute PersonalLoginVO personalLogin 개인정보를 포함하는 PersonalLoginVO객체를
	// 받는다
	// HttpSession 세션을 관리하기 위한 HttpSession 객체
	// RedirectAttributes 리다이렉트 시에 플래시 메시지를 전달하는데 사용
	public String personalUpdate(@ModelAttribute PersonalLoginVO personalLogin, HttpSession session,
			RedirectAttributes redirectAttributes) {
		// 세션에서 personalLogin 속성을 가져옴
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		// 세션에서 가져온 personalLogin 객체에 업데이트된 정보를 적용,결론적으로 VO를 들고 오는구조 이메일,주소,전화번호,비밀번호를
		// 수정할
		// 수 있다
		// TODO: findById 필요!
		PersonalLoginVO sessionPersonalLogin = personalLoginService
				.loginProcess(new PersonalLoginVO(loginVo.getId(), loginVo.getPasswd()));

		sessionPersonalLogin.setPersonalEmail(personalLogin.getPersonalEmail());
		sessionPersonalLogin.setPersonalZipCode(personalLogin.getPersonalZipCode());
		sessionPersonalLogin.setPersonalAddress(personalLogin.getPersonalAddress());
		sessionPersonalLogin.setPersonalDetailAddress(personalLogin.getPersonalDetailAddress());
		sessionPersonalLogin.setPersonalPhone(personalLogin.getPersonalPhone());
		sessionPersonalLogin.setPersonalPasswd(personalLogin.getPersonalPasswd());

		log.info("personalUpdate 호출 성공");

		// 개인 정보 업데이트
		// personalLoginService의 personalUpdate 메서드를 호출하여 데이터베이스에 개인 정보를 업데이트
		int result = personalLoginService.personalUpdate(sessionPersonalLogin);

		// 업데이트가 실패하면 에러 메시지를 추가하고 로그인 페이지로 리다이렉트
		if (result == 0) {
			redirectAttributes.addFlashAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
			return "redirect:/useraccount/login";
		}

		// 업데이트가 성공하면 세션에 업데이트된 personalLogin 객체를 저장하고 마이 페이지로 리다이렉트
		session.setAttribute("personalLogin", sessionPersonalLogin);
		return "redirect:/myPage";
	}

	// 사용자가 작성한 매칭 게시글 목록 보기 페이지로 이동
	@GetMapping("/personalMatchingList")
	public String getMatchingList(Model model, HttpSession session) {
	    LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
	    if (loginVo == null) {
	        // 로그인되지 않은 경우 로그인 페이지로 이동하도록 처리
	        return "redirect:/useraccount/login";
	    }

	    // 해당 사용자가 작성한 매칭 게시글 목록을 가져옵니다.
	    List<MatchingBoardVO> userMatchingList = mbService.getUserMatchingList(loginVo.getId());
	    model.addAttribute("userMatchingList", userMatchingList);

	    return "personal/personalMatchingList"; // 사용자가 작성한 매칭 게시글 목록을 보여주는 페이지로 이동
	}

	// 자유 게시판
	@GetMapping("/personalFreeList")
	public String getFreeList(Model model, HttpSession session) {
	    LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

	    if (loginVo == null) {
	        // 로그인되지 않은 경우 로그인 페이지로 이동하도록 처리
	        return "redirect:/useraccount/login";
	    }
	    
	    // 해당 사용자가 작성한 자유 게시글 목록을 가져옵니다.
	    List<FreeVO> userFreeList = freeService.getUserFreeList(loginVo.getId());
	    model.addAttribute("userFreeList", userFreeList);

	    return "personal/personalFreeList";
	}
	
	//홍보게시판
	


	/*@GetMapping("/personalAllList")
	public String getAllList(Model model, HttpSession session, @ModelAttribute CommonVO cvo) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		if (loginVo == null) {
			// 로그인되지 않은 경우 로그인 페이지로 이동하도록 처리
			return "redirect:/useraccount/login";
		}

		// 해당 사용자가 작성한 매칭 게시글 목록을 가져옵니다.
		List<MatchingBoardVO> userMatchingList = mbService.getUserMatchingList(loginVo.getId());
		model.addAttribute("userMatchingList", userMatchingList);

		// 해당 사용자가 작성한 자유 게시글 목록을 가져옵니다.
		List<FreeVO> userFreeList = freeService.getUserFreeList(loginVo.getId());
		model.addAttribute("userFreeList", userFreeList);

		// 매칭 게시판 총 레코드 수 반환
		int totalMatchingCnt = mbService.pTotalMatchingCnt(loginVo.getId());
		model.addAttribute("totalMatchingCnt", totalMatchingCnt);

		PageDTO pageMaker = new PageDTO(cvo, totalMatchingCnt);
		model.addAttribute("pageMaker", pageMaker);

		return "personal/personalAllList"; // 사용자가 작성한 모든 게시글 목록을 보여주는 페이지로 이동
	}*/
 
	// 비밀번호 변경 페이지
	@GetMapping("/newPasswd")
	public String passwordChangePage(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		if (loginVo == null) {
			return "redirect:/useraccount/login";
		}
		model.addAttribute("personalId", loginVo.getId());
		return "personal/newPasswd";
	} 
       
	@PostMapping("/changePasswd")       
	public String updatePasswdChangeDate(@ModelAttribute PersonalLoginVO personalLogin, HttpSession session,
			RedirectAttributes redirectAttributes) {
		// 세션에서 LoginVo 객체 가져오기
		LoginVo loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		// 새로운 비밀번호 설정
		loginVo.setPasswd(personalLogin.getPersonalPasswd());

		// 변경된 비밀번호 업데이트
		int result = personalLoginService.updatePasswdChangeDate(loginVo);

		if (result == 0) {
			redirectAttributes.addFlashAttribute("errorMsg", "개인 정보 업데이트에 실패했습니다. 다시 시도해 주세요.");
			return "redirect:/useraccount/login";
		}

		session.setAttribute(SessionInfo.COMMON, loginVo);

		// 로그아웃 후 리다이렉트
		session.invalidate(); // 세션 무효화
		return "redirect:/useraccount/login";
	}

} 
