package com.myedumyselect.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyLoginDao;
<<<<<<< HEAD
import com.myedumyselect.academy.vo.AcademyLoginVO;

import lombok.Setter;

@Service
public class AcademyLoginServiceImpl implements AcademyLoginService {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;

	@Override
	public AcademyLoginVO loginProcess(AcademyLoginVO login) {
		AcademyLoginVO academyLogin = academyLoginDao.loginProcess(login);
		return academyLogin;
	}

	@Override
	public int academyInsert(AcademyLoginVO login) {
		int result = 0;
		result = academyLoginDao.academyInsert(login);
		return result;
	}

=======
import com.myedumyselect.academy.vo.AcademyLoginVo;

import lombok.Setter;

@Service
public class AcademyLoginServiceImpl implements AcademyLoginService {
	
	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;
	
	
	@Override
	public AcademyLoginVo loginProcess(AcademyLoginVo login) {
		AcademyLoginVo academyLogin = academyLoginDao.loginprocess(login);
		return academyLogin;
	}
	
	
	public int academyInsert(AcademyLoginVo login) {
		int result = 0;
		result = academyLoginDao.academyInsert(login);
		return result;
	}
	
	
>>>>>>> branch 'main' of https://github.com/kimzionoff/KH-Final-Project.git
}
