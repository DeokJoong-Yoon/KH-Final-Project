package com.myedumyselect.academy.service;

import com.myedumyselect.academy.vo.AcademyLoginVO;

public interface AcademyLoginService {

	public AcademyLoginVO loginProcess(AcademyLoginVO login);	
	public int academyInsert(AcademyLoginVO login);

}
