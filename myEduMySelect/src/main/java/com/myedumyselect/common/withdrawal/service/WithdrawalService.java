package com.myedumyselect.common.withdrawal.service;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.personal.vo.PersonalLoginVO;

public interface WithdrawalService {

	public int personalDelete(PersonalLoginVO personalLoginVO);

	public int academyDelete(AcademyLoginVo academyLoginVo);

}
