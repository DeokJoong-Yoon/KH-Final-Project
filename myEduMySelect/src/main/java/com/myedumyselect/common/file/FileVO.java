package com.myedumyselect.common.file;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {

	private int commonNo;
	private int fileNo;
	private String filePath;
	private String fileName;
}
