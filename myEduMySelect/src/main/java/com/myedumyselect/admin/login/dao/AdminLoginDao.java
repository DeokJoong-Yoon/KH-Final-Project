package com.myedumyselect.admin.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.myedumyselect.admin.login.vo.AdminLoginVO;

@Mapper
public interface AdminLoginDao {
	public AdminLoginVO loginProcess(AdminLoginVO login);
}
