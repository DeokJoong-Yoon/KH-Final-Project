package com.myedumyselect.commonboard.notice.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myedumyselect.common.file.FileUploadUtil;
import com.myedumyselect.commonboard.notice.dao.NoticeBoardDAO;
import com.myedumyselect.commonboard.notice.vo.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardDAO noticeBoardDAO;

	@Override
	public List<NoticeBoardVO> boardList(NoticeBoardVO noticeBoardVO) {
		List<NoticeBoardVO> list = null;
		list = noticeBoardDAO.boardList(noticeBoardVO);
		return list;
	}

	@Override
	public int boardListCnt(NoticeBoardVO noticeBoardVO) {
		return noticeBoardDAO.boardListCnt(noticeBoardVO);
	}

	@Override
	public int boardInsert(NoticeBoardVO noticeBoardVO) throws IOException {
		int result = 0;
		if (noticeBoardVO.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(noticeBoardVO.getFile(), "board"); // board_1658205347_cat.jpg
			noticeBoardVO.setCommonFile(fileName);
		}
		result = noticeBoardDAO.boardInsert(noticeBoardVO);
		return result;
		
	}

	@Override
	public NoticeBoardVO boardDetail(NoticeBoardVO noticeBoardVO) {
		noticeBoardDAO.readCntUpdate(noticeBoardVO);

		NoticeBoardVO detail = noticeBoardDAO.boardDetail(noticeBoardVO);
		if (detail != null) {
			detail.setCommonContent(detail.getCommonContent().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	@Override
	public int boardDelete(NoticeBoardVO noticeBoardVO) {
		int result = 0;
		if (!noticeBoardVO.getCommonFile().isEmpty()) { // boardFile 필드의 값이 null 이거나 "" 아니면 (이미지 파일이 존재하면)
			FileUploadUtil.fileDelete(noticeBoardVO.getCommonFile());
		}
		result = noticeBoardDAO.boardDelete(noticeBoardVO);
		return result;
	}

	@Override
	public NoticeBoardVO updateForm(NoticeBoardVO noticeBoardVO) {
		NoticeBoardVO updateData = null;
		updateData = noticeBoardDAO.boardDetail(noticeBoardVO);
		return updateData;
	}

	@Override
	public int boardUpdate(NoticeBoardVO noticeBoardVO) throws Exception {
		int result = 0;
		if (!noticeBoardVO.getFile().isEmpty()) { // 새롭게 업로드할 파일이 존재하면
			if (!noticeBoardVO.getCommonFile().isEmpty()) { // 기존 파일이 존재하면
				FileUploadUtil.fileDelete(noticeBoardVO.getCommonFile());
			}

			String fileName = FileUploadUtil.fileUpload(noticeBoardVO.getFile(), "board");
			noticeBoardVO.setCommonFile(fileName);
		}
		result = noticeBoardDAO.boardUpdate(noticeBoardVO);
		return result;
	}

}
