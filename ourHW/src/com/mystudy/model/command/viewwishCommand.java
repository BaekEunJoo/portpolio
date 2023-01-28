package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.ProductVO;
import com.mystudy.model.VO.userVO;

public class viewwishCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "Mypage/wishlist.jsp";
		userVO vo = (userVO)(request.getSession().getAttribute("user"));
		String userId = vo.getUserId();
		
		List<ProductVO> list = null;
		list = DAO.viewwishList(userId);
		
		for (ProductVO ve: list) {
			System.out.println(ve);
		}
		
		request.setAttribute("wish", list);
		
		
		return path;
		
	}

}
