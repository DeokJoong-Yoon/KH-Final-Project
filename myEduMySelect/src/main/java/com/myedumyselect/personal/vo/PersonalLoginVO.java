package com.myedumyselect.personal.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor; 

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PersonalLoginVO {
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
  
	public PersonalLoginVO(String personalId, String personalPasswd) {
		this.personalId = personalId;
		this.personalPasswd = personalPasswd;
	}
}
