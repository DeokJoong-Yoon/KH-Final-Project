package com.myedumyselect.admin.login.service;

import com.myedumyselect.admin.login.vo.AdminLoginVO;

public interface AdminLoginService {
	public AdminLoginVO loginProcess(AdminLoginVO login);

	public int updateAdminInfo(AdminLoginVO newAdminInfo);

	public int updateAdminPasswd(AdminLoginVO checkPassword);
}
