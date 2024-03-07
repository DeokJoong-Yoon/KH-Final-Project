package com.myedumyselect.personal.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.personal.vo.PersonalLoginVO;

@Mapper
public interface PersonalLoginDao {

	// 로그인
	public PersonalLoginVO loginProcess(PersonalLoginVO login);

	// 회원가입
	public int personalInsert(PersonalLoginVO login);

}
