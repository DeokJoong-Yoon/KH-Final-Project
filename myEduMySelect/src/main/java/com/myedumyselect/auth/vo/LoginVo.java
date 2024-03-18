package com.myedumyselect.auth.vo;

import java.util.Date;

import lombok.Data;

@Data
public class LoginVo {
    private String id;
    private String name;
    private String passwd;
    private int memberTypeId;
    private String personalId;	
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

