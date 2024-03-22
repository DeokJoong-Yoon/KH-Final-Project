package com.myedumyselect.academy;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class AcademyLoginDaoTESTS {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;
	
	@Test
	public void findById() {
		AcademyLoginVO avo = new AcademyLoginVO();
		
		avo = academyLoginDao.findById("yemac3432");
		
		log.info(avo.toString());
	}
}
