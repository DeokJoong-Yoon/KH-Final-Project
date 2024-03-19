package com.myedumyselect.admin.board.academy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

@Mapper
public interface AcademySourceAdminDAO {

	public List<AcademySourceVO> memberList(AcademySourceVO academySourceVO);

	public int memberListCnt(AcademySourceVO academySourceVO);

	public AcademySourceVO memberDetail(AcademySourceVO academyAdminVO);

}
