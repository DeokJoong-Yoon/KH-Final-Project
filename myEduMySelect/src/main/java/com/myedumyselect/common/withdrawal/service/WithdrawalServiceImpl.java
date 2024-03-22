package com.myedumyselect.common.withdrawal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.common.withdrawal.dao.WithdrawalDAO;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Service
public class WithdrawalServiceImpl implements WithdrawalService {
	@Setter(onMethod_ = @Autowired)
	private WithdrawalDAO withdrawalDAO;

	@Override
	public int personalDelete(PersonalLoginVO personalLoginVO) {
		return withdrawalDAO.personalDelete(personalLoginVO);
	}

	@Override
	public int academyDelete(AcademyLoginVO academyLoginVo) {
		return withdrawalDAO.academyDelete(academyLoginVo);
	}

}
