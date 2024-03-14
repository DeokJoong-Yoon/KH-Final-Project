package com.myedumyselect.common.file;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

public class FileUploadUtil {

	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}

	public static String fileUpload(MultipartFile file, String fileName) throws IOException {

		String real_name = null;
		String org_name = file.getOriginalFilename();

		if (org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			String docRoot = "C:/uploadStorage/" + fileName;
			makeDir(docRoot);

			File fileAdd = new File(docRoot + "/" + real_name);

			file.transferTo(fileAdd);
		}
		return real_name;
	}

	public static void fileDelete(String fileName) {
		boolean result = false;
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		String docRoot = "C:/uploadStorage/" + dirName;
		File fileDelete = new File(docRoot + "/" + fileName);

		if (fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		System.out.println("파일 삭제 여부 : " + result);
	}
}
