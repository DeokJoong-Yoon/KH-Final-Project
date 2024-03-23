package com.myedumyselect.academy.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyMatchingBoardDAO;
import com.myedumyselect.academy.vo.AcademyLoginVO;
import com.myedumyselect.matching.board.vo.MatchingBoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AcademyMatchingBoardServiceImpl implements AcademyMatchingBoardService {
	
	@Setter(onMethod_ = @Autowired)
	AcademyMatchingBoardDAO academyMatchingBoardDAO;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	
	//매칭게시판 미리보기
	@Override
	public List<MatchingBoardVO> mBoardListPreview(MatchingBoardVO mbVO) {
		List<MatchingBoardVO> list = academyMatchingBoardDAO.mBoardListPreview(mbVO);
		return list;
	}

	
	//맞춤형 검색 결과 보기
	@Override
	public List<AcademyLoginVO> mResult(MatchingBoardVO mbVO) {
		return academyMatchingBoardDAO.mResult(mbVO);
	}

	
	//공개매칭 게시글 등록
	@Override
	public int publicUpload(MatchingBoardVO mbVO) {
		int result = 0;
		result = academyMatchingBoardDAO.publicUpload(mbVO);
		
		return result;
	}
	
	
	//비공개매칭 게시글 등록
	@Override
	public int privateUpload(MatchingBoardVO mbVO) {
		int result = 0;
		result = academyMatchingBoardDAO.privateUpload(mbVO);

		return result;
	}
	
	
	//비공개매칭 메일 전송
	@Override
	public void sendEmail(MatchingBoardVO mbVO) {
		
		log.info(mbVO.getPrivateChecked().toString());
	
		List<AcademyLoginVO> totalList = academyMatchingBoardDAO.searchEmail(mbVO);
		
		//전송할 이메일의 List 생성
		List<String> emailList = new ArrayList<>();
		for(AcademyLoginVO vo : totalList) {
			String email = vo.getAcademyManagerEmail();
		    emailList.add(email);
		}
		
		//비공개 매칭 게시글 글 번호 추출
		int number = mbVO.getMatchingNo();
		
		SimpleMailMessage mail = new SimpleMailMessage();									//이메일 객체
		mail.setTo(emailList.toArray(new String[emailList.size()]));						//이메일 수신자
		mail.setSubject("[MyEduMySelect] 등록된 비공개매칭을 확인하세요!");							//이메일 제목
		mail.setText(mbVO.getPersonalId() + "님이 비공개매칭을 시작하였습니다. 지금 바로 확인하세요! \n"	//이메일 내용
				+ "덧붙이는 말 : " + mbVO.getMatchingComment()	
				+ "\n매칭 상세페이지 링크 : http://localhost:8081/matching/boardDetail?matchingNo=" + number
				+ "\n비공개 매칭 게시글 비밀번호 : " + mbVO.getMatchingPasswd());
		
		javaMailSender.send(mail);			//이메일 전송
		
		
		System.out.println(mail.getTo());
		System.out.println(mail.getSubject());
		System.out.println(mail.getText());
	
	}

	
	//매칭게시판 글 목록 보기
	@Override
	public List<MatchingBoardVO> mBoardList(MatchingBoardVO mbVO) {
		List<MatchingBoardVO> list = academyMatchingBoardDAO.mBoardList(mbVO);
		return list;
	}
	
	


	//매칭게시판 상세 보기
	@Override
	public MatchingBoardVO mBoardDetail(MatchingBoardVO mbVO) {
		MatchingBoardVO detail = academyMatchingBoardDAO.mBoardDetail(mbVO);
		return detail;
	}


	//전체 레코드 수 반환
	@Override
	public int mBoardListCnt(MatchingBoardVO mbVO) {
		return academyMatchingBoardDAO.mBoardListCnt(mbVO);
	}
	

	//매칭게시판 게시글 수정 폼 이동
	@Override
	public MatchingBoardVO mBoardUpdateForm(MatchingBoardVO mbVO) {
		MatchingBoardVO updateData = academyMatchingBoardDAO.mBoardDetail(mbVO);
		return updateData;
	}
	
	//매칭게시판 게시글 수정
	@Override
	public int mBoardUpdate(MatchingBoardVO mbVO) {
		int result = 0;
		result = academyMatchingBoardDAO.mBoardUpdate(mbVO);
		return result;
	}


	//매칭게시판 게시글 삭제
	@Override
	public int mBoardDelete(MatchingBoardVO mbVO) {
		int result = 0;
		result = academyMatchingBoardDAO.mBoardDelete(mbVO);
		return result;
	}


	//매칭게시판 이전글 이동하기
	@Override
	public int prevMatchingNo(MatchingBoardVO mbVO) {
		int prev = academyMatchingBoardDAO.prevMatchingNo(mbVO);
		return prev;
	}


	//매칭게시판 다음글 이동하기
	@Override
	public int nextMatchingNo(MatchingBoardVO mbVO) {
		int next = academyMatchingBoardDAO.nextMatchingNo(mbVO);
		return next;
	}
}
