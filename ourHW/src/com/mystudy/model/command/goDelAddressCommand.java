package com.mystudy.model.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.DAO.DAO;
import com.mystudy.model.VO.addrVO;
import com.mystudy.model.VO.userVO;

public class goDelAddressCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = "Mypage/deladdrhome.jsp";
		
		userVO vo = (userVO)request.getSession().getAttribute("user");
		int userNo = vo.getUserNo();
		List<addrVO> list = new ArrayList<>();
		
		list = DAO.viewaddrList(userNo);
		
		for (addrVO ve : list) {
			System.out.println("addrVO : " + ve); 
		}
		
		
		request.setAttribute("addrlist", list);
		
		return path;
	}

}
