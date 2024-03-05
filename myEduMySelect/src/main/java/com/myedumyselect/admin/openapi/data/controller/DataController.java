package com.myedumyselect.admin.openapi.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.myedumyselect.admin.openapi.data.service.DataService;
import lombok.Setter;

@RestController
@RequestMapping("/data/*")
public class DataController {

	@Setter(onMethod_ = @Autowired)
	private DataService dataService;

	@GetMapping(value = "/insertAcademySource", produces = "application/json; charset=UTF-8")
	public String insertAcademySource() throws Exception {
		int listTotalCount = dataService.listTotalCount();
		dataService.insertAcademySourceList(listTotalCount);

		return "listTotalCount";
	}
}
