package com.myedumyselect.academy.service;


import java.util.Optional;

import com.myedumyselect.academy.AcademySignUpDto;
import com.myedumyselect.academy.vo.AcademyLoginVo;

public interface AcademyLoginService {
	Optional<AcademyLoginVo> loginProcess(String academyId, String academyPasswd);
	void academyInsert(AcademySignUpDto academySignUpDto);
	Optional<AcademyLoginVo> findById(String academyId);
	boolean isAcademyIdDuplicate(String academyId);
}

