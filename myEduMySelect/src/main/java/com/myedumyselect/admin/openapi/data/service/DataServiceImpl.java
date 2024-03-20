package com.myedumyselect.admin.openapi.data.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myedumyselect.admin.openapi.data.dao.AcademySourceDAO;
import com.myedumyselect.admin.openapi.data.vo.AcademySourceVO;
import com.myedumyselect.admin.openapi.data.vo.OpenApiDTO;
import com.myedumyselect.common.openapi.URLConnectUtil;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DataServiceImpl implements DataService {

	private final static String KEY = "446f765142796b6435314753745172";

	@Autowired
	private AcademySourceDAO academySourceDAO;

	@Override
	public int listTotalCount() throws Exception {
		// http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/1/1/
		StringBuffer site = new StringBuffer("http://openapi.seoul.go.kr:8088/");
		site.append(KEY);
		site.append("/json/neisAcademyInfo/1/1/");

		OpenApiDTO openApi = new OpenApiDTO(site.toString(), "GET");
		StringBuffer result = URLConnectUtil.openAPIData(openApi);

		// result를 JSON으로 파싱
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode rootNode = objectMapper.readTree(result.toString());

		// 특정 필드의 값을 추출
		int listTotalCount = rootNode.path("neisAcademyInfo").path("list_total_count").asInt();

		return listTotalCount;
	}

	@Override
	public int insertAcademySourceList(int listTotalCount) throws Exception {
		List<AcademySourceVO> resultList = new ArrayList<>();
		int result = 0;
		String baseUrl = "http://openapi.seoul.go.kr:8088/";
		baseUrl += KEY;
		baseUrl += "/json/neisAcademyInfo/";
		int maxGetListCount = 500;
		listTotalCount = 2000;
		int cycleCount = listTotalCount / maxGetListCount;
		int startIndex = 1;
		int endIndex = maxGetListCount;
		for (int i = 1; i <= cycleCount; ++i) {
			String url = baseUrl + startIndex + "/" + endIndex + "/";
			startIndex = endIndex + 1;
			endIndex += maxGetListCount;
			OpenApiDTO openApi = new OpenApiDTO(url, "GET");
			StringBuffer currentResult = URLConnectUtil.openAPIData(openApi);

			if (currentResult == null || currentResult.toString().isEmpty()) {
				break; // 데이터 없으면 종료
			}

			List<AcademySourceVO> academyList = mapJsonToAcademyList(currentResult.toString());
			
			for(AcademySourceVO asv : academyList) {
				result += academySourceDAO.insertAcademySource(asv);
				try {
					Thread.sleep(50);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	public List<AcademySourceVO> mapJsonToAcademyList(String jsonData) {
		List<AcademySourceVO> academyList = new ArrayList<>();

		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JsonNode rootNode = objectMapper.readTree(jsonData);
			JsonNode rowNode = rootNode.path("neisAcademyInfo").path("row");

			for (JsonNode academyNode : rowNode) {
				AcademySourceVO academy = new AcademySourceVO();

				academy.setAcademyNumber(academyNode.path("ACA_ASNUM").asText());
				academy.setAcademyGuAddress(academyNode.path("ADMST_ZONE_NM").asText());
				academy.setAcademyType(academyNode.path("ACA_INSTI_SC_NM").asText());
				academy.setAcademyName(academyNode.path("ACA_NM").asText());
				academy.setAcademyRoadAddress(academyNode.path("FA_RDNMA").asText());
				academy.setAcademyDongAddress(academyNode.path("FA_RDNDA").asText());
				academy.setAcademyFieldName(academyNode.path("REALM_SC_NM").asText());
				academy.setAcademyCurriculumSeriesName(academyNode.path("LE_ORD_NM").asText());
				academy.setAcademyCurriculumListName(academyNode.path("LE_CRSE_LIST_NM").asText());
				academy.setAcademyCurriculumName(academyNode.path("LE_CRSE_NM").asText());
				academy.setAcademyTotalCapacity(academyNode.path("TOFOR_SMTOT").asInt());
				academy.setAcademyTotalCapacityPerDay(academyNode.path("DTM_RCPTN_ABLTY_NMPR_SMTOT").asInt());
				academy.setAcademyTuitionPerPerson(academyNode.path("PSNBY_THCC_CNTNT").asText());
				academy.setAcademyTuitionOpenStatus(academyNode.path("THCC_OTHBC_YN").asText());
				academy.setAcademyDormitoryAcademyStatus(academyNode.path("BRHS_ACA_YN").asText());
				academy.setAcademyRoadPostalNumber(academyNode.path("FA_RDNZC").asText());
				academy.setAcademyRegisterStatusName(academyNode.path("REG_STTUS_NM").asText());
				academy.setAcademyRegisterDate(academyNode.path("REG_YMD").asText());
				academy.setAcademyClosedStartDate(academyNode.path("CAA_BEGIN_YMD").asText());
				academy.setAcademyClosedEndDate(academyNode.path("CAA_END_YMD").asText());
				academy.setAcademyOpenDate(academyNode.path("ESTBL_YMD").asText());
				academy.setAcademyLoadingDateTime(academyNode.path("LOAD_DTM").asText());

				academyList.add(academy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return academyList;
	}

	private AcademySourceVO mapJsonToAcademySource(String json) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode rootNode = objectMapper.readTree(json);

		JsonNode rowNode = rootNode.path("neisAcademyInfo").path("row");
		if (rowNode.isArray() && rowNode.size() > 0) {
			JsonNode firstRow = rowNode.get(0);

			AcademySourceVO academySourceVO = new AcademySourceVO();
			academySourceVO.setAcademyNumber(firstRow.path("ACA_ASNUM").asText());
			academySourceVO.setAcademyGuAddress(firstRow.path("ADMST_ZONE_NM").asText());
			academySourceVO.setAcademyType(firstRow.path("ACA_INSTI_SC_NM").asText());
			academySourceVO.setAcademyName(firstRow.path("ACA_NM").asText());
			academySourceVO.setAcademyRoadAddress(firstRow.path("FA_RDNMA").asText());
			academySourceVO.setAcademyDongAddress(firstRow.path("FA_RDNDA").asText());
			academySourceVO.setAcademyFieldName(firstRow.path("REALM_SC_NM").asText());
			academySourceVO.setAcademyCurriculumSeriesName(firstRow.path("LE_ORD_NM").asText());
			academySourceVO.setAcademyCurriculumListName(firstRow.path("LE_CRSE_LIST_NM").asText());
			academySourceVO.setAcademyCurriculumName(firstRow.path("LE_CRSE_NM").asText());
			academySourceVO.setAcademyTotalCapacity(firstRow.path("TOFOR_SMTOT").asInt());
			academySourceVO.setAcademyTotalCapacityPerDay(firstRow.path("DTM_RCPTN_ABLTY_NMPR_SMTOT").asInt());
			academySourceVO.setAcademyTuitionPerPerson(firstRow.path("PSNBY_THCC_CNTNT").asText());
			academySourceVO.setAcademyTuitionOpenStatus(firstRow.path("THCC_OTHBC_YN").asText());
			academySourceVO.setAcademyDormitoryAcademyStatus(firstRow.path("BRHS_ACA_YN").asText());
			academySourceVO.setAcademyRoadPostalNumber(firstRow.path("FA_RDNZC").asText());
			academySourceVO.setAcademyRegisterStatusName(firstRow.path("REG_STTUS_NM").asText());
			academySourceVO.setAcademyRegisterDate(firstRow.path("REG_YMD").asText());
			academySourceVO.setAcademyClosedStartDate(firstRow.path("CAA_BEGIN_YMD").asText());
			academySourceVO.setAcademyClosedEndDate(firstRow.path("CAA_END_YMD").asText());
			academySourceVO.setAcademyOpenDate(firstRow.path("ESTBL_YMD").asText());
			academySourceVO.setAcademyLoadingDateTime(firstRow.path("LOAD_DTM").asText());

			return academySourceVO;
		}

		return null; // 빈 값 반환 또는 예외 처리
	}

//	@Override
//	public List<AcademySourceVO> insertAcademySourceList(int listTotalCount) throws Exception {
//	    List<AcademySourceVO> resultList = new ArrayList<>();
//	    String baseUrl = "http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/";
//
//	    for (int curIndex = 25000; curIndex <= listTotalCount; curIndex++) {
//	        String url = baseUrl + curIndex + "/" + curIndex + "/";
//	        OpenApiDTO openApi = new OpenApiDTO(url, "GET");
//	        StringBuffer currentResult = URLConnectUtil.openAPIData(openApi);
//
//	        if (currentResult == null || currentResult.toString().isEmpty()) {
//	            break; // 데이터 없으면 종료
//	        }
//
//	        AcademySourceVO academySourceVO = mapJsonToAcademySource(currentResult.toString());
//	        if (academySourceVO != null) {
//	            resultList.add(academySourceVO);
//	            academySourceDAO.insertAcademySource(academySourceVO);
//	        }
//
//	        // 1000 milliseconds = 1 second
////	        try {
////	            Thread.sleep(10);
////	        } catch (InterruptedException e) {
////	            e.printStackTrace();
////	        }
//	    }
//	    
//	    return resultList;
//	}
//	
//	private AcademySourceVO mapJsonToAcademySource(String json) throws Exception {
//		ObjectMapper objectMapper = new ObjectMapper();
//		JsonNode rootNode = objectMapper.readTree(json);
//
//		JsonNode rowNode = rootNode.path("neisAcademyInfo").path("row");
//		if (rowNode.isArray() && rowNode.size() > 0) {
//			JsonNode firstRow = rowNode.get(0);
//
//			AcademySourceVO academySourceVO = new AcademySourceVO();
//			academySourceVO.setAcademyNumber(firstRow.path("ACA_ASNUM").asText());
//			academySourceVO.setAcademyGuAddress(firstRow.path("ADMST_ZONE_NM").asText());
//			academySourceVO.setAcademyType(firstRow.path("ACA_INSTI_SC_NM").asText());
//			academySourceVO.setAcademyName(firstRow.path("ACA_NM").asText());
//			academySourceVO.setAcademyRoadAddress(firstRow.path("FA_RDNMA").asText());
//			academySourceVO.setAcademyDongAddress(firstRow.path("FA_RDNDA").asText());
//			academySourceVO.setAcademyFieldName(firstRow.path("REALM_SC_NM").asText());
//			academySourceVO.setAcademyCurriculumSeriesName(firstRow.path("LE_ORD_NM").asText());
//			academySourceVO.setAcademyCurriculumListName(firstRow.path("LE_CRSE_LIST_NM").asText());
//			academySourceVO.setAcademyCurriculumName(firstRow.path("LE_CRSE_NM").asText());
//			academySourceVO.setAcademyTotalCapacity(firstRow.path("TOFOR_SMTOT").asInt());
//			academySourceVO.setAcademyTotalCapacityPerDay(firstRow.path("DTM_RCPTN_ABLTY_NMPR_SMTOT").asInt());
//			academySourceVO.setAcademyTuitionPerPerson(firstRow.path("PSNBY_THCC_CNTNT").asText());
//			academySourceVO.setAcademyTuitionOpenStatus(firstRow.path("THCC_OTHBC_YN").asText());
//			academySourceVO.setAcademyDormitoryAcademyStatus(firstRow.path("BRHS_ACA_YN").asText());
//			academySourceVO.setAcademyRoadPostalNumber(firstRow.path("FA_RDNZC").asText());
//			academySourceVO.setAcademyRegisterStatusName(firstRow.path("REG_STTUS_NM").asText());
//			academySourceVO.setAcademyRegisterDate(firstRow.path("REG_YMD").asText());
//			academySourceVO.setAcademyClosedStartDate(firstRow.path("CAA_BEGIN_YMD").asText());
//			academySourceVO.setAcademyClosedEndDate(firstRow.path("CAA_END_YMD").asText());
//			academySourceVO.setAcademyOpenDate(firstRow.path("ESTBL_YMD").asText());
//			academySourceVO.setAcademyLoadingDateTime(firstRow.path("LOAD_DTM").asText());
//
//			return academySourceVO;
//		}
//
//		return null; // 빈 값 반환 또는 예외 처리
//	}

	@Override
	public int listCurrCount() {
		return academySourceDAO.getCurrAcademySource();
	}

	@Override
	public int deleteAcademySourceList() {
		return academySourceDAO.deleteAcademySourceList();
	}
}
