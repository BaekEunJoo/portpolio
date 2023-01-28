package com.spring.Imuseum.qnaBoard.dao;

import com.spring.Imuseum.qnaBoard.QnaFileVO;

public interface QnaFileDAO {

	Integer getFileIdx(String uploadfile);
	void insertFileToQna(QnaFileVO qfvo);
	QnaFileVO getFileInfo(int fileIdx);

}
