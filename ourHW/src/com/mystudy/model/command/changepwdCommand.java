package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class changepwdCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "signup/login.jsp";
		
		String userId = request.getParameter("userId");
		String pwd = request.getParameter("pwd");
		System.out.println("아이디 : " + userId);
		System.out.println("변경할 비밀번호 : " + pwd);
		
		userVO vo = new userVO(userId, pwd);
		
		DAO.changepwd(vo);
		
		return path;
	}

}
