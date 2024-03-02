package com.myedumyselect.academy.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AcademyVo {
	private int academyNumber;
	private String academyName;
	private String academy_gu_address;
	private String academy_dong_address;
	private String academy_road_address;
	
	
}
