package com.myedumyselect.commonboard.free.vo;

import org.springframework.web.multipart.MultipartFile;

//import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FreeVO extends CommonVO {
	private int commonNo	=0;
	private String personalId	="";
	private int memberTypeId	=0;
	private String commonTitle	="";
	private String commonContent	="";
	private String commonRegisterDate;
	private String commonEdit;
	private int commonReadcnt	=0;
	private int freeReplyCnt	=0;
	private MultipartFile file;
	private String commonFile	="";
}