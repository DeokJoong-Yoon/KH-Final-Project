package com.myedumyselect.admin.member.service;

import java.util.List;

import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

public interface AcademySourceService {

	public List<AcademySourceVO> List(AcademySourceVO academySourceVO);

	public int memberListCnt(AcademySourceVO academySourceVO);
}
