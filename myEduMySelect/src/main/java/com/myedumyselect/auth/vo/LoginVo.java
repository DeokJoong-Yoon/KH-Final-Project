package com.myedumyselect.auth.vo;

import java.time.LocalDateTime;
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
	private String academyId;
	 
	 private String academyNumber;
	 private LocalDateTime academyJoinDate;
	 private String academyPasswd;
	 private String academyName;
	 private String academyGuAddress;
	 private String academyDongAddress;
	 private String academyRoadAddress;
	 private String academyPhone;
	 private String academyManagerName;
	 private String academyManagerEmail;
	 private String academyManagerPhone;
	 private String academyTargetGrade;
	 private String academyTargetSubject;
	 private String academyKeyword1;
	 private String academyKeyword2;
	 private String academyKeyword3;
	 private String academyKeyword4;
	 private String academyKeyword5;
	 private String academyFee;
	 private LocalDateTime academyPasswdChangeDate;
	 private Integer academyLoginFailCount = 0;
	 private LocalDateTime academyAccountBannedDate;
}

