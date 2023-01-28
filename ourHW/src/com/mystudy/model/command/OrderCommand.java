package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.orderVO;
import com.mystudy.model.VO.userVO;

public class OrderCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "Mypage/orderlist.jsp";
		
		userVO vo = (userVO)request.getSession().getAttribute("user");
		String userId = vo.getUserId();
		System.out.println("userId = " + userId);
		
		List<orderVO> list = null;
		list = DAO.vieworderList(userId);
		
		for (orderVO ve : list) {
			System.out.println(ve);
		}
		
		request.setAttribute("order", list);

		return path;
	}

}
