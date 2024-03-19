package com.myedumyselect.admin.board.academy.service;

import java.util.List;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

public interface AcademySourceAdminService {

	public int academySourceListCnt(AcademySourceVO academySourceVO);

	public List<AcademySourceVO> academySourceList(AcademySourceVO academySourceVO);

}
