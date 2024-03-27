package com.myedumyselect.common.file;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {

	// 파일 업로드 메서드
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if (fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}

	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		String real_name = null;

		// MultipartFile 클래스의 getFile() 메소드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename();

		// 파일명 변경 (중복되지 않게
		if (org_name != null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
//			String docRoot = "C:/uploadStorage/" + fileName;
			String docRoot = "\\\\192.168.30.205/uploadStorage/" + fileName;
			makeDir(docRoot);

			File fileAdd = new File(docRoot + "/" + real_name);

			file.transferTo(fileAdd);
		}
		return real_name;
	}

	// 파일 삭제 메소드
	public static void fileDelete(String fileName) throws IOException {

		String dirName = fileName.substring(0, fileName.indexOf("_")); // 삭제할 파일이 존재하는 폴더 얻기
		String docRoot = "\\\\\\\\192.168.30.205/uploadStorage/" + dirName;
		File fileDelete = new File(docRoot + "/" + fileName);

		if (fileDelete.exists() && fileDelete.isFile()) {
			fileDelete.delete();
		}
	}
}
