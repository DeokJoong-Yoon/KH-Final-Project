package com.myedumyselect.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.member.dao.AcademyAdminDAO;
import com.myedumyselect.admin.member.vo.AcademyAdminVO;

import lombok.Setter;

@Service
public class AcademyAdminServiceImpl implements AcademyAdminService {
	@Setter(onMethod_ = @Autowired)
	private AcademyAdminDAO academyAdminDAO;

	@Override
	public List<AcademyAdminVO> memberList(AcademyAdminVO academyAdminVO) {
		List<AcademyAdminVO> list = null;
		list = academyAdminDAO.memberList(academyAdminVO);
		maskAcademyPhone(list);
		return list;
	}

	@Override
	public int memberListCnt(AcademyAdminVO academyAdminVO) {
		return academyAdminDAO.memberListCnt(academyAdminVO);
	}

	@Override
	public AcademyAdminVO memberDetail(AcademyAdminVO academyAdminVO) {
		AcademyAdminVO result = academyAdminDAO.memberDetail(academyAdminVO);
		maskAcademyPhone(result);
		return result;
	}

	@Override
	public int memberDelete(AcademyAdminVO academyAdminVO) {
		return academyAdminDAO.memberDelete(academyAdminVO);
	}

	// academy_phone 마스킹 처리
	private void maskAcademyPhone(List<AcademyAdminVO> academyList) {
		for (AcademyAdminVO academy : academyList) {
			maskAcademyPhone(academy);
		}
	}

	private void maskAcademyPhone(AcademyAdminVO academy) {
		if (academy != null && academy.getAcademyManagerPhone() != null && academy.getAcademyManagerPhone().length() == 11) {
			String phone = academy.getAcademyManagerPhone();
			String maskedPhone = phone.substring(0, 7) + "****";
			academy.setAcademyManagerPhone(maskedPhone);
		}
	}

}
