package com.myedumyselect.admin.board.free.vo;

import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class FreeBoardAdminVO extends CommonVO{
	private int commonNo = 0;
	private String personalId = "";
	private int memberTypeIid = 0;
	private String commonTitle = "";
	private String commonContent = "";
	private String commonRegisterDate;
	private String commonEdit;
	private int commonReadcnt = 0;
	
	private MultipartFile file; // 파일 업로드를 위한 필드
	private String commonFile = ""; // 실제서버에 저장할 파일명
}
