package com.spring.Imuseum.order;

import java.util.List;

public interface OrderService {
	String insertOrders(OrderVO vo);
	OrderVO getOrder(String orderNum);
	OrderVO getShip(OrderVO vo);
	List<OrderVO> getOrderList(OrderVO vo);
	List<OrderVO> getSaleList(OrderVO vo);
	List<OrderVO> getdaySaleList(OrderVO vo);
	List<OrderVO> getday2SaleList(OrderVO vo);
	List<OrderVO> getday3SaleList(OrderVO vo);
	List<OrderVO> getday4SaleList(OrderVO vo);
	List<OrderVO> getday5SaleList(OrderVO vo);
	void updateShip(ProductShipVO vo);
	void updateOrder(OrderVO vo);
	void updateStatus(OrderVO vo);
	void updateDate();
	void deleteOrder(OrderVO vo);
	
	List<OrderPagePVO> getOrderProduct(String orderNum);
	void insertShip(String orderNum);
}
