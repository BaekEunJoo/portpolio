package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class DeleteUserCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "main/main.jsp";
		
		userVO ve = (userVO)request.getSession().getAttribute("user");
		String id = ve.getUserId();
		
		DAO.DeleteUser(id);
		
		request.getSession().removeAttribute("user");
		
		
		return path;
	}

}
