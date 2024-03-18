package com.myedumyselect.matching.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class MatchingBoardTest {
	
	@Autowired
	private MatchingBoardDAO mbDAO;
	
//	@Test
//	public void testMBoardList() {
//		log.info("mBoardList() 메소드 실행");
//		
//		MatchingBoardVO mbVO = null;
//		List<MatchingBoardVO> list = mbDAO.mBoardListPreview(mbVO);
//		for(MatchingBoardVO vo : list) {
//			log.info(vo.toString());
//		}
//	}
//	
//	@Test
//	public void testMPublicUpload() {
//		log.info("mPublicUpload() 메소드 실행");
//		
//		MatchingBoardVO mbVO = new MatchingBoardVO();
//		
//		mbVO.setMatchingGuAddress("강남구");
//		mbVO.setMatchingDongAddress("역삼동");
//		mbVO.setMatchingTargetGrade("성인");
//		mbVO.setMatchingTargetSubject("컴퓨터");
//		mbVO.setMatchingFee("무관");
//		mbVO.setMatchingKeyword1("기초부터");
//		mbVO.setMatchingKeyword2("");
//		mbVO.setMatchingKeyword3("");
//		
//		int count = mbDAO.publicUpload(mbVO);
//		log.info("공개 매칭 : " + count);
//	}
//	
//	@Test
//	public void testSearchEmail() {
//		log.info("searchEmail() 메소드 실행");
//		MatchingBoardVO mbVO = new MatchingBoardVO();
//		
//		List<String> list = new ArrayList<>();
//		list.add("대치의수학교습소");
//		list.add("진화수학학원");
//		mbVO.setPrivateChecked(list);
//		
//		List<AcademyLoginVo> list2 = mbDAO.searchEmail(mbVO);
//		for(AcademyLoginVo vo : list2) {
//			log.info(vo.toString());
//		}
//	}
	
//	@Test
//	public void testBoardUpdate() {
//		MatchingBoardVO mbVO = new MatchingBoardVO();
//		mbVO.setMatchingNo(178);
//		mbVO.setMatchingComment("하이");
//		
//		int count = mbDAO.mBoardUpdate(mbVO);
//		log.info("수정된 행의 수 : " + count);
//	}
	

}
