package com.myedumyselect.admin.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.member.vo.PersonalAdminVO;

@Mapper
public interface PersonalAdminDAO {

	public List<PersonalAdminVO> memberList(PersonalAdminVO personalAdminVO);

	public int memberListCnt(PersonalAdminVO personalAdminVO);

	public PersonalAdminVO memberDetail(PersonalAdminVO personalAdminVO);

	public int memberDelete(PersonalAdminVO personalAdminVO);
}
