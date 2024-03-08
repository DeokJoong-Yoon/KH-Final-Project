package com.myedumyselect.academy.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVO;

@Mapper
public interface AcademyLoginDao {
	
	// 로그인
	public AcademyLoginVO loginProcess(AcademyLoginVO login);

	// 회원가입
	public int academyInsert(AcademyLoginVO login); 
	 
	
}
