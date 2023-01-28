package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.ProductVO;

public class searchCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "main/searchresult.jsp";
		
		String search = request.getParameter("search");
		System.out.println("검색할 사항 : " + search);
		
		List<ProductVO> list = DAO.searchCategory(search);
		if (list.isEmpty()) {
			list = DAO.searchProduct(search);
		}
		
		
		for (ProductVO vo : list) {
			System.out.println(vo);
		}
		
		request.setAttribute("search", list);
		
		return path;
	}

}
