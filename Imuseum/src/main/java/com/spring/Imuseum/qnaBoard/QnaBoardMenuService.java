package com.spring.Imuseum.qnaBoard;

import java.util.List;

public interface QnaBoardMenuService {

	List<QnaBoardMenuVO> getMenu();

	void insertQnaBoard(QnaBoardVO qbvo);
}
