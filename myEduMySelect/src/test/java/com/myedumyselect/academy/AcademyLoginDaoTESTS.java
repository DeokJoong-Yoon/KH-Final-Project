package com.myedumyselect.academy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.academy.dao.AcademyAdvertiseDAO;
import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.dao.AcademyMatchingBoardDAO;

import lombok.Setter;

@SpringBootTest
public class AcademyLoginDaoTESTS {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;

	@Setter(onMethod_ = @Autowired)
	private AcademyAdvertiseDAO academyAdvertiseDAO;

	@Setter(onMethod_ = @Autowired)
	private AcademyMatchingBoardDAO academyMatchingBoardDAO;

}
