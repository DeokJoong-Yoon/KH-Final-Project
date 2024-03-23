package com.myedumyselect.personal.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.personal.vo.PersonalLoginVO;

@Mapper
public interface PersonalLoginDao {

	// 로그인
	public PersonalLoginVO loginProcess(PersonalLoginVO login);

	// 로그인 실패 횟수
	public int updatePersonalLoginFailCount(PersonalLoginVO login);

	// 로그인 제한 상태
	public int updateAccountBannedDate(String personalId, Date bannedDate);

	// 개인회원 아이디 중복확인
	public int idCheck(String personalId);

	// 개인회원 이메일 중복확인
	public int emailCheck(String personalEmail);

	// 비밀번호 변경
	public int updatePersonalPasswd(PersonalLoginVO checkPassword);

	// 회원가입
	public int personalInsert(PersonalLoginVO login);

	// 마이페이지
	public PersonalLoginVO personalMyPage(PersonalLoginVO login);

	/// 회원정보 수정
	public int personalUpdate(PersonalLoginVO login);

}
