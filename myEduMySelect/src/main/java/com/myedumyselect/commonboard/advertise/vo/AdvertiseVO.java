package com.myedumyselect.commonboard.advertise.vo;


import java.util.List;

import com.myedumyselect.common.file.FileVO;
import com.myedumyselect.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class AdvertiseVO extends CommonVO {
	private int commonNo = 0;
	private String academyId = "";
	private int memberTypeId = 2;
	private String commonNickname = "";
	private String commonTitle = "";
	private String commonContent = "";
	private String commonRegisterDate = "";
	private String commonEdit = "";
	private int commonReadcnt = 0;
	private String commonBlockConfirm = "";
	private String commonBlockDate = "";
	private String commonThumb = "";
	private String commonFile = "";
	private List<FileVO> fileVO; 
	//private FileVO fileVO;
}