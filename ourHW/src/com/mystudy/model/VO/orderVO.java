package com.mystudy.model.VO;

public class orderVO {
	
	private int orderNo, 
	productNo,
	amount,
	totalPrice
	;
	
	
	private String orderStatus,
	orderDate,
	userId,
	productName,
	optionSize
	;

	public orderVO(int orderNo, int productNo, int amount, int totalPrice, String optionSize, String orderStatus,
			String orderDate) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.amount = amount;
		this.totalPrice = totalPrice;
		this.optionSize = optionSize;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		
	}

	
	
	
	public orderVO(int orderNo, int productNo, int amount, int totalPrice, String optionSize, String orderStatus,
			String orderDate, String productName) {
		super();
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.amount = amount;
		this.totalPrice = totalPrice;
		this.optionSize = optionSize;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.productName = productName;
	}




	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}




	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getOptionNo() {
		return optionSize;
	}

	public void setOptionNo(String optionSize) {
		this.optionSize = optionSize;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "orderVO [orderNo=" + orderNo + ", productNo=" + productNo + ", amount=" + amount + ", totalPrice="
				+ totalPrice + ", optionNo=" + optionSize + ", orderStatus=" + orderStatus + ", orderDate=" + orderDate
				+ ", userId=" + userId + "]";
	}


	
	

	
}
