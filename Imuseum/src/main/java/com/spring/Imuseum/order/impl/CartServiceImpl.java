package com.spring.Imuseum.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.order.CartService;
import com.spring.Imuseum.order.CartVO;
import com.spring.Imuseum.order.dao.CartDAO;
@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDao;
	
	@Override
	public List<CartVO> getCartList(CartVO vo) {
		return cartDao.getCartList(vo);
	}
	
	@Override
	public int getCartCnt(CartVO vo) {
		return cartDao.getCartCnt(vo);
	}
	
	@Override
	public int cntCheck(CartVO vo) {
		return cartDao.cntCheck(vo);
	}
	
	@Override
	public int insertCart(CartVO vo) {
		return cartDao.insertCart(vo);
	}

	@Override
	public void updateCart(CartVO vo) {
		cartDao.updateCart(vo);
	}

	@Override
	public int deleteCart(int cartNum) {
		return cartDao.deleteCart(cartNum);
	}
	
	@Override
	public int deleteCartSoldout(String id) {
		return cartDao.deleteCartSoldout(id);	
	}

	@Override
	public CartVO cartCheck(CartVO vo) {
		return cartDao.cartCheck(vo);
	}
	@Override
	public CartVO getOneCart(int cartNum) {
		return cartDao.getOneCart(cartNum);
	}
	
}
