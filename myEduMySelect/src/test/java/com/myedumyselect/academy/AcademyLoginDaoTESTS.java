package com.myedumyselect.academy;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.myedumyselect.academy.dao.AcademyAdvertiseDAO;
import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.dao.AcademyMatchingBoardDAO;
import com.myedumyselect.academy.dao.AcademyMatchingCommentDAO;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.commonboard.advertise.vo.AdvertiseVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;
import com.myedumyselect.matching.comment.vo.MatchingCommentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class AcademyLoginDaoTESTS {

	@Setter(onMethod_ = @Autowired)
	private AcademyLoginDao academyLoginDao;
	
	@Setter(onMethod_ = @Autowired)
	private AcademyAdvertiseDAO academyAdvertiseDAO;
	
	@Setter(onMethod_ = @Autowired)
	private AcademyMatchingBoardDAO academyMatchingBoardDAO;
	
	@Setter(onMethod_ = @Autowired)
	private AcademyMatchingCommentDAO academyMatchingCommentDAO;
	
//	@Test
//	public void findById() {
//		AcademyLoginVO avo = new AcademyLoginVO();
//		
//		avo = academyLoginDao.findById("yemac3432");
//		
//		log.info(avo.toString());
//	}
//	
//	@Test
//	public void academyAdvertiseList() {
//		AdvertiseVO advertiseVO = new AdvertiseVO();
//		advertiseVO.setAcademyId("dudalsl");
//		List<AdvertiseVO> advertiseList = new ArrayList<AdvertiseVO>();
//		advertiseList = academyAdvertiseDAO.advertiseList(advertiseVO);
//		
//		for(AdvertiseVO list : advertiseList) {
//			log.info(list.toString());
//		}
//	}
	
	@Test
	public void academyMatchingBoardList() {
		
		MatchingBoardVO matchingBoardVO = new MatchingBoardVO();
		
	    AcademyLoginVO academyLoginVO = new AcademyLoginVO();
	    academyLoginVO.setAcademyId("dudalsl");
	    //String academyId = academyLoginVO.getAcademyId();
	    
	    // 임시로 academyId 값을 저장할 수 있는 방법
	    MatchingCommentVO matchingCommentVO = new MatchingCommentVO();
	    matchingCommentVO.setAcademyId("dudalsl");	    
	    
	    // boardList를 조회할 때는 matchingBoardVO를 파라미터로 전달합니다.
	    List<MatchingBoardVO> boardList = new ArrayList<MatchingBoardVO>(); 
	    boardList = academyMatchingBoardDAO.boardList(matchingBoardVO);
	    
	    for(MatchingBoardVO list : boardList) {
	        log.info(list.toString());
	    }
	}

	
//	@Test
//	public void academyMatchingBoardComment() {
//		MatchingCommentVO matchingCommentVO = new MatchingCommentVO();
//		matchingCommentVO.setAcademyId("dudalsl");
//		List<MatchingCommentVO> CommentList = new ArrayList<MatchingCommentVO>();
//		CommentList = academyMatchingCommentDAO.CommentList(matchingCommentVO);
//		
//		for(MatchingCommentVO list : CommentList) {
//			log.info(list.toString());
//		}
//	}
}
