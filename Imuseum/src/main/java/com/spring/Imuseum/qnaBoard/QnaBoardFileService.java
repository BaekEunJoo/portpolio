package com.spring.Imuseum.qnaBoard;


public interface QnaBoardFileService {
	void insertFileToQnaBoard(QnaFileVO qfvo);
	QnaFileVO getFileInfo(int fileIdx);
	Integer getFileIdx(String filename);
}
