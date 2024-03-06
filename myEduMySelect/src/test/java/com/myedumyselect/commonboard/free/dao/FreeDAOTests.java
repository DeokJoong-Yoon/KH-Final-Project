package com.myedumyselect.commonboard.free.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.commonboard.free.vo.FreeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;



@SpringBootTest
@Slf4j
public class FreeDAOTests {
	@Setter(onMethod_ = @Autowired)
	private FreeDAO freeDAO;
	
	
	/*@Test
	public void testFreeList() {
		log.info("FreeList() 메소드 실행");
		
		FreeVO fvo = null;
		List<FreeVO> list = freeDAO.freeList(fvo);
		for(FreeVO vo : list) {
			log.info(vo.toString());
		}
	}
	
	@Test
	public void testFreeDetail() {
		FreeVO fvo = new FreeVO();
		fvo.setCommon_no(1);
		
		FreeVO free = freeDAO.freeDetail(fvo);
		log.info(free.toString());
	}*/
}
