package com.myedumyselect.admin.openapi.data.service;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myedumyselect.admin.openapi.data.vo.OpenApiDTO;
import com.myedumyselect.common.openapi.URLConnectUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DataServiceImpl implements DataService {
	
	@Override
	public StringBuffer getAcademySource(int listTotalCount) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listTotalCount() throws Exception {
		// http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/1/1/
		StringBuffer site = new StringBuffer("http://openapi.seoul.go.kr:8088/");
		site.append("446f765142796b6435314753745172");
		site.append("/json/neisAcademyInfo/1/1/");
		
		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);
		log.info(result.toString());
		
        // result를 JSON으로 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(result.toString());

        // 특정 필드의 값을 추출
        int listTotalCount = rootNode.path("neisAcademyInfo").path("list_total_count").asInt();
        log.info("list_total_count: " + listTotalCount);

		return listTotalCount;
	}

}
