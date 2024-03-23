package com.myedumyselect.personal.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.personal.dao.PersonalLoginDao;
import com.myedumyselect.personal.vo.PersonalLoginVO;

import lombok.Setter;

@Service
public class PersonalLoginServiceImpl implements PersonalLoginService {

	@Setter(onMethod_ = @Autowired)
	private PersonalLoginDao personalLoginDao;

	/// 로그인
	@Override
	public PersonalLoginVO loginProcess(PersonalLoginVO login) {
		PersonalLoginVO personalLogin = personalLoginDao.loginProcess(login);
		return personalLogin;
	}

	// 로그인 실패 횟수
	@Override
	public int updatePersonalLoginFailCount(PersonalLoginVO login) {
		return personalLoginDao.updatePersonalLoginFailCount(login);
	}

	@Override
	public int updateAccountBannedDate(String personalId, Date bannedDate) {
		return personalLoginDao.updateAccountBannedDate(personalId, bannedDate);
	}

	// 개인회원 ID 중복체크
	@Override
	public int idCheck(String personalId) {
		int cnt = 0;
		try {
			cnt = personalLoginDao.idCheck(personalId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	// 개인회원 이메일 중복체크
	@Override
	public int emailCheck(String personalEmail) {
		int cnt = 0;
		try {
			cnt = personalLoginDao.emailCheck(personalEmail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	// 비밀번호 변경
	@Override
	public int updatePersonalPasswd(PersonalLoginVO checkPassword) {
		int result = 0;
		result = personalLoginDao.updatePersonalPasswd(checkPassword);
		return result;
	}

	// 회원가입
	@Override
	public int personalInsert(PersonalLoginVO login) {
		int result = 0;
		result = personalLoginDao.personalInsert(login);
		return result;
	}

	// 마이페이지
	@Override
	public PersonalLoginVO personalMyPage(PersonalLoginVO login) {
		PersonalLoginVO personalLogin = personalLoginDao.loginProcess(login);
		return personalLogin;

	}

	// 마이페이지 정보수정
	@Override
	public int personalUpdate(PersonalLoginVO login) {
		int result = 0;
		result = personalLoginDao.personalUpdate(login);
		return result;
	}

}
