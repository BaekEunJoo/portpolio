package com.spring.Imuseum.qnaBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.qnaBoard.QnaBoardMenuService;
import com.spring.Imuseum.qnaBoard.QnaBoardMenuVO;
import com.spring.Imuseum.qnaBoard.QnaBoardVO;
import com.spring.Imuseum.qnaBoard.dao.QnaBoardMenuDAO;

@Service("QnaBoardMenuService")
public class QnaBoardMenuImpl implements QnaBoardMenuService{

	@Autowired
	private QnaBoardMenuDAO menuDAO;

	@Override
	public List<QnaBoardMenuVO> getMenu() {
		return menuDAO.getMenu();
	}

	@Override
	public void insertQnaBoard(QnaBoardVO qbvo) {
		menuDAO.insertQnaBoard(qbvo);
	}


	


}
