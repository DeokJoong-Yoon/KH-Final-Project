package com.myedumyselect.academy.dao;

import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;


import com.myedumyselect.academy.vo.AcademyLoginVO;

@Mapper
public interface AcademyLoginDao {

//로그인
	public AcademyLoginVO loginProcess(AcademyLoginVO login);

	// 로그인 실패 횟수
	public int updateAcademyLoginFailCount(AcademyLoginVO login);

	// 로그인 제한 상태
	public int updateAccountBannedDate(String academyId, Date bannedDate);

    // 회원가입
    public int academyInsert(AcademyLoginVO login);

	// 아이디 찾기
	public AcademyLoginVO findById(String academyId);

	// 사업자 등록번호 찾기
	public AcademyLoginVO findByNumber(String academyNumber);

	// 아이디 중복검사
	public int checkId(String academyId);

	// 이메일 중복검사
	public int checkEmail(String academyManagerEmail);

	// 마이페이지 회원정보 수정
	public int academyUpdate(AcademyLoginVO newAcademyInfo);

	// 비밀번호 변경
	public int updatePasswdChangeDate(AcademyLoginVO login);

}