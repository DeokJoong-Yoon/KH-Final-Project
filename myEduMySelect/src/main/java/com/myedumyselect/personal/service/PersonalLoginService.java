package com.myedumyselect.personal.service;

import com.myedumyselect.personal.vo.PersonalLoginVO;

public interface PersonalLoginService {

	public PersonalLoginVO loginProcess(PersonalLoginVO login);

	public int personalInsert(PersonalLoginVO login);

}
