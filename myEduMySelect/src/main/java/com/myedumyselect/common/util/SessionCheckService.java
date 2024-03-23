package com.myedumyselect.common.util;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

public interface SessionCheckService {

	public String isAcademySessionCheck(AcademyLoginVO academyLoginVO, Model model);

	public String isPersonalSessionCheck(PersonalLoginVO personalLoginVO, Model model);

}
