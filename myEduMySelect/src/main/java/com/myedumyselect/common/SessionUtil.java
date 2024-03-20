package com.myedumyselect.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.myedumyselect.academy.service.AcademyLoginService;
import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.auth.SessionInfo;
import com.myedumyselect.auth.vo.LoginVo;
import com.myedumyselect.payment.service.PaymentService;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;

public class SessionUtil {

	public static void personalLoginCheck(HttpSession session, Model model, String confirmMsg) {
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");

		if (personalLogin != null) {
			String userId = personalLogin.getPersonalId();
			String userName = personalLogin.getPersonalName();
			model.addAttribute("userId", userId);
			model.addAttribute("userName", userName);
			model.addAttribute("confirmMsg", confirmMsg);
		}
	}

	public static String isPersonalSessionCheck(LoginVo loginVo, HttpSession session, Model model) {
		loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);

		if (loginVo == null) {
			return "FALSE";
		} else {
			if (loginVo.getMemberTypeId() == 2) {
				model.addAttribute("confirmMessage", "잘못된 접근입니다.");
				return "FALSE";
			} else {
				return "TRUE";
			}
		}

	}

	@Setter(onMethod_ = @Autowired)
	private static AcademyLoginService academyLoginService;

	@Setter(onMethod_ = @Autowired)
	private static PaymentService paymentService;

	public static String isAcademySessionCheck(LoginVo loginVo, HttpSession session, Model model) {
		loginVo = (LoginVo) session.getAttribute(SessionInfo.COMMON);
		// 로그인 세션여부 체크
		if (loginVo == null) {
			return "FALSE";
		} else {
			// 학원회원 체크
			if (loginVo.getMemberTypeId() == 1) {
				model.addAttribute("confirmMessage", "잘못된 접근입니다.");
				return "FALSE";
			} else {
				AcademyLoginVo academyLoginVo = academyLoginService.findById(loginVo.getId());
				int result = paymentService.paymentCheck(academyLoginVo);
				if (result == 1) {
					return "TRUE";
				} else {
					return "FALSE";
				}
			}
		}

	}

}
