package com.myedumyselect.commonboard.free.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Setter;

@SpringBootTest
public class FreeDAOTests {
	@Setter(onMethod_ = @Autowired)
	private FreeDAO freeDAO;
//	private FreeVO freeVO;

	/*
	 * @Test public void testFreeList() { log.info("FreeList() 메소드 실행");
	 * 
	 * FreeVO fvo = null; List<FreeVO> list = freeDAO.freeList(fvo); for(FreeVO vo :
	 * list) { log.info(vo.toString()); } }
	 */

	/*
	 * @Test public void testReadCntUpdate() { FreeVO fvo = new FreeVO();
	 * fvo.setCommon_no(10002);
	 * 
	 * int count = freeDAO.readCntUpdate(fvo); log.info("수정된 행의 수: " + count); }
	 */

	/*
	 * @Test public void testFreeDetail() { FreeVO fvo = new FreeVO();
	 * fvo.setCommon_no(1);
	 * 
	 * FreeVO free = freeDAO.freeDetail(fvo); log.info(free.toString()); }
	 */

	/*
	 * @Test public void testFreeInsert() { FreeVO free = new FreeVO();
	 * free.setPersonal_id("icandoit6789"); free.setMember_type_id(1);
	 * free.setCommon_title("반갑습니다"); free.setCommon_content("안녕하세요. 잘 부탁드립니다.");
	 * 
	 * int count = freeDAO.freeInsert(free); log.info("입력된 행의 수: " + count); }
	 */

	/*
	 * @Test public void testFreeUpdate() { FreeVO free = new FreeVO();
	 * free.setCommon_title("문의남깁니다."); free.setCommon_content("수정 어떻게 해야하나요?");
	 * free.setCommon_no(10002);
	 * 
	 * int count = freeDAO.freeUpdate(free); log.info("수정된 행의 수: " + count);
	 * 
	 * }
	 */

	/*
	 * @Test public void testFreeDelete() { FreeVO freeVO = new FreeVO();
	 * freeVO.setCommon_no(10020);
	 * 
	 * log.info("삭제된 행의 수: "+freeDAO.freeDelete(freeVO)); }
	 */

	/*
	 * @Test public void testFreeList() { FreeVO fvo = new FreeVO();
	 * fvo.setPageNum(1); fvo.setAmount(12);
	 * 
	 * List<FreeVO> list = freeDAO.freeList(fvo); for(FreeVO vo : list) {
	 * log.info(vo.toString()); } log.info("총 레코드수 : " + freeDAO.freeListCnt(fvo));
	 * }
	 */
}
