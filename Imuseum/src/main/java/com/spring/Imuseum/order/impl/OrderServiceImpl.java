package com.spring.Imuseum.order.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.Imuseum.order.OrderPagePVO;
import com.spring.Imuseum.order.OrderService;
import com.spring.Imuseum.order.OrderVO;
import com.spring.Imuseum.order.ProductShipVO;
import com.spring.Imuseum.order.dao.CartDAO;
import com.spring.Imuseum.order.dao.OrderDAO;
@Service("orderService")
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private CartDAO cartDao;
	
	@Override
	public String insertOrders(OrderVO vo) {
		
		orderDao.insertOrders(vo);
		//String orderNum = orderDao.getOrderNum();
		//System.out.println(orderNum);
		for(OrderPagePVO opp : vo.getOrders()) {
			opp.setOrderNum(vo.getOrderNum());
			orderDao.insertOrderProduct(opp);
			
			if(opp.getCartNum() > 0 ) {
				cartDao.deleteCart(opp.getCartNum());
			}
			
			orderDao.updateOrderCnt(opp);
			
		}
		return vo.getOrderNum();
	}
	
	@Override
	public OrderVO getOrder(String orderNum) {
		System.out.println(">> getOrder실행---------");
		System.out.println("전달받은 오더넘버:" + orderNum);
		System.out.println(orderDao.getOrder(orderNum));
		return orderDao.getOrder(orderNum);
	}
	
	@Override
	public OrderVO getShip(OrderVO vo) {
		return orderDao.getShip(vo);
	}
	
	@Override
	public List<OrderVO> getOrderList(OrderVO vo) {
		return orderDao.getOrderList(vo);
	}
	
	@Override
	public List<OrderVO> getSaleList(OrderVO vo) {
		return orderDao.getSaleList(vo);
	}
	
	@Override
	public List<OrderVO> getdaySaleList(OrderVO vo) {
		return orderDao.getdaySaleList(vo);
	}
	@Override
	public List<OrderVO> getday2SaleList(OrderVO vo) {
		return orderDao.getday2SaleList(vo);
	}
	@Override
	public List<OrderVO> getday3SaleList(OrderVO vo) {
		return orderDao.getday3SaleList(vo);
	}
	@Override
	public List<OrderVO> getday4SaleList(OrderVO vo) {
		return orderDao.getday4SaleList(vo);
	}
	@Override
	public List<OrderVO> getday5SaleList(OrderVO vo) {
		return orderDao.getday5SaleList(vo);
	}

	@Override
	public void updateOrder(OrderVO vo) {
		orderDao.updateOrder(vo);
	}
	
	@Override
	public void updateDate() {
		orderDao.updateDate();
	}
	
	@Override
	public void updateStatus(OrderVO vo) {
		orderDao.updateStatus(vo);
	}

	@Override
	public void deleteOrder(OrderVO vo) {
		orderDao.deleteOrder(vo);
	}

	@Override
	public void updateShip(ProductShipVO vo) {
		orderDao.updateShip(vo);
	}
	
	@Override
	public List<OrderPagePVO> getOrderProduct(String orderNum) {
		return orderDao.getOrderProduct(orderNum);
	}
	
	@Override
	public void insertShip(String orderNum) {
		orderDao.insertShip(orderNum);
		
	}
}
