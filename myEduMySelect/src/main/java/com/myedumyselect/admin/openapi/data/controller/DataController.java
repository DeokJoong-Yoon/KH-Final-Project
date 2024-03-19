package com.myedumyselect.admin.openapi.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.admin.login.vo.AdminLoginVO;
import com.myedumyselect.admin.openapi.data.service.DataService;

import jakarta.servlet.http.HttpSession;
import lombok.Setter;

@RestController
@RequestMapping("/data/*")
public class DataController {

	@Setter(onMethod_ = @Autowired)
	private DataService dataService;

	@GetMapping(value = "/insertAcademySource", produces = "application/json; charset=UTF-8")
	public String insertAcademySource(HttpSession session) throws Exception {
//		AdminLoginVO adminLoginVO = (AdminLoginVO) session.getAttribute("adminLogin");
//		if (adminLoginVO == null) {
//			return "redirect:/admin/login";
//		}
		dataService.deleteAcademySourceList();
		int listTotalCount = dataService.listTotalCount();
		dataService.insertAcademySourceList(listTotalCount);

		return "listTotalCount";
	}

	@GetMapping(value = "/getAcademySourceCount", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getAcademySourceCount() throws Exception {
		int totalCount = dataService.listTotalCount();
		int currCount = dataService.listCurrCount();

		return "[" + totalCount + ", " + currCount + "]";
	}

}
