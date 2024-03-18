package com.myedumyselect.admin.member.service;

import java.util.List;

import com.myedumyselect.admin.member.vo.PersonalAdminVO;

public interface PersonalAdminService {
	public List<PersonalAdminVO> memberList(PersonalAdminVO personalAdminVO);

	public int memberListCnt(PersonalAdminVO personalAdminVO);

	public PersonalAdminVO memberDetail(PersonalAdminVO personalAdminVO);

	public int memberDelete(PersonalAdminVO personalAdminVO);

}
