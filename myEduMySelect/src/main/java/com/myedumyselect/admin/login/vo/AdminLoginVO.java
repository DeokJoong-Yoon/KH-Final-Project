package com.myedumyselect.admin.login.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminLoginVO {
	private String adminId;
	private int memberTypeId;
	private String adminPasswd;
	private String adminTeam;
	private String adminName;
	private String adminEmail;
	private String adminPhone;
	private String adminAssignedDate;
	private String adminPasswordChangeDate;
}

//ADMIN_ID                   NOT NULL VARCHAR2(12) 
//MEMBER_TYPE_ID             NOT NULL NUMBER(1)    
//ADMIN_PASSWORD             NOT NULL VARCHAR2(20) 
//ADMIN_TEAM                          VARCHAR2(30) 
//ADMIN_NAME                 NOT NULL VARCHAR2(50) 
//ADMIN_EMAIL                NOT NULL VARCHAR2(50) 
//ADMIN_PHONE                NOT NULL CHAR(11)     
//ADMIN_ASSIGNED_DATE        NOT NULL DATE         
//ADMIN_PASSWORD_CHANGE_DATE          DATE  