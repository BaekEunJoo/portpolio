package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class finduserIdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "signup/founduserId.jsp";
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		userVO vo = new userVO("", name, phone, email, "");
		String userId = "";
		System.out.println("vo : " + vo);
		if (phone == "") {
			userId = DAO.finduserId(vo);
		}
		if (email == "") {
			userId = DAO.finduserId2(vo);
		}
			
		if (userId == null) {
			path = "signup/fail.jsp";
		} else {
	
		System.out.println("userId : " + userId);
		System.out.println("userId.length() : " + userId.length());
			
		if (userId.length()>=4) {
		
		String fixeduserId = userId.substring(0, 3);
		System.out.println(fixeduserId);
		
		int cnt = userId.length() - 3;
		
		for (int i=0; i<cnt; i++) {
			fixeduserId += "*";
		}
		System.out.println("fixeduserId : " + fixeduserId);
		
		request.setAttribute("userId", fixeduserId);
		
		} else {
			request.setAttribute("userId", userId);
			
		}
		
		request.setAttribute("name", name);
		request.setAttribute("email", email);
		request.setAttribute("phone", phone);
		
		}
		return path;
	}

}
