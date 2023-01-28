package com.spring.Imuseum.order;

public class WishVO {
	private int wishNum;
	private int productNum;
	private String id;
	
	private String productName;
	private int price;
	private String photo;
	
	public int getWishNum() {
		return wishNum;
	}
	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
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
	@Override
	public String toString() {
		return "WishVO [wishNum=" + wishNum + ", productNum=" + productNum + ", id=" + id + ", productName="
				+ productName + ", price=" + price + ", photo=" + photo + "]";
	}
	
	
	
	
}
