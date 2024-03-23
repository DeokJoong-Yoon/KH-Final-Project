package com.myedumyselect.academy.vo;

import java.time.LocalDateTime;
 

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

 

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AcademyLoginVO {
 private String academyId;
 private int memberTypeId;
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