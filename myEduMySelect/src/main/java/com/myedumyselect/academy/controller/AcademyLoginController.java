package com.myedumyselect.academy.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.academy.AcademySignUpDto;
import com.myedumyselect.academy.SessionConst;
import com.myedumyselect.academy.UserAccountLoginDto;
import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@SuppressWarnings("unused")
@Controller
@Slf4j
public class AcademyLoginController {
    
	@Setter(onMethod_ = @Autowired)
    private AcademyLoginService academyLoginService;

	/**
	 * 유저 계정 로그인 폼
	 */
	@GetMapping("/userAccount/login")
	public String userAccountLoginForm(Model model) {
		model.addAttribute("userAccountLoginDto", new UserAccountLoginDto());
		return "/academy/login";
	}
	
	/**
	 * 유저 계정 로그인 POST
	 */
	@PostMapping("/userAccount/login") 
	public String userAccountLogin(@Valid @ModelAttribute UserAccountLoginDto userAccountLoginDto,
								BindingResult bindingResult,
								HttpServletRequest request) {
		// 바인딩 에러 확인
		if(bindingResult.hasErrors()) {
			return "/academy/login";
		}
		
		if(userAccountLoginDto.getUserAccountType().equals("1")) {
			// Personal
			
			//TODO: 로그인 로직 실행 및 객체 획득
			//TODO: 세션 저장
			//TODO: 세션에 로그인 회원 정보 보관
			
		} else if(userAccountLoginDto.getUserAccountType().equals("2")){
			// Academy
			Optional<AcademyLoginVo> optional = academyLoginService.loginProcess(userAccountLoginDto.getAcademyId(),
					userAccountLoginDto.getAcademyPasswd());
			
			// 로그인 실패
			if(optional.isEmpty()) {
				bindingResult.reject("loginFailed", "아이디 및 비밀번호가 일치하지 않습니다.");
				return "/academy/login";
			}
			
			// 세션 저장
			AcademyLoginVo academyLoginVo = optional.get();
			// 세션에 있으면 있는 세션 반환, 없으면 신규 세션 생성 (getSession(false): 세션에 있으면 있는 세션반환만)
			HttpSession session = request.getSession();
			
			// 세션에 로그인 회원 정보 보관
			session.setAttribute(SessionConst.INFO, academyLoginVo);					
		}
		
		return "redirect:/academy/home";
	}
	
	@PostMapping("/userAccount/logout")
	public String logout(HttpSession session) {
		if(session != null) {
			// 세션을 제거한다. (안에 있는 데이터도 삭제)
			session.removeAttribute(SessionConst.INFO);
		}
		
		return "redirect:/";
	}
	
	@GetMapping(value = "/userAccount/join/academy")
	public String joinForm(Model model) {
		log.info("academyJoin 호출 성공");
		// 모델 등록
		model.addAttribute("academySignUpDto", new AcademySignUpDto());
		return "academy/academyJoin";
	}

	@PostMapping("/academyInsert")
	public String academyInsert(@Valid @ModelAttribute AcademySignUpDto academySignUpDto,
			BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return "academy/academyJoin";
		}
		
		// 저장
		try {
			log.info("academyInsert 호출 성공");
			log.info("academySignUpDto : {}", academySignUpDto);
			academyLoginService.academyInsert(academySignUpDto);
		} catch (AcademyIdDuplicateException e) {
			bindingResult.reject("duplicateAcademyId", "이미 존재하는 아이디입니다.");
			return "academy/academyJoin";
		}		
		
		return "redirect:/userAccount/join/complete";
	}

	@GetMapping("/academy/home")
	public String home(@SessionAttribute(name = SessionConst.INFO,
			required = false) AcademyLoginVo academyLoginVo,
			Model model) {
		
		// 홈 페이지로 이동
		if(academyLoginVo == null) {
			return "/main/main"; // index.jsp
		}
		
		model.addAttribute("academyLoginVo", academyLoginVo);
		
		return "/main/main"; // index.jsp
	}

	@GetMapping("/userAccount/join")
	public String signUp() {
		// 회원가입 페이지로 이동
		return "/academy/join"; // join.jsp
	}

	@GetMapping("/userAccount/join/complete")
	public String completeSignUp(@ModelAttribute AcademyLoginVo academyLoginVo) {		
		// 회원가입 완료 페이지로 이동
		return "/academy/completeJoin";
	}
	
	@GetMapping("/mypage")
	public String mypage(@SessionAttribute(name = SessionConst.INFO, required = false) AcademyLoginVo academyLoginVo,
	        Model model) {        
	    // 로그인 여부 확인
	    if(ObjectUtils.isEmpty(academyLoginVo)) {
	        // 로그인되어 있지 않다면 로그인 페이지로 리다이렉트
	        return "redirect:/userAccount/login";
	    } 
	    
	    // 로그인된 경우에는 학원 정보를 가져와서 모델에 추가
	    String academyId = academyLoginVo.getAcademyId();
	    Optional<AcademyLoginVo> academyInfoOptional = academyLoginService.findById(academyId);

	    if (academyInfoOptional.isPresent()) {
	        model.addAttribute("academyLoginVo", academyInfoOptional.get());
	    } else {
	        // 학원 정보가 없을 경우 처리
	        // 예: 에러 페이지로 리다이렉트 또는 다른 처리
	    }

	    return "/academy/mypage";
	}
}
