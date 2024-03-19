package com.myedumyselect.admin.board.academy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.academy.dao.AcademySourceAdminDAO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

import lombok.Setter;

@Service
public class AcademySourceAdminServiceImpl implements AcademySourceAdminService {
	@Setter(onMethod_ = @Autowired)
	private AcademySourceAdminDAO academySourceAdminDAO;

	@Override
	public List<AcademySourceVO> academySourceList(AcademySourceVO academySourceVO) {
		List<AcademySourceVO> list = null;
		list = academySourceAdminDAO.memberList(academySourceVO);
		return list;
	}

	@Override
	public int academySourceListCnt(AcademySourceVO academySourceVO) {
		return academySourceAdminDAO.memberListCnt(academySourceVO);
	}

	@Override
	public AcademySourceVO memberDetail(AcademySourceVO academyAdminVO) {
		return academySourceAdminDAO.memberDetail(academyAdminVO);
	}

}
