package com.spring.Imuseum.qnaBoard.dao;

import java.util.List;

import com.spring.Imuseum.qnaBoard.QnaBoardMenuVO;
import com.spring.Imuseum.qnaBoard.QnaBoardVO;

public interface QnaBoardMenuDAO {
	
	List<QnaBoardMenuVO> getMenu();

	void insertQnaBoard(QnaBoardVO qbvo);
}
