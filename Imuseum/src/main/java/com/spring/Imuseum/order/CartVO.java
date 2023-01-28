package com.spring.Imuseum.order;

public class CartVO {
	private int cartNum;
	private int productNum;
	private String id;
	private String productOption;
	private int productCnt;
	
	private String productName;
	private int price;
	private String photo;
	private String optionName;
	private int cnt;
	private int discount;
	
	
	
	public CartVO() {
		System.out.println(">>CartVO() 객체 생성");
	}

	public int getCartNum() {
		return cartNum;
	}

	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	
	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "CartVO [cartNum=" + cartNum + ", productNum=" + productNum + ", id=" + id + ", productOption="
				+ productOption + ", productCnt=" + productCnt + ", productName=" + productName + ", price=" + price
				+ ", photo=" + photo + ", optionName=" + optionName + ", cnt=" + cnt + ", discount=" + discount + "]";
	}

	

}
