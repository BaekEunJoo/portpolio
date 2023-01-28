package com.spring.Imuseum.qnaBoard.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.qnaBoard.QnaBoardCategoryService;
import com.spring.Imuseum.qnaBoard.QnaBoardCategoryVO;
import com.spring.Imuseum.qnaBoard.dao.QnaBoardCategoryDAO;

@Service("QnaBoardCategoryService")
public class QnaBoardCategoryImpl implements QnaBoardCategoryService{

	@Autowired
	private QnaBoardCategoryDAO categoryDAO;

	@Override
	public List<QnaBoardCategoryVO> getCategory(QnaBoardCategoryVO cvo) {
		return categoryDAO.getCategory(cvo);
	}
	


}
