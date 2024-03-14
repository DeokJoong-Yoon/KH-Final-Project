package com.myedumyselect.matching.board.vo;

import java.util.List;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MatchingBoardVO extends CommonVO {
	
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
	
	private String matchingComment = "";
	
	private List<String> privateChecked;
	
	private int rowNumber;
}
