package com.myedumyselect.personal.service;

import java.util.Date;

import com.myedumyselect.personal.vo.PersonalLoginVO;

public interface PersonalLoginService {

	// 로그인
	public PersonalLoginVO loginProcess(PersonalLoginVO login);

	// 로그인 실패 횟수
	public int updatePersonalLoginFailCount(PersonalLoginVO login);

	// 로그인 제한 상태
	public int updateAccountBannedDate(String personalId, Date bannedDate);

	// 회원가입
	public int personalInsert(PersonalLoginVO login);

	// 개인회원 아이디 중복체크
	public int idCheck(String id);

	// 개인회원 이메일 중복체크
	public int emailCheck(String email);

	// 마이페이지
	public PersonalLoginVO personalMyPage(PersonalLoginVO login);

	/// 회원정보 수정
	public int personalUpdate(PersonalLoginVO login);

	// 비밀번호 변경
	public int updatePersonalPasswd(PersonalLoginVO checkPassword);

	// 비밀번호 변경 업데이트 날짜
	// public int updatePasswdChangeDate(PersonalLoginVO login);

}
