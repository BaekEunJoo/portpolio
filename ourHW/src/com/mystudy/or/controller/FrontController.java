package com.mystudy.or.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.or.common.Command;
import com.mystudy.or.common.insertOrderCommand;

@WebServlet("/controllerbb")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 실행");
		String type = request.getParameter("type");
		Command command = null;

		if (type.equals("orderList")) {
			System.out.println("orderList 실행~");
			command = new insertOrderCommand();
		}
		
		String path = command.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	  
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
