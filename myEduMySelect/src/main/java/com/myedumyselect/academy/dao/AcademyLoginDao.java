package com.myedumyselect.academy.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVo;

@Mapper
public interface AcademyLoginDao {
	
	// 로그인
	public AcademyLoginVo loginProcess(AcademyLoginVo login);

	// 회원가입
	public int academyInsert(AcademyLoginVo login); 

	
}
