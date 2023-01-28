package com.spring.Imuseum.order;

public class ProductShipVO {
	private int shipNum;
	private String orderNum, shipCompany;
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getShipNum() {
		return shipNum;
	}
	public void setShipNum(int shipNum) {
		this.shipNum = shipNum;
	}
	public String getShipCompany() {
		return shipCompany;
	}
	public void setShipCompany(String shipCompany) {
		this.shipCompany = shipCompany;
	}
	
	@Override
	public String toString() {
		return "ProductShipVO [orderNum=" + orderNum + ", shipNum=" + shipNum + ", shipCompany=" + shipCompany + "]";
	}
	
	
	
}
