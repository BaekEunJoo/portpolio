package com.mystudy.model.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;

public class deleteAddrCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "/controller?type=deladdr";
		int delNo = Integer.parseInt(request.getParameter("delNo"));
		System.out.println("delNo : " + delNo);
		
		
		DAO.deleteAddr(delNo);
		
		
		return path;
	}

}
