package com.mystudy.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.model.command.CheckUserCommand;
import com.mystudy.model.command.CheckpwCommand;
import com.mystudy.model.command.Command;
import com.mystudy.model.command.DeleteUserCommand;
import com.mystudy.model.command.MyPageCommand;
import com.mystudy.model.command.OrderCommand;
import com.mystudy.model.command.SignupCommand;
import com.mystudy.model.command.SignupokCommand;
import com.mystudy.model.command.UpdateCommand;
import com.mystudy.model.command.UpdateUserCommand;
import com.mystudy.model.command.addAddrCommand;
import com.mystudy.model.command.changepwdCommand;
import com.mystudy.model.command.checkuserIdCommand;
import com.mystudy.model.command.checkuserpwdCommand;
import com.mystudy.model.command.deleteAddrCommand;
import com.mystudy.model.command.editAddrCommand;
import com.mystudy.model.command.finduserIdCommand;
import com.mystudy.model.command.finduserpwdCommand;
import com.mystudy.model.command.goeditAddrCommand;
import com.mystudy.model.command.goDelAddressCommand;
import com.mystudy.model.command.insertAddrCommand;
import com.mystudy.model.command.loginfailCommand;
import com.mystudy.model.command.logoutCommand;
import com.mystudy.model.command.representAddrCommand;
import com.mystudy.model.command.searchCommand;
import com.mystudy.model.command.viewmywritingCommand;
import com.mystudy.model.command.viewwishCommand;



@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() 실행!");
		String type = request.getParameter("type");
		Command command = null;
		//회원가입 창 이동 커맨드
		if ("signup".equals(type)) {
			command = new SignupCommand();
		}
		//회원가입 완료 창 이동 커맨드
		else if ("signupok".equals(type)) {
			command = new SignupokCommand();
		} 
			
		//마이페이지 창 이동 커맨드
		else if ("mypage".equals(type)) {
			command = new MyPageCommand();
		}
		//구매이력 조회 창 이동 커맨드
		else if ("order".equals(type)) {
			command = new OrderCommand();
		}
		//개인정보 수정 눌렀을때 비밀번호 확인 창 이동 커맨드
		else if ("profile".equals(type)) {
			command = new CheckpwCommand();
		}
		//비밀번호 확인 후 개인정보 수정 창 이동 커맨드
		else if ("updateuser".equals(type)) {
			command = new UpdateUserCommand();
		}
		//개인정보 수정 처리 커맨드
		else if ("update".equals(type)) {
			command = new UpdateCommand();
		}
		//회원탈퇴 처리 커맨드
		else if ("deleteuser".equals(type)) {
			command = new DeleteUserCommand();
		}
		//로그인 확인 처리 커맨드
		else if ("checklogin".equals(type)) {
			command = new CheckUserCommand();
		} 
		//로그인 실패 했을때 처리 커맨드
		else if ("loginfail".equals(type)) {
			command = new loginfailCommand();
		} 
		//아이디 찾기 폼 이동 처리 커맨드
		else if ("checkuserId".equals(type)) {
			command = new checkuserIdCommand();
		}
		//아이디 찾기 및 결과 표시 처리 커맨드
		else if ("finduserId".equals(type)) {
			command = new finduserIdCommand();
		}
		//비밀번호 찾기 폼 이동 처리 커맨드
		else if ("checkuserpwd".equals(type)) {
			command = new checkuserpwdCommand();
		}
		//비밀번호 변경 폼 이동 및 확인 커맨드
		else if ("finduserpwd".equals(type)) {
			command = new finduserpwdCommand();
		}
		//비밀번호 변경 커맨드
		else if ("changepwd".equals(type)) {
			command = new changepwdCommand();
		}
		//로그아웃 처리 커맨드
		else if ("logout".equals(type)) {
			command = new logoutCommand();
		}
		//배송 주소록 홈 창 이동 커맨드
		else if ("deladdr".equals(type)) {
			command = new goDelAddressCommand(); 
		} 
		//배송 주소록 삽입 창 이동 커맨드
		else if ("insertAddr".equals(type)) {
			command = new insertAddrCommand();
		} 
		//배송 주소록 삽입 처리 커맨드
		else if ("addAddr".equals(type)) {
			command = new addAddrCommand();
		}
		//유저의 대표 배송 주소지 설정 처리 커맨드
		else if ("representAddr".equals(type)){
			command = new representAddrCommand();
		}
		//배송 주소지 변경 폼 이동 커맨드
		else if ("goeditAddr".equals(type)) {
			command = new goeditAddrCommand();
		}
		//배송 주소지 변경 처리 커맨드
		else if ("editAddr".equals(type)) {
			command = new editAddrCommand();
		}
		//배송 주소지 삭제 처리 커맨드
		else if ("deleteAddr".equals(type)) {
			command = new deleteAddrCommand();
		}
		
		//위시 리스트 조회 및 이동 처리 커맨드
		else if ("wishlist".equals(type)) {
			command = new viewwishCommand();
		}
		
		//검색 및 검색 결과창 이동 처리 커맨드
		else if ("search".equals(type)) {
			command = new searchCommand();
		} 
		
		else if("viewmywriting".equals(type)) {
			command = new viewmywritingCommand();
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
