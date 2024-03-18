package com.myedumyselect.client.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

@Mapper
public interface MainServiceDAO {
	public List<AcademySourceVO> mainSearchList(AcademySourceVO avo);

	public int mainListCnt(AcademySourceVO avo);
}
