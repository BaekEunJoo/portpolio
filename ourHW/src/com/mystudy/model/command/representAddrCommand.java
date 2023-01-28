package com.mystudy.model.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class representAddrCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/controller?type=deladdr";
		
		int delNo = Integer.parseInt(request.getParameter("delNo"));
		System.out.println("delNo : " + delNo);
		userVO vo = (userVO)request.getSession().getAttribute("user");
		int userNo = vo.getUserNo();
		System.out.println("userNo : " + userNo);
		userVO ve = new userVO(delNo, userNo);
		
		DAO.representAddr(ve);
		
		
		return path;
	}

}
