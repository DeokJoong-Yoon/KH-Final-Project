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
		return list;
	}

	@Override
	public int memberListCnt(PersonalAdminVO personalAdminVO) {
		return personalAdminDAO.memberListCnt(personalAdminVO);
	}

	@Override
	public PersonalAdminVO memberDetail(PersonalAdminVO personalAdminVO) {
		return personalAdminDAO.memberDetail(personalAdminVO);
	}

	@Override
	public int memberDelete(PersonalAdminVO personalAdminVO) {
		return personalAdminDAO.memberDelete(personalAdminVO);
		
	}

}
