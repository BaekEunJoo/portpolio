package com.spring.Imuseum.qnaBoard.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.qnaBoard.QnaBoardFileService;
import com.spring.Imuseum.qnaBoard.QnaFileVO;
import com.spring.Imuseum.qnaBoard.dao.QnaFileDAO;

@Service("QnaFileService")
public class QnaFileImpl implements QnaBoardFileService{

	@Autowired
	private QnaFileDAO qnaFileDAO;
	
	@Override
	public void insertFileToQnaBoard(QnaFileVO qfvo) {
		qnaFileDAO.insertFileToQna(qfvo);
		
	}

	@Override
	public Integer getFileIdx(String filename) {
		return qnaFileDAO.getFileIdx(filename);
		
	}

	@Override
	public QnaFileVO getFileInfo(int fileIdx) {
		return qnaFileDAO.getFileInfo(fileIdx);
	}

}
