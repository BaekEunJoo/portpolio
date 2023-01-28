package com.spring.Imuseum.order;

import java.util.List;

public interface CartService {
	List<CartVO> getCartList(CartVO vo);
	int getCartCnt(CartVO vo);
	int cntCheck(CartVO vo);
	int insertCart(CartVO vo);
	void updateCart(CartVO vo);
	int deleteCart(int cartNum);
	int deleteCartSoldout(String id);
	CartVO cartCheck(CartVO vo);
	CartVO getOneCart(int cartNum); 
}
