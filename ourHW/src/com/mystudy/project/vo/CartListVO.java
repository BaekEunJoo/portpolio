package com.mystudy.project.vo;

public class CartListVO {

	String userId;
	String cartNo;
	String productName;
	String thumnail;
	int price;
	int amount;
	int total;
	String optionSize;
	String productNo;
	
	
	
	
	public CartListVO() {
		super();
	}


	//바로결제 생성자
	public CartListVO(String userId, String productName, String thumnail, int price, int amount, int total,
			String optionSize, String productNo) {
		super();
		this.userId = userId;
		this.productName = productName;
		this.thumnail = thumnail;
		this.price = price;
		this.amount = amount;
		this.total = total;
		this.optionSize = optionSize;
		this.productNo = productNo;
	}


	//장바구니 생성자
	public CartListVO(String userId, String cartNo, String productName, String thumnail, int price, int amount,
			int total, String optionSize, String productNo) {
		this.userId = userId;
		this.cartNo = cartNo;
		this.productName = productName;
		this.thumnail = thumnail;
		this.price = price;
		this.amount = amount;
		this.total = total;
		this.optionSize = optionSize;
		this.productNo = productNo;
	}
	
	
	
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCartNo() {
		return cartNo;
	}
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
		return "CartListVO [userId=" + userId + ", cartNo=" + cartNo + ", productName=" + productName + ", thumnail="
				+ thumnail + ", price=" + price + ", amount=" + amount + ", total=" + total + ", optionSize="
				+ optionSize + ", productNo=" + productNo + "]";
	}
		
	
	
}
