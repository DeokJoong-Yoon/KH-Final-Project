package com.myedumyselect.admin.openapi.data.controller;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myedumyselect.admin.openapi.data.service.DataService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/data/*")
@Slf4j
public class DataController {
	
	@Setter(onMethod_ = @Autowired)
	private DataService dataService;
	
	@GetMapping(value = "/academySource", produces = "application/json; charset=UTF-8")
	public String getAcademySource() throws Exception {
		log.info("Academy api start");
		int listTotalCount = dataService.listTotalCount();
		StringBuffer sb = null;
		sb = dataService.getAcademySource(listTotalCount);
		
		log.info("Academy api close");
		return "총 학원 수 : " + listTotalCount;
	}
}
