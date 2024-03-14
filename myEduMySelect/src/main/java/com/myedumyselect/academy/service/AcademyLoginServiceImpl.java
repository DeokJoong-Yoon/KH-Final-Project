package com.myedumyselect.academy.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.AcademySignUpDto;
import com.myedumyselect.academy.controller.AcademyIdDuplicateException;
import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVo;

import lombok.Setter;

@Service
public class AcademyLoginServiceImpl implements AcademyLoginService {
	
	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;
	
	
	@Override
	public Optional<AcademyLoginVo> loginProcess(String academyId, String academyPasswd) {
		return academyLoginDao.findByIdAndPasswd(academyId, academyPasswd);
		
		// Exception 활용
		// Optional<AcademyLoginVo> optional = academyLoginDao.findByIdAndPasswd(academyLoginDto.getAcademyId(),
		// 																academyLoginDto.getAcademyPasswd());
		// if(optional.isEmpty()) {
			// 로그인 실패일 때
		// 	throw new AcademyLoginException();
		// }
		
		// return optional.get();
	}
	
	
	public void academyInsert(AcademySignUpDto academySignUpDto) {
		Optional<AcademyLoginVo> optional = academyLoginDao.findById(academySignUpDto.getAcademyId());
		
		// DB에서 조회한 값이 있으면
		if(optional.isPresent()) {
			// RuntimeException 던지기 (컨트롤러로)
			throw new AcademyIdDuplicateException();
		}
		
		academyLoginDao.academyInsert(academySignUpDto.toVo());
	}


	@Override
	public Optional<AcademyLoginVo> findById(String academyId) { 
		return academyLoginDao.findById(academyId);
	}
	
}
