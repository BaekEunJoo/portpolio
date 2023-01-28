package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;

public class UpdateCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "controller?type=mypage";
		
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		userVO ve = (userVO)request.getSession().getAttribute("user");
		String id = ve.getUserId();
		
		userVO vo = new userVO(id, pwd, name, phone, email, addr);

		System.out.println("변경할 데이터 vo : " + vo );
		//System.out.println("변경할 데이터 vo + userId : " + ve );
		
		DAO.updateUser(vo);
		
		request.getSession().setAttribute("user", vo);
		
		return path;
	}

}
