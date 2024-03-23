package com.myedumyselect.academy;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.academy.dao.AcademyAdvertiseDAO;
import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class AcademyLoginDaoTESTS {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;
	
	@Setter(onMethod_ = @Autowired)
	private AcademyAdvertiseDAO academyAdvertiseDAO;
	
	
	@Test
	public void findById() {
		AcademyLoginVO avo = new AcademyLoginVO();
		
		avo = academyLoginDao.findById("yemac3432");
		
		log.info(avo.toString());
	}
	
	@Test
	public void academyAdvertiseList() {
		AdvertiseVO advertiseVO = new AdvertiseVO();
		advertiseVO.setAcademyId("dudalsl");
		List<AdvertiseVO> advertiseList = new ArrayList<AdvertiseVO>();
		advertiseList = academyAdvertiseDAO.advertiseList(advertiseVO);
		
		for(AdvertiseVO list : advertiseList) {
			log.info(list.toString());
		}
	}
}
