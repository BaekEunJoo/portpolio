package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class CheckUserCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "main/main.jsp";
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
		
		userVO vo =  new userVO(id, pwd);


		
		userVO ve =  DAO.checkUser(vo);
		System.out.println(ve);
		if (ve == null) {
			path = "controller?type=loginfail";
		}
		
		
		userVO vu = DAO.saveUserinfo(id);
		System.out.print("session user data : " + vu);
		request.getSession().setAttribute("user", vu);
		
		return path;
	}

}
