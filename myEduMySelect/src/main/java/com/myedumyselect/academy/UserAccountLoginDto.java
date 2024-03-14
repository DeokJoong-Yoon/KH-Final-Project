package com.myedumyselect.academy;

import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class UserAccountLoginDto {
	@NotBlank
	private String userAccountType;
	@NotBlank
	private String academyId;
	@NotBlank
	private String academyPasswd;
	
	
}