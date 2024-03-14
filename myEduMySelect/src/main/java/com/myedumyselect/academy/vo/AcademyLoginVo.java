package com.myedumyselect.academy.vo;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class AcademyLoginVo {
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

    @Builder
    public AcademyLoginVo(String academyId, int memberTypeId, String academyNumber, LocalDateTime academyJoinDate,
                     String academyPasswd, String academyName, String academyGuAddress, String academyDongAddress,
                     String academyRoadAddress, String academyPhone, String academyManagerName, String academyManagerEmail,
                     String academyManagerPhone, String academyTargetGrade, String academyTargetSubject, String academyKeyword1,
                     String academyKeyword2, String academyKeyword3, String academyKeyword4, String academyKeyword5,
                     String academyFee, LocalDateTime academyPasswdChangeDate, Integer academyLoginFailCount,
                     LocalDateTime academyAccountBannedDate) {
       this.academyId = academyId;
       this.memberTypeId = memberTypeId;
       this.academyNumber = academyNumber;
       this.academyJoinDate = academyJoinDate;
       this.academyPasswd = academyPasswd;
       this.academyName = academyName;
       this.academyGuAddress = academyGuAddress;
       this.academyDongAddress = academyDongAddress;
       this.academyRoadAddress = academyRoadAddress;
       this.academyPhone = academyPhone;
       this.academyManagerName = academyManagerName;
       this.academyManagerEmail = academyManagerEmail;
       this.academyManagerPhone = academyManagerPhone;
       this.academyTargetGrade = academyTargetGrade;
       this.academyTargetSubject = academyTargetSubject;
       this.academyKeyword1 = academyKeyword1;
       this.academyKeyword2 = academyKeyword2;
       this.academyKeyword3 = academyKeyword3;
       this.academyKeyword4 = academyKeyword4;
       this.academyKeyword5 = academyKeyword5;
       this.academyFee = academyFee;
       this.academyPasswdChangeDate = academyPasswdChangeDate;
       this.academyLoginFailCount = academyLoginFailCount;
       this.academyAccountBannedDate = academyAccountBannedDate;
    }
}