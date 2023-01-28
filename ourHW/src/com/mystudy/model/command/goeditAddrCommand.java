package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class goeditAddrCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "Mypage/goeditAddr.jsp";
		int delNo = Integer.parseInt(request.getParameter("delNo"));
		System.out.println("delNo : " + delNo);
		
		request.getSession().setAttribute("delNo", delNo);
		return path;
	}

}
