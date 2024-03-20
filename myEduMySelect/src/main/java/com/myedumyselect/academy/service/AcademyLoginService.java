package com.myedumyselect.academy.service;


import com.myedumyselect.academy.vo.AcademySignUpVo;
import com.myedumyselect.academy.vo.AcademyLoginVo;

public interface AcademyLoginService {
	
	// 로그인
	AcademyLoginVo loginProcess(String academyId, String academyPasswd);
	
	// 회원가입
	int academyInsert(AcademySignUpVo academySignUpVo);
	
	// Id값을 기준으로 마이페이지에 정보 불러올 때 
	AcademyLoginVo findById(String academyId);
	
	// 사업자등록번호 중복 체크
	AcademyLoginVo findByNumber(String academyNumber);
	
	// 아이디 중복체크
	int checkId(String academyId);
	
	// 이메일 중복체크
	int checkEmail(String academyManagerEmail);
	
	
	// 회원정보 수정
	int academyUpdate(AcademyLoginVo login);
	
	// 비밀번호 변경
	int updatePasswdChangeDate(AcademyLoginVo login);
	
	
	// TODO: 회원 정보 수정
	// TODO: 로그인 제한 상태
	// TODO: 로그인 실패 횟수
}

