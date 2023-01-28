package com.mystudy.project.vo;

public class CartVO {
	
	String cartNo;
	String optionNo;
	String userId;
	int amount;
	int price;
	
	
	
	public CartVO() {
		super();
	}

	public CartVO(String optionNo, String userId, int amount, int price) {
		
		this.cartNo = cartNo;
		this.optionNo = optionNo;
		this.userId = userId;
		this.amount = amount;
		this.price = price;
		
	}
	
	public CartVO(String cartNo, String optionNo, String userId, int amount, int price) {
		super();
		this.cartNo = cartNo;
		this.optionNo = optionNo;
		this.userId = userId;
		this.amount = amount;
		this.price = price;
	}

	
	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	public String getOptionNo() {
		return optionNo;
	}

	public void setOptionNo(String optionNo) {
		this.optionNo = optionNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getAMOUNT() {
		return amount;
	}

	public void setAMOUNT(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
	
	
	
}
