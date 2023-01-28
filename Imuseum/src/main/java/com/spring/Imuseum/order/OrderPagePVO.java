package com.spring.Imuseum.order;

public class OrderPagePVO {
	private String orderNum;
	private String id;
	private int productNum;
	private int cartNum;
	private String productOption;
	private int productCnt;
	
	private String productName;
	private int price;
	private String photo;
	private int discount;
	
	public OrderPagePVO() {
		System.out.println(">>OrderPageProductVO() 객체 생성");
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

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	
	public String getProductOption() {
		return productOption;
	}

	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}

	public int getProductCnt() {
		return productCnt;
	}

	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "OrderPagePVO [orderNum=" + orderNum + ", id=" + id + ", productNum=" + productNum + ", cartNum="
				+ cartNum + ", productOption=" + productOption + ", productCnt=" + productCnt + ", productName="
				+ productName + ", price=" + price + ", photo=" + photo + ", discount=" + discount + "]";
	}

	
	
	
}
