package com.spring.Imuseum.mypage;

public class orderOnlineVO {
	private String orderNum, id, status, orderCancel, orderDate, paymentType;
	private int totalPrice;
	
	public orderOnlineVO() {
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrderCancel() {
		return orderCancel;
	}
	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	@Override
	public String toString() {
		return "orderOnlineVO [orderNum=" + orderNum + ", id=" + id + ", status=" + status + ", orderCancel="
				+ orderCancel + ", orderDate=" + orderDate + ", paymentType=" + paymentType + ", totalPrice="
				+ totalPrice + "]";
	}
	
	
	
	
} //end
