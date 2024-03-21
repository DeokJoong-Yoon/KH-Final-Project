package com.myedumyselect.admin.login.vo;

import java.sql.Date;

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
	private Date adminAssignedDate;
	private Date adminPasswordChangeDate;
}