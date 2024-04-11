package com.myedumyselect.matching.board.vo;

import java.util.List;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)		//상위 클래스의 필드를 고려하지 않고 오직 현재 클래스의 필드만을 고려
public class MatchingBoardVO extends CommonVO {
	
	//데이터 베이스에 존재하는 컬럼들을 필드로 정의
	private int matchingNo = 0;
	private String personalId = "";
	private String matchingPrivate = "N";
	private String matchingPasswd = "";
	private String matchingRegisterDate;
	private String matchingEditDate;
	private String matchingGuAddress = "";
	private String matchingDongAddress = "";
	private String matchingTargetGrade = "";
	private String matchingTargetSubject = "";
	private String matchingFee = "";
	private String matchingKeyword1 = "";
	private String matchingKeyword2 = "";
	private String matchingKeyword3 = "";
	private int commentCnt = 0;
	private String matchingMemo = "";
	
	//비공개 매칭 시 메일 발송할 대상을 정하기 위해 필요
	private List<String> privateChecked;
	
}
