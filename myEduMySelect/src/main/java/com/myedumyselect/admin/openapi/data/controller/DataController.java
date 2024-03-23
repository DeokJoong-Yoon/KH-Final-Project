package com.myedumyselect.admin.openapi.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.myedumyselect.admin.login.vo.AdminLoginVO;
import com.myedumyselect.admin.openapi.data.service.DataService;

import lombok.Setter;

@RestController
@RequestMapping("/data/*")
public class DataController {

	@Setter(onMethod_ = @Autowired)
	private DataService dataService;

	@GetMapping(value = "/insertAcademySource", produces = "application/json; charset=UTF-8")
	public String insertAcademySource(
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) throws Exception {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		dataService.deleteAcademySourceList();
		int listTotalCount = dataService.listTotalCount();
		dataService.insertAcademySourceList(listTotalCount);

		return "listTotalCount";
	}

	@GetMapping(value = "/getAcademySourceCount", produces = MediaType.APPLICATION_JSON_VALUE)
	public String getAcademySourceCount(
			@SessionAttribute(name = "adminLogin", required = false) AdminLoginVO adminLoginVO) throws Exception {
		if (adminLoginVO == null) {
			return "redirect:/admin/login";
		}
		int totalCount = dataService.listTotalCount();
		int currCount = dataService.listCurrCount();

		return "[" + totalCount + ", " + currCount + "]";
	}

}
