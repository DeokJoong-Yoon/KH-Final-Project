package com.myedumyselect.academy.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.academy.dao.AcademyLoginDao;
import com.myedumyselect.academy.vo.AcademyLoginVO;

import lombok.Setter;
 
@Service
public class AcademyLoginServiceImpl implements AcademyLoginService {

   @Setter(onMethod_ = @Autowired)
   private AcademyLoginDao academyLoginDao;


   	/// 로그인
 	@Override
 	public AcademyLoginVO loginProcess(AcademyLoginVO login) {
 		AcademyLoginVO academyLogin = academyLoginDao.loginProcess(login);
 		return academyLogin;
 	}

 	// 로그인 실패 횟수
 	@Override
 	public int updateAcademyLoginFailCount(AcademyLoginVO login) {
 		return academyLoginDao.updateAcademyLoginFailCount(login);
 	}

 	//로그인 잠금 날짜
 	@Override
 	public int updateAccountBannedDate(String academyId, Date bannedDate) {
 		return academyLoginDao.updateAccountBannedDate(academyId, bannedDate);
 	}
 
 	// 회원가입
    public int academyInsert(AcademyLoginVO login) {
       int result = 0;
       result = academyLoginDao.academyInsert(login);
       return result;
    }


   /*
   // 로그인 실패 횟수
   @Override
   public int updateacademyLoginFailCount(academyLoginVo login) {
      return academyLoginDao.updateacademyLoginFailCount(login);
   }


   @Override
   public int updateAccountBannedDate(String academyId, Date bannedDate) {
      return academyLoginDao.updateAccountBannedDate(academyId, bannedDate);
   }
   */

   // 마이페이지에 Id값을 기준으로 정보 불러올 떄
   @Override
   public AcademyLoginVO findById(String academyId) {
	  AcademyLoginVO academyLogin = academyLoginDao.findById(academyId); 
      return academyLogin;
   }
   
   // 마이페이지 정보 수정
   @Override
   public int academyUpdate(AcademyLoginVO newAcademyInfo) {      
	   return academyLoginDao.academyUpdate(newAcademyInfo);      
   }
   
   // 아이디 중복체크
   @Override
   public int checkId(String id) {
      int cnt = 0;
      try {
         cnt = academyLoginDao.checkId(id);
      } catch (Exception e) {
         e.printStackTrace();
      }
      System.out.println("cnt: " + cnt);
      return cnt;
   }
   
   // 이메일 중복체크
   @Override
   public int checkEmail(String academyManagerEmail) {       
       int cnt = 0;
       try {
           cnt = academyLoginDao.checkEmail(academyManagerEmail);
       } catch (Exception e) {
           e.printStackTrace();
       }
       System.out.println("cnt: " + cnt);
       return cnt;
   }
   
   // 사업자등록번호 중복체크
   @Override
   public AcademyLoginVO findByNumber(String academyNumber) {      
      return academyLoginDao.findByNumber(academyNumber);
   }
   
   // 비밀번호 변경
   @Override
   public int updatePasswdChangeDate(AcademyLoginVO checkPassword) {
      int result = 0;
      result = academyLoginDao.updatePasswdChangeDate(checkPassword);
      return result;
   }
   
   /*/ 사업자등록번호로 정보 조회
   @Override
   public AcademyLoginVo getAcademyInfo(String academyNumber) {
      return academyLoginDao.findByNumber(academyNumber);
   }*/

}