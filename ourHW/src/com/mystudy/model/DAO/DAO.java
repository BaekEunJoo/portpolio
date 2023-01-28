package com.mystudy.model.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.model.VO.ProductVO;
import com.mystudy.model.VO.addrVO;
import com.mystudy.model.VO.orderVO;
import com.mystudy.model.VO.userVO;
import com.mystudy.mybatis.DBService;
import com.mystudy.project.vo.ReviewVO;



public class DAO {
//회원가입
	public static void insertUser(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("user.insert",vo);
		ss.close();
		
	}
//로그인
	public static userVO checkUser(userVO vo) {
		userVO ve = null;
		SqlSession ss = DBService.getFactory().openSession();
		ve = ss.selectOne("user.checkuser",vo);
		ss.close();
		
		return ve;
		
	}
//개인정보 수정
	public static void updateUser(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("user.updateuser", vo);
		ss.close();
		
	}
//회원탈퇴
	public static void DeleteUser(String id) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("user.deleteuser", id);
		ss.close();
		
		
	}

//web session에 유저 데이터를 저장하기 위한 DAO
	public static userVO saveUserinfo(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		userVO vo = null;
		vo = ss.selectOne("user.userinfo", id);
		ss.close();
		
		return vo;
	}

//주소록 추가
	public static void insertAddr(addrVO vo) {
	SqlSession ss = DBService.getFactory().openSession(true);
	ss.insert("user.insertaddr", vo);
	ss.close();	
	
	}

//유저 배송 주소록 조회
	public static List<addrVO> viewaddrList(int userNo) {
		List<addrVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		list = ss.selectList("user.viewaddrList", userNo);
		ss.close();	
		
		
		return list;
	}

//대표 배송지 고정
	public static void representAddr(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("user.representAddr", vo);
		ss.close();
		
	}
	
//주소록 편집
	public static void editAddr(addrVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("user.editAddr", vo);
		ss.close();
		
	}
	
//주소록 삭제
	public static void deleteAddr(int delNo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("user.deleteAddr", delNo);
		ss.close();
		
	}
	
//주문내역 조회
	public static List<orderVO> vieworderList(String userId) {
		List<orderVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		list = ss.selectList("user.vieworderList", userId);
		ss.close();	
		
		
		return list;
	}
	
//관심상품 조회
	public static List<ProductVO> viewwishList(String userId) {
		List<ProductVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		list = ss.selectList("user.viewwishList", userId);
		ss.close();	
		
		return list;
	}
	
//카테고리 이름으로 먼저 검색하기
	public static List<ProductVO> searchCategory(String search) {
		List<ProductVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		list = ss.selectList("user.searchCategory", search);
		ss.close();	
		
		
		return list;
	}
	
//카테고리 검색 실패시 상품명으로 검색하기
	public static List<ProductVO> searchProduct(String search) {
		List<ProductVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		list = ss.selectList("user.searchProduct", search);
		ss.close();	
		
		
		return list;
	}
	
//이름, 이메일로 아이디 찾기	
	public static String finduserId(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		String userId = "";
		userId = ss.selectOne("user.finduserId", vo);
		ss.close();	
		
		return userId;
	}
	
//이름, 핸드폰 번호로 아이디 찾기	
	public static String finduserId2(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		String userId = "";
		userId = ss.selectOne("user.finduserId2", vo);
		ss.close();	
		
		return userId;
	}
	
//아이디, 이름, 이메일로 아이디 찾기
	public static String findpwd(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		String pwd = "";
		pwd = ss.selectOne("user.findpwd", vo);
		ss.close();	
		
		return pwd;
	}	

//아이디, 이름, 휴대폰 번호로 아이디 찾기
	public static String findpwd2(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		String pwd = "";
		pwd = ss.selectOne("user.findpwd2", vo);
		ss.close();	
		
		return pwd;
	}

//비밀번호 찾기 중 비밀번호 변경
	public static void changepwd(userVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);

		ss.update("user.changepwd", vo);
		ss.close();	
				
	}
	public static List<ReviewVO> viewmywriting(String userId) {
		List<ReviewVO> list = null;
		SqlSession ss = DBService.getFactory().openSession();
		
		list = ss.selectList("user.viewmywriting", userId);
		ss.close();	
		
		return list;
		
	}	
}
