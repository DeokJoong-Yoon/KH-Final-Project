package com.myedumyselect.client.main.service;

import java.util.List;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

public interface MainService {
	public List<AcademySourceVO> mainSearchList(AcademySourceVO avo);

	public int mainListCnt(AcademySourceVO avo);
}
