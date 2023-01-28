package com.spring.Imuseum.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Imuseum.order.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public CartDAO() {
		System.out.println("CartDAO() 객체 생성");
	}
	
	public List<CartVO> getCartList(CartVO vo) {
		return mybatis.selectList("cartDAO.getCartList", vo.getId());
	}
	
	public int getCartCnt(CartVO vo) {
		return mybatis.selectOne("cartDAO.getCartCnt", vo.getId());
	}
	public int cntCheck(CartVO vo) {
		return mybatis.selectOne("cartDAO.cntCheck", vo);
	};
	
	public int insertCart(CartVO vo) {
		return mybatis.insert("cartDAO.insertCart", vo);
	}

	public void updateCart(CartVO vo) {
		mybatis.update("cartDAO.updateCart", vo);
	}

	public int deleteCart(int cartNum) {
		return mybatis.delete("cartDAO.deleteCart", cartNum);
	}
	
	public int deleteCartSoldout(String id) {
		return mybatis.delete("cartDAO.deleteCartSoldout", id);
	}
	
	public CartVO cartCheck(CartVO vo) {
		return mybatis.selectOne("cartDAO.cartCheck", vo);
	}
	public CartVO getOneCart(int cartNum) {
		return mybatis.selectOne("cartDAO.getOneCart", cartNum);
	}
}
