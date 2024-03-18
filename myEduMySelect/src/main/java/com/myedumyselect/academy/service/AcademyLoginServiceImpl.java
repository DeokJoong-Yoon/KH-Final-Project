package com.myedumyselect.academy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.myedumyselect.academy.vo.AcademySignUpVo;
import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVo;

import lombok.Setter;

@Service
public class AcademyLoginServiceImpl implements AcademyLoginService {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;


	// 로그인
	@Override
	public AcademyLoginVo loginProcess(String academyId, String academyPasswd) {
		return academyLoginDao.findByIdAndPasswd(academyId, academyPasswd);
	}
 
	// 회원가입
	public int academyInsert(AcademySignUpVo academySignUpVo) {
		int result = 0;
		result = academyLoginDao.academyInsert(academySignUpVo.toAcademyLoginVo());
		return result;
	}

	/*
	// 로그인 실패 횟수
	@Override
	public int updateacademyLoginFailCount(academyLoginVo login) {
		return academyLoginDao.updateacademyLoginFailCount(login);
	}


	@Override
	public int updateAccountBannedDate(String academyId, Date bannedDate) {
		return academyLoginDao.updateAccountBannedDate(academyId, bannedDate);
	}
	*/

	// 마이페이지에 Id값을 기준으로 정보 불러올 떄
	@Override
	public AcademyLoginVo findById(String academyId) {
		return academyLoginDao.findById(academyId);
	}
	
	// 아이디 중복체크
	@Override
	public int checkId(String id) {
		int cnt = 0;
		try {
			cnt = academyLoginDao.checkId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	// 이메일 중복체크
	@Override
	public int checkEmail(String email) {
		int cnt = 0;
		try {
			cnt = academyLoginDao.checkEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	
	// 사업자등록번호 중복체크
	@Override
	public AcademyLoginVo findByNumber(String academyNumber) {		
		return academyLoginDao.findByNumber(academyNumber);
	}
	
	/*/ 사업자등록번호로 정보 조회
	@Override
	public AcademyLoginVo getAcademyInfo(String academyNumber) {
		return academyLoginDao.findByNumber(academyNumber);
	}*/

}
