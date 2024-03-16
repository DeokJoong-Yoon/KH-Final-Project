package com.myedumyselect.admin.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.member.vo.AcademyAdminVO;

@Mapper
public interface AcademyAdminDAO {

	public List<AcademyAdminVO> memberList(AcademyAdminVO academyAdminVO);

}
