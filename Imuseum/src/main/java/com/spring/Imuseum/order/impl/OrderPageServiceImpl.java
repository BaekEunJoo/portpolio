package com.spring.Imuseum.order.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderPageService;
import com.spring.Imuseum.order.dao.OrderDAO;

@Service("orderPageService")
public class OrderPageServiceImpl implements OrderPageService {

	@Autowired
	private OrderDAO orderDao;
	
	@Override
	public List<OrderPagePVO> getPInfo(List<OrderPagePVO> orders) {
		List<OrderPagePVO> result = new ArrayList<OrderPagePVO>();	
		for(OrderPagePVO opp : orders) {
			OrderPagePVO productInfo = orderDao.getPInfo(opp);	
			productInfo.setProductNum(opp.getProductNum());	
			productInfo.setProductCnt(opp.getProductCnt());	
			productInfo.setProductOption(opp.getProductOption());	
			productInfo.setCartNum(opp.getCartNum());	
			
			result.add(productInfo);
		}
		return result;
	}
	
	
}
