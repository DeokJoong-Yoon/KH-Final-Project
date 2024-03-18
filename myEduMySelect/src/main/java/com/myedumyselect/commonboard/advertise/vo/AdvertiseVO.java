package com.myedumyselect.commonboard.advertise.vo;


import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
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

}