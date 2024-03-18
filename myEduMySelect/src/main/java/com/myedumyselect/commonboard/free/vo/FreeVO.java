package com.myedumyselect.commonboard.free.vo;

//import org.springframework.web.multipart.MultipartFile;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FreeVO extends CommonVO {
	private int common_no	=0;
	private String personal_id	="";
	private int member_type_id	=0;
	private String common_title	="";
	private String common_content	="";
	private String common_register_date;
	private String common_edit;
	private int common_readcnt	=0;
}