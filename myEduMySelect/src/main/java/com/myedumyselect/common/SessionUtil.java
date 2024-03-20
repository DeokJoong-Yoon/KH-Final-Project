package com.myedumyselect.common;

import org.springframework.ui.Model;

import com.myedumyselect.personal.vo.PersonalLoginVO;

import jakarta.servlet.http.HttpSession;

public class SessionUtil {

	public void personalLoginCheck(HttpSession session, Model model, String confirmMsg) {
		PersonalLoginVO personalLogin = (PersonalLoginVO) session.getAttribute("personalLogin");

		if (personalLogin != null) {
			String userId = personalLogin.getPersonalId();
			String userName = personalLogin.getPersonalName();
			model.addAttribute("userId", userId);
			model.addAttribute("userName", userName);
			model.addAttribute("confirmMsg", confirmMsg);
		}
	}

}
