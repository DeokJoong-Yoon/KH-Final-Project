package com.myedumyselect.academy.dao;

//import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.myedumyselect.academy.vo.AcademyLoginVo;

@Mapper
public interface AcademyLoginDao {
	AcademyLoginVo findByIdAndPasswd(@Param("academyId") String academyId,
									 @Param("academyPasswd")String academyPasswd);
	// 회원가입
	int academyInsert(AcademyLoginVo academyLoginVo);
	
	// 아이디 찾기
	AcademyLoginVo findById(String academyId);
	
	// 사업자 등록번호 찾기
	AcademyLoginVo findByNumber(String academyNumber);
	
	// 아이디 중복검사
	int checkId(String academyId);
	
	// 이메일 중복검사
	int checkEmail(String academyManagerEmail);
	
	// 마이페이지 회원정보 수정
	public int academyUpdate(AcademyLoginVo login);
	
	// 비밀번호 변경
	public int updatePasswdChangeDate(AcademyLoginVo login);
	
	
	// TODO: int academyUpdate(AcademyLoginVo login);
}
