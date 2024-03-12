package com.myedumyselect.admin.openapi.data.vo;

import com.myedumyselect.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class AcademySourceVO extends CommonVO{

	private String academyNumber;
	private String academyGuAddress;
	private String academyType;
	private String academyName;
	private String academyRoadAddress;
	private String academyDongAddress;
	private String academyFieldName;
	private String academyCurriculumSeriesName;
	private String academyCurriculumListName;
	private String academyCurriculumName;
	private int academyTotalCapacity;
	private int academyTotalCapacityPerDay;
	private String academyTuitionPerPerson;
	private String academyTuitionOpenStatus;
	private String academyDormitoryAcademyStatus;
	private String academyRoadPostalNumber;
	private String academyRegisterStatusName;
	private String academyRegisterDate;
	private String academyClosedStartDate;
	private String academyClosedEndDate;
	private String academyOpenDate;
	private String academyLoadingDateTime;

}
