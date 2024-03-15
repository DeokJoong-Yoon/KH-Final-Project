package com.myedumyselect.academy.dao;

import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.myedumyselect.academy.vo.AcademyLoginVo;

@Mapper
public interface AcademyLoginDao {
	Optional<AcademyLoginVo> findByIdAndPasswd(@Param("academyId") String academyId,
													@Param("academyPasswd")String academyPasswd);
	void academyInsert(AcademyLoginVo academyLoginVo); 
	Optional<AcademyLoginVo> findById(String academyId);
	
	/* tb_academy_source 정보 조회 */
	Optional<AcademyLoginVo> findByNumber(String academyNumber);
	
}
