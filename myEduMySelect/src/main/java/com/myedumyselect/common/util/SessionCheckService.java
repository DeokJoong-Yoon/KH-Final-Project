package com.myedumyselect.common.util;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

public interface SessionCheckService {

	String isAcademySessionCheck(HttpSession session, Model model, String alertMsg);

	String isPersonalSessionCheck(HttpSession session, Model model, String alertMsg);

}
