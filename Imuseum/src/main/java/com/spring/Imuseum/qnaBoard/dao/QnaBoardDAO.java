package com.spring.Imuseum.qnaBoard.dao;

import java.util.List;

import com.spring.Imuseum.qnaBoard.QnaAnswerVO;
import com.spring.Imuseum.qnaBoard.QnaBoardVO;
import com.spring.Imuseum.qnaBoard.QnaPagination;

public interface QnaBoardDAO {
	void insertQnaBoard(QnaBoardVO qbvo);
	void insertQnaBoardWithoutFile(QnaBoardVO qbvo);
	
	int getTotalCountFromQnaBoard(String id);
	List<QnaBoardVO> getQnaBoardListById(QnaPagination qpvo);
	
	int getTotalCountByStatus(String status);
	List<QnaBoardVO> getQnaBoardList(QnaPagination qpvo);
	
	QnaBoardVO getQnaBoard(String qnaIdx);
	
	QnaAnswerVO getQnaAnswer(int qnaIdx);
	
	void insertQnaAnswer(QnaAnswerVO qavo);
	
	void updateStatus(int qnaIdx);
	
	void deleteQnaBoard(int qnaIdx);
	
}
