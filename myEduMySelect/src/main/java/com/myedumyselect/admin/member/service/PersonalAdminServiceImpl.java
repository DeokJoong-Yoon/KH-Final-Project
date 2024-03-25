package com.myedumyselect.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.admin.member.dao.PersonalAdminDAO;
import com.myedumyselect.admin.member.vo.PersonalAdminVO;

import lombok.Setter;

@Service
public class PersonalAdminServiceImpl implements PersonalAdminService {

	@Setter(onMethod_ = @Autowired)
	private PersonalAdminDAO personalAdminDAO;

	@Override
	public List<PersonalAdminVO> memberList(PersonalAdminVO personalAdminVO) {
		List<PersonalAdminVO> list = null;
		list = personalAdminDAO.memberList(personalAdminVO);
		maskPersonalPhone(list);
		return list;
	}

	@Override
	public int memberListCnt(PersonalAdminVO personalAdminVO) {
		return personalAdminDAO.memberListCnt(personalAdminVO);
	}

	@Override
	public PersonalAdminVO memberDetail(PersonalAdminVO personalAdminVO) {
		PersonalAdminVO result = personalAdminDAO.memberDetail(personalAdminVO);
		maskPersonalPhone(result);
		return result;
	}

	@Override
	public int memberDelete(PersonalAdminVO personalAdminVO) {
		return personalAdminDAO.memberDelete(personalAdminVO);
	}

	// personal_phone 마스킹 처리
	private void maskPersonalPhone(List<PersonalAdminVO> personalList) {
		for (PersonalAdminVO personal : personalList) {
			maskPersonalPhone(personal);
		}
	}

	private void maskPersonalPhone(PersonalAdminVO personal) {
		if (personal != null && personal.getPersonalPhone() != null && personal.getPersonalPhone().length() == 11) {
			String phone = personal.getPersonalPhone();
			String maskedPhone = phone.substring(0, 7) + "****";
			personal.setPersonalPhone(maskedPhone);
		}
	}

}
