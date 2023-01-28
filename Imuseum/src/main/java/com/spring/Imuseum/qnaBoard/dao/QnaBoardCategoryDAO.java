package com.spring.Imuseum.qnaBoard.dao;

import java.util.List;

import com.spring.Imuseum.qnaBoard.QnaBoardCategoryVO;

public interface QnaBoardCategoryDAO {
	
	List<QnaBoardCategoryVO> getCategory(QnaBoardCategoryVO cvo);
}
