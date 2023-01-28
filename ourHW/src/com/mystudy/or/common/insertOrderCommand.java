package com.mystudy.or.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.VO.userVO;
import com.mystudy.or.VO.orderDetailVO;
import com.mystudy.or.VO.productOptionVo;
import com.mystudy.or.dao.DAO;

public class insertOrderCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		userVO uvo = (userVO) request.getSession().getAttribute("user");
		System.out.println("userVO : " + uvo);
		String userId = uvo.getUserId();
		orderDetailVO vo = null;
		String[] cartNoString = request.getParameterValues("cartNo");
		int cartNo = 0;
		int no = DAO.orderNoSelect();
		System.out.println("no : " + no);
		
		for (int i = 0; i < cartNoString.length; i++) {
			System.out.println("command 도착!!");
			
			cartNo = Integer.parseInt(cartNoString[i]);
			System.out.println("cartNo : " + cartNo);
			vo = DAO.selectCartList(cartNo);
			
			vo.setOrderNo(no);
			System.out.println("vo : " + vo);
			
			DAO.insertOrder(vo);
			
			
			int optionCount = DAO.optionCountSelect(vo) - vo.getAmount();
			System.out.println("optionCount : " + optionCount);
			
			vo.setOptionCount(optionCount);
			
			DAO.optionCountUpdate(vo);
			
			vo.setUserId(userId);
		}
		
		DAO.orderMain(vo);
		DAO.deleteCart(userId);
		
		
		
		String path="/main/main.jsp";
		
		return path;
	}
	
	

}
