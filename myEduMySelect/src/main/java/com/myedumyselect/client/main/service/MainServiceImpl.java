package com.myedumyselect.client.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;
import com.myedumyselect.client.main.dao.MainServiceDAO;

import lombok.Setter;

@Service
public class MainServiceImpl implements MainService {

	@Setter(onMethod_ = @Autowired)
	private MainServiceDAO mainServiceDAO;

	@Override
	public List<AcademySourceVO> mainSearchList(AcademySourceVO avo) {
		List<AcademySourceVO> list = null;
		list = mainServiceDAO.mainSearchList(avo);
		return list;
	}

	@Override
	public int mainListCnt(AcademySourceVO avo) {
		return mainServiceDAO.mainListCnt(avo);
	}

}
