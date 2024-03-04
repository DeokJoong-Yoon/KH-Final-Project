package com.myedumyselect.admin.openapi.data.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


import lombok.Setter;

@SpringBootTest
public class AcademySourceDaoTests {

	@Setter(onMethod_ = @Autowired)
	private AcademySourceDAO academySourceDAO;
	
	public void academySourceList() {
//		AcademySourceVO academySourceVO;
//		academySourceDAO.academySourceList(academySourceVO);
	}
}
