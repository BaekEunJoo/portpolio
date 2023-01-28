package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class SignupCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String path = "signup/signup_ok.jsp";
		String path = "controller?type=signupok";
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		userVO vo = new userVO(id, pwd, name, phone, email, addr);
		
		DAO.insertUser(vo);
		userVO ve = DAO.saveUserinfo(id);
		
		request.getSession().setAttribute("user", ve);
		
		return path;

}
}
