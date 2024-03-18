package com.myedumyselect.admin.member.vo;

import java.util.Date;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PersonalAdminVO extends CommonVO {
	private String personalId;
	private int memberTypeId;
	private String personalName;
	private String personalPasswd;
	private String personalEmail;
	private String personalBirth;
	private String personalAddress;
	private String personalPhone;
	private Date personalJoinDate;
	private int personalLoginFailCount;
	private Date personalAccountBannedDate;
	private Date personalPasswdChangeDate;
}
