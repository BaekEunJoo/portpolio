package com.mystudy.or.VO;

public class orderDetailVO {
	private int productNo;
	private int amount;
	private int total;
	private String optionSize;
	private int orderNo;
	private int optionCount;
	private String userId;
	
	
	

	public orderDetailVO() {
	}

	public orderDetailVO(int productNo, int amount, int total, String optionSize) {
		super();
		this.productNo = productNo;
		this.amount = amount;
		this.total = total;
		this.optionSize = optionSize;
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getOptionCount() {
		return optionCount;
	}

	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getOptionSize() {
		return optionSize;
	}
	public void setOptionSize(String optionSize) {
		this.optionSize = optionSize;
	}


	@Override
	public String toString() {
		return "orderDetailVO [productNo=" + productNo + ", amount=" + amount + ", total=" + total + ", optionSize="
				+ optionSize + "]";
	}
	

	

	

	
} //end
