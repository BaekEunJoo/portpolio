package com.spring.Imuseum.order;

import java.util.List;

public class OrderPageVO {
	private List<OrderPagePVO> orders;

	public List<OrderPagePVO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderPagePVO> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderPageVO [orders=" + orders + "]";
	}
	
	
}
