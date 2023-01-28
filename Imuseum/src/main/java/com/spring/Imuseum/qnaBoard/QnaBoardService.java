package com.spring.Imuseum.qnaBoard;

import java.util.List;

public interface QnaBoardService {
	List<QnaBoardVO> getQnaBoardListById(QnaPagination qpvo);
	
	List<QnaBoardVO> getQnaBoardList(QnaPagination qpvo);
	
	int getQnaBoardCount(String id);
	
	QnaPaging calculatePage(String id,String cPage);
	
	QnaPagination getMapperKeyword(String id, int begin, int end);
	
	QnaBoardVO getQnaBoard(String qnaIdx);
	
	QnaAnswerVO getQnaAnswer(int qnaIdx);
	
	void insertQnaBoard(QnaBoardVO qbvo);
	
	void insertQnaReply(QnaAnswerVO qavo);
	
	void updateStatus(int qnaIdx);
	
	void deleteQnaBoard(int qnaIdx);
}
