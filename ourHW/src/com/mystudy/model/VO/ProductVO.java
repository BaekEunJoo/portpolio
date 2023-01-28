package com.mystudy.model.VO;

public class ProductVO {
	
	private int productNo;
	private String productName;
	private int price;	
	int categoryNo;
	private String content;
	private String thumnail;
	private String originalImg;
	private int rate;
	
	
	public ProductVO(int productNo, String productName, int price, int categoryNo, 
			String thumnail, String originalImg,String content,
			 int rate) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.categoryNo = categoryNo;
		this.content = content;
		this.thumnail = thumnail;
		this.originalImg = originalImg;
		this.rate = rate;
	}
	
	
	
	public ProductVO() {
		super();
	}



	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getThumnail() {
		return thumnail;
	}
	public void setThumnail(String thumnail) {
		this.thumnail = thumnail;
	}
	public String getOriginalImg() {
		return originalImg;
	}
	public void setOriginalImg(String originalImg) {
		this.originalImg = originalImg;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}



	@Override
	public String toString() {
		return "ProductVO [productNo=" + productNo + ", productName=" + productName + ", price=" + price
				+ ", categoryNo=" + categoryNo + ", content=" + content + ", thumnail=" + thumnail + ", originalImg="
				+ originalImg + ", rate=" + rate + "]";
	}
	
	
	
	
	
}
