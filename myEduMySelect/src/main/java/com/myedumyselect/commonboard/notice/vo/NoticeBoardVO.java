package com.myedumyselect.commonboard.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeBoardVO extends CommonVO {
	int commonNo = 0;
	String adminId = "";
	int memberTypeId = 3;
	String commonNickname = "";
	String commonTitle = "";
	String commonContent = "";
	String commonRegisterDate = "";
	String commonEdit = "";
	int commonReadcnt = 0;
	char commonBlockConfirm = 0;
	String commonBlockDate = "";

	private MultipartFile file; // 파일 업로드를 위한 필드
	private String commonFile = ""; // 실제서버에 저장할 파일명
}
