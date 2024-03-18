package com.myedumyselect.admin.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.member.vo.PersonalAdminVO;

@Mapper
public interface AcademyAdminDAO {

	public List<AcademyAdminVO> memberList(AcademyAdminVO academyAdminVO);

	public int memberListCnt(AcademyAdminVO academyAdminVO);

	public PersonalAdminVO memberDetail(AcademyAdminVO academyAdminVO);

	public int memberDelete(AcademyAdminVO academyAdminVO);

}
