package com.mystudy.model.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.userVO;
import com.mystudy.project.vo.ReviewVO;

public class viewmywritingCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "Mypage/managewriting.jsp";
		
		userVO vo = (userVO) request.getSession().getAttribute("user");
		String userId = vo.getUserId();
		
		List<ReviewVO> list = DAO.viewmywriting(userId);
		for (ReviewVO ve : list) {
			System.out.println(ve);
		}
		
		request.setAttribute("list", list);
		
		return path;
	}

	

}
