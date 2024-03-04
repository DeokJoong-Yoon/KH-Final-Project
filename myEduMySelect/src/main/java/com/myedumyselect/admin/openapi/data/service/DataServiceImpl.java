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
public class DataServiceImpl implements DataService {

	@Autowired
	private AcademySourceDAO academySourceDAO;

	@Override
	public int listTotalCount() throws Exception {
		// http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/1/1/
		StringBuffer site = new StringBuffer("http://openapi.seoul.go.kr:8088/");
		site.append("446f765142796b6435314753745172");
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
	public List<AcademySourceVO> insertAcademySourceList(int listTotalCount) throws Exception {
		int curIndex = 1;
		// http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/3/3/
		StringBuffer site = new StringBuffer("http://openapi.seoul.go.kr:8088/");
		site.append("446f765142796b6435314753745172");
		site.append("/json/neisAcademyInfo/");
		OpenApiDTO openApi = null;
		List<AcademySourceVO> resultList = new ArrayList<>();

		StringBuffer indexSite = new StringBuffer(
				"http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/");
		while (curIndex <= listTotalCount) {
			indexSite.append(curIndex + "/" + curIndex + "/");
			openApi = new OpenApiDTO(indexSite.toString(), "GET");
			StringBuffer currentResult = URLConnectUtil.openAPIData(openApi);

			// 현재 결과를 VO에 매핑
			AcademySourceVO academySourceVO = mapJsonToAcademySource(currentResult.toString());

			// VO를 리스트에 추가
			resultList.add(academySourceVO);
			academySourceDAO.insertAcademySource(academySourceVO);
			++curIndex;
			try {
				Thread.sleep(500); // 1000 milliseconds = 1 second
			} catch (InterruptedException e) {
				// InterruptedException 처리
				e.printStackTrace();
			}
			indexSite = new StringBuffer(
					"http://openapi.seoul.go.kr:8088/446f765142796b6435314753745172/json/neisAcademyInfo/");
		}

//		academySourceDAO.insertAcademySourceList(resultList);
		return resultList;
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

}
