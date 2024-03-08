package com.myedumyselect.personal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.personal.dao.PersonalLoginDao;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Service
public class PersonalLoginServiceImpl implements PersonalLoginService {

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginDao personalLoginDao;

	@Override
	public PersonalLoginVO loginProcess(PersonalLoginVO login) {
		PersonalLoginVO personalLogin = personalLoginDao.loginProcess(login);
		return personalLogin;
	}

	@Override
	public int personalInsert(PersonalLoginVO login) {
		int result = 0;
		result = personalLoginDao.personalInsert(login);
		return result;
	}

}
