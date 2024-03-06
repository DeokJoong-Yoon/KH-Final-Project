package com.myedumyselect.commonboard.free.vo;

import lombok.Data;

@Data
public class FreeVO {
	private int common_no;
	private String personal_id;
	private int member_type_id;
	private String common_nickname;
	private String common_title;
	private String common_content;
	private String common_register_date;
	private int common_readcnt;
}
