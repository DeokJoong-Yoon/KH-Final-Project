package com.myedumyselect.common.withdrawal.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

@Mapper
public interface WithdrawalDAO {

	public int personalDelete(PersonalLoginVO personalLoginVO);

	public int academyDelete(AcademyLoginVO academyLoginVo);

}
