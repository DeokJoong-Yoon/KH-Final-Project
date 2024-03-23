package com.myedumyselect.academy.service;

import java.sql.Date;

import com.myedumyselect.academy.vo.AcademyLoginVO;

public interface AcademyLoginService {

	// 로그인
	public AcademyLoginVO loginProcess(AcademyLoginVO login);

	// 로그인 실패 횟수
	public int updateAcademyLoginFailCount(AcademyLoginVO login);

	// 로그인 제한 상태
	public int updateAccountBannedDate(String academyId, Date bannedDate);

	// 회원가입
	public int academyInsert(AcademyLoginVO login);

	// Id값을 기준으로 마이페이지에 정보 불러올 때
	public AcademyLoginVO findById(String academyId);

	// 사업자등록번호 중복 체크
	public AcademyLoginVO findByNumber(String academyNumber);

	// 아이디 중복체크
	public int checkId(String academyId);

	// 이메일 중복체크
	public int checkEmail(String academyManagerEmail);

	// 회원정보 수정
	public int academyUpdate(AcademyLoginVO newAcademyInfo);

	// 비밀번호 변경
	public int updatePasswdChangeDate(AcademyLoginVO checkPassword);

}
