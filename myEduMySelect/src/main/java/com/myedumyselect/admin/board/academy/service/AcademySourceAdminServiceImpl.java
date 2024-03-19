package com.myedumyselect.admin.board.academy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.myedumyselect.admin.board.academy.dao.AcademySourceAdminDAO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

@Service
public class AcademySourceAdminServiceImpl implements AcademySourceAdminService {
	private AcademySourceAdminDAO academySourceAdminDAO;
	
	@Override
	public List<AcademySourceVO> academySourceList(AcademySourceVO academySourceVO) {
		List<AcademySourceVO> list = null;
		list = academySourceAdminDAO.memberList(academySourceVO);
		return list;
	}

	@Override
	public int academySourceListCnt(AcademySourceVO academySourceVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
