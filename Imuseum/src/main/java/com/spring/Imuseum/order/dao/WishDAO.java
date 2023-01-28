package com.spring.Imuseum.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.Imuseum.order.WishVO;

@Repository
public class WishDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public WishDAO() {
		System.out.println("WishDAO() 객체 생성");
	}
	
	public List<WishVO> getWishList(WishVO vo) {
		return mybatis.selectList("wishDAO.getWishList", vo.getId());
	}
	
	public int getWishCnt(String id) {
		return mybatis.selectOne("wishDAO.getWishCnt", id);
	}
	
	public int insertWish(WishVO vo) {
		return mybatis.insert("wishDAO.insertWish", vo);
	}
	
	public int deleteWish(WishVO vo) {
		return mybatis.delete("wishDAO.deleteWish",vo);
	}
	public WishVO wishCheck(WishVO vo) {
		return mybatis.selectOne("wishDAO.wishCheck", vo);
	}
	
	public void deleteMyWish(int wishNum) {
		mybatis.delete("wishDAO.deleteMyWish",wishNum);
	};
}
