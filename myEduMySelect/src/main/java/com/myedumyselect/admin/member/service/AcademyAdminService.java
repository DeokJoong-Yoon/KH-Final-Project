package com.myedumyselect.admin.member.service;

import java.util.List;

import com.myedumyselect.admin.member.vo.AcademyAdminVO;

public interface AcademyAdminService {

	public List<AcademyAdminVO> memberList(AcademyAdminVO academyAdminVO);

	public int memberListCnt(AcademyAdminVO academyAdminVO);

	public AcademyAdminVO memberDetail(AcademyAdminVO academyAdminVO);

	public int memberDelete(AcademyAdminVO academyAdminVO);
}
