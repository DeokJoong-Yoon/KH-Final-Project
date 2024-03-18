package com.myedumyselect.client.main.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class MainServiceDAOTests {

	@Autowired
	MainServiceDAO mainServiceDAO;

	/*
	 * @Test public void mainSearchList() { AcademySourceVO avo = new
	 * AcademySourceVO();
	 * 
	 * avo.setAcademyCurriculumName("보습"); avo.setAcademyGuAddress("강북구");
	 * avo.setAcademyDongAddress("번동");
	 * 
	 * List<AcademySourceVO> list = null; if (null !=
	 * mainServiceDAO.mainSearchList(avo)) { list =
	 * mainServiceDAO.mainSearchList(avo); for (AcademySourceVO vo : list) {
	 * log.info(vo.toString()); } } else { log.info("list 널"); } }
	 */

	@Test
	public void mainListCnt() {
		AcademySourceVO avo = new AcademySourceVO();
		avo.setAcademyCurriculumName("보습");
		avo.setAcademyGuAddress("강북구");
		avo.setAcademyDongAddress("번동");
		
		log.info("학원 수 : " + mainServiceDAO.mainListCnt(avo));
	}
}
