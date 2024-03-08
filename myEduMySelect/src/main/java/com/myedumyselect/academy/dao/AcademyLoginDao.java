package com.myedumyselect.academy.dao;

import org.apache.ibatis.annotations.Mapper;

<<<<<<< HEAD
import com.myedumyselect.academy.vo.AcademyLoginVO;

@Mapper
public interface AcademyLoginDao {
	
	// 로그인
	public AcademyLoginVO loginProcess(AcademyLoginVO login);

	// 회원가입
	public int academyInsert(AcademyLoginVO login); 
=======
import com.myedumyselect.academy.vo.AcademyLoginVo;

//import com.myedumyselect.academy.vo.AcademyLoginVo;

@Mapper
public interface AcademyLoginDao {
	
	// 로그인
	public AcademyLoginVo loginprocess(AcademyLoginVo login);
	
	// 회원가입
	public int academyInsert(AcademyLoginVo login);
>>>>>>> branch 'main' of https://github.com/kimzionoff/KH-Final-Project.git
	 
	
}
