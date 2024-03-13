package com.myedumyselect.matching.board.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.vo.AcademyLoginVo;
import com.myedumyselect.matching.board.dao.MatchingBoardDAO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MatchingBoardServiceImpl implements MatchingBoardService {

	@Autowired
	private MatchingBoardDAO mbDAO;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	//매칭게시판 미리보기
	@Override
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbVO) {
		List<MatchingBoardVO> list = mbDAO.mBoardListPreview(mbVO);
		return list;
	}

	
	//맞춤형 검색 결과 보기
	@Override
	public List<AcademyLoginVo> mResult(MatchingBoardVO mbVO) {
		return mbDAO.mResult(mbVO);
	}

	
	//공개매칭 게시글 등록
	@Override
	public int publicUpload(MatchingBoardVO mbVO) {
		int result = 0;
		result = mbDAO.publicUpload(mbVO);
		
		return result;
	}
	
	
	//비공개매칭 게시글 등록
	@Override
	public int privateUpload(MatchingBoardVO mbVO) {
		int result = 0;
		result = mbDAO.privateUpload(mbVO);
		
		return result;
	}
	
	
	//비공개매칭 메일 전송
	@Override
	public void sendEmail(MatchingBoardVO mbVO) {
		
		log.info(mbVO.getPrivateChecked().toString());

		List<AcademyLoginVo> totalList = mbDAO.searchEmail(mbVO);
		
		//전송할 이메일의 List 생성
		List<String> emailList = new ArrayList<>();
		for(AcademyLoginVo vo : totalList) {
			String email = vo.getAcademyManagerEmail();
		    emailList.add(email);
		}
		
		SimpleMailMessage mail = new SimpleMailMessage();									//이메일 객체
		mail.setTo(emailList.toArray(new String[emailList.size()]));						//이메일 수신자
		mail.setSubject("[MyEduMySelect] 등록된 비공개매칭을 확인하세요!");							//이메일 제목
		mail.setText(mbVO.getPersonalId() + "님이 비공개매칭을 시작하였습니다. 지금 바로 확인하세요! \n"	//이메일 내용
				+ "덧붙이는 말 : " + mbVO.getMatchingComment()	
				+ "\n비공개 매칭 게시글 비밀번호 : " + mbVO.getMatchingPasswd());
		
		javaMailSender.send(mail);			//이메일 전송
		
		System.out.println(mail.getTo());
		System.out.println(mail.getSubject());
		System.out.println(mail.getText());
	
	}

	
	//매칭게시판 글 목록 보기
	@Override
	public List<MatchingBoardVO> mBoardList(MatchingBoardVO mbVO) {
		List<MatchingBoardVO> list = mbDAO.mBoardList(mbVO);
		return list;
	}


	//매칭게시판 상세 보기
	@Override
	public MatchingBoardVO mBoardListDetail(MatchingBoardVO mbVO) {
		MatchingBoardVO detail = mbDAO.mBoardListDetail(mbVO);
		return detail;
	}


	//전체 레코드 수 반환
	@Override
	public int mBoardListCnt(MatchingBoardVO mbVO) {
		return mbDAO.mBoardListCnt(mbVO);
	}
	
	
	


}
