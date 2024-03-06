package com.myedumyselect.admin.login.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.Setter;

@SpringBootTest
public class AdminLoginDaoTests {

	@Setter(onMethod_ = @Autowired)
	private AdminLoginDao academySourceDAO;
	
	public void academySourceList() {
		
	}
}
