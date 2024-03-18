package com.myedumyselect.admin.openapi.data.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

@Mapper
public interface AcademySourceDAO {
	public List<AcademySourceVO> insertAcademySourceList(List<AcademySourceVO> academySourceList);
	public int insertAcademySource(AcademySourceVO academySourceVO);
	public int selectAcademySourceCount();
	public int memberListCnt(AcademySourceVO academySourceVO);
	public List<AcademySourceVO> memberList(AcademySourceVO academySourceVO);

}
