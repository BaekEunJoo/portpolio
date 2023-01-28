package com.spring.Imuseum.order;

import java.util.List;

public interface WishService {
	List<WishVO> getWishList(WishVO vo);
	int getWishCnt(String id);
	int insertWish(WishVO vo);
	int deleteWish(WishVO vo);
	WishVO wishCheck(WishVO vo);
	void deleteMyWish(int wishNum);
}
