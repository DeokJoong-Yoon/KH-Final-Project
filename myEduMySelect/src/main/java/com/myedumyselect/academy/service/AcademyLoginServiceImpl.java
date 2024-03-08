package com.myedumyselect.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyDao;
import com.myedumyselect.academy.vo.AcademyVo;

@Service
public class AcademyServiceImpl implements AcademyService {
	
	@Autowired
	private AcademyDao academyDao;
	
	
	@Override
	public AcademyVo getAcademyVo() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
