package com.spring.Imuseum.mypage;

public class ReviewVO {

	//vw_orders
	private String id, orderNum, status, orderDate, orderCancel, productName,
					productOption, photo1;
	private int productCnt, totalPrice, oproductNum, productNum;
	
	//pr
	private String content, regdate;
	private int prNum, star;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderCancel() {
		return orderCancel;
	}
	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductOption() {
		return productOption;
	}
	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOproductNum() {
		return oproductNum;
	}
	public void setOproductNum(int oproductNum) {
		this.oproductNum = oproductNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getPrNum() {
		return prNum;
	}
	public void setPrNum(int prNum) {
		this.prNum = prNum;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return "ReviewWriteVO [id=" + id + ", orderNum=" + orderNum + ", status=" + status + ", orderDate=" + orderDate
				+ ", orderCancel=" + orderCancel + ", productName=" + productName + ", productOption=" + productOption
				+ ", photo1=" + photo1 + ", productCnt=" + productCnt + ", totalPrice=" + totalPrice + ", oproductNum="
				+ oproductNum + ", productNum=" + productNum + ", content=" + content + ", regdate=" + regdate
				+ ", prNum=" + prNum + ", star=" + star + "]";
	}
	
	
	
	
}//end
