package com.myedumyselect.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.myedumyselect.admin.member.vo.AcademyAdminVO;
import com.myedumyselect.admin.openapi.data.dao.AcademySourceDAO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

import lombok.Setter;

public class AcademySourceServiceImple implements AcademySourceService{

	@Setter(onMethod_ = @Autowired)
	private AcademySourceDAO academySourceDAO;
	
	@Override
	public List<AcademySourceVO> List(AcademySourceVO academySourceVO) {
		List<AcademySourceVO> list = null;
		list = academySourceDAO.memberList(academySourceVO);
		return list;
	}

	@Override
	public int memberListCnt(AcademySourceVO academySourceVO) {
		return academySourceDAO.memberListCnt(academySourceVO);
	}

}
