package com.spring.Imuseum.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.order.WishService;
import com.spring.Imuseum.order.WishVO;
import com.spring.Imuseum.order.dao.WishDAO;
@Service("wishService")
public class WishServiceImpl implements WishService {

	@Autowired
	private WishDAO wishDao;
	
	@Override
	public List<WishVO> getWishList(WishVO vo) {
		return wishDao.getWishList(vo);
	}
	
	@Override
	public int getWishCnt(String id) {
		return wishDao.getWishCnt(id);
	}
	
	@Override
	public int insertWish(WishVO vo) {
		return wishDao.insertWish(vo);
	}
	
	@Override
	public int deleteWish(WishVO vo) {
		return wishDao.deleteWish(vo);
	}

	@Override
	public WishVO wishCheck(WishVO vo) {
		return wishDao.wishCheck(vo);
	}
	
	@Override
	public void deleteMyWish(int wishNum) {
		wishDao.deleteMyWish(wishNum);
	}

}
