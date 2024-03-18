package com.myedumyselect.common.like;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class LikeVO {

	private int commonNo;
	private String likeMemberId = "";
	private int likeCheck = 0;
	private int likeId;
}
