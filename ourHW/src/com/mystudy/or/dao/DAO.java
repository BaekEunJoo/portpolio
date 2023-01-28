package com.mystudy.or.dao;


import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.or.VO.orderDetailVO;
import com.mystudy.or.VO.productOptionVo;
import com.mystudy.or.mybatis.DBService;

public class DAO {

	public static void insertOrder(orderDetailVO vo) {
		System.out.println("vo : " + vo);
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("order.insert", vo); 
		ss.close();
	}
	
	public static orderDetailVO selectCartList(int cartNo) {
		System.out.println(">> selectCartList cartNo : " + cartNo);
		orderDetailVO voo = null;
		SqlSession ss = DBService.getFactory().openSession();
		voo = ss.selectOne("order.select", cartNo);
		ss.close();
		return voo;
	}

	public static int orderNoSelect() {
		SqlSession ss = DBService.getFactory().openSession();
		int no = ss.selectOne("order.orderNoSelect");
		ss.close();
		return no;
	}
	
	public static int optionCountSelect(orderDetailVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		int oc = ss.selectOne("order.optionCountSelect", vo);
		ss.close();
		return oc;
	}

	public static void optionCountUpdate(orderDetailVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.update("order.optionCountUpdate", vo);
		ss.close();
	}
	
	public static void orderMain(orderDetailVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.insert("order.orderMainInsert", vo);
		ss.close();
	}
	
	public static void deleteCart(String userId) {
		SqlSession ss = DBService.getFactory().openSession(true);
		ss.delete("order.cartDelete", userId);
		ss.close();
	}
	
} //end

