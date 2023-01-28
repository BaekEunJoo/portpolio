package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.addrVO;
import com.mystudy.model.VO.userVO;

public class addAddrCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/controller?type=deladdr";
		String delName = request.getParameter("delName");
		String delGetter = request.getParameter("delGetter");
		String delPhone = request.getParameter("delPhone");
		String delAddr = request.getParameter("delAddr");
		
		userVO vo = (userVO)request.getSession().getAttribute("user");
		
		int userNo = vo.getUserNo();
		System.out.println("userNo :" + userNo);
		
		addrVO ve = new addrVO(delName, delGetter, delPhone, delAddr, userNo);
		
		System.out.println(ve);
		
		DAO.insertAddr(ve);
		
		return path;


	}

}
