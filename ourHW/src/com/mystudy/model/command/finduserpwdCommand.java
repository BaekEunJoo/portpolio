package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class finduserpwdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "";
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String userId = request.getParameter("userId");
		
		userVO vo = new userVO(userId, "", name, phone, email, "");
		System.out.println("vo : " + vo);
		String pwd = "";
		
		if (phone == "") {
			pwd = DAO.findpwd(vo);
		} else if (email == "") {
			pwd = DAO.findpwd2(vo);
		} 
		
		if (pwd == null) {
			path="signup/fail.jsp";
		} else {
			request.setAttribute("userId", userId);
			path = "signup/changepwd.jsp";
		}
		
	
		return path;
	}

}
