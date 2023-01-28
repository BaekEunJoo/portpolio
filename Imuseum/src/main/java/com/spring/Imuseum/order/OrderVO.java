package com.spring.Imuseum.order;

import java.util.List;

public class OrderVO {
	private String orderNum;
	private String id;
	private String orderDate;
	private String orderName;
	private String orderAddr;
	private String postcode;
	private String orderPhone;
	private String orderReq;
	private String paymentType;
	private int totalPrice;
	private int shipping;
	private String status;
	private String orderCancel;
	private String cardNum;
	private String cardName;
	private int cardQuota;
	private String approvalNum;
	private int productNum;
	private String productName;
	private int shipNum;
	private String shipCompany;
	
	private List<OrderPagePVO> orders;
	
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
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderAddr() {
		return orderAddr;
	}
	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public String getOrderReq() {
		return orderReq;
	}
	public void setOrderReq(String orderReq) {
		this.orderReq = orderReq;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
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
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public int getCardQuota() {
		return cardQuota;
	}
	public void setCardQuota(int cardQuota) {
		this.cardQuota = cardQuota;
	}
	
	public String getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(String approvalNum) {
		this.approvalNum = approvalNum;
	}
	public List<OrderPagePVO> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderPagePVO> orders) {
		this.orders = orders;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public int getShipNum() {
		return shipNum;
	}
	public void setShipNum(int shipNum) {
		this.shipNum = shipNum;
	}
	public String getShipCompany() {
		return shipCompany;
	}
	public void setShipCompany(String shipCompany) {
		this.shipCompany = shipCompany;
	}
	@Override
	public String toString() {
		return "OrderVO [orderNum=" + orderNum + ", id=" + id + ", orderDate=" + orderDate + ", orderName=" + orderName
				+ ", orderAddr=" + orderAddr + ", postcode=" + postcode + ", orderPhone=" + orderPhone + ", orderReq="
				+ orderReq + ", paymentType=" + paymentType + ", totalPrice=" + totalPrice + ", shipping=" + shipping
				+ ", status=" + status + ", orderCancel=" + orderCancel + ", cardNum=" + cardNum + ", cardName="
				+ cardName + ", cardQuota=" + cardQuota + ", approvalNum=" + approvalNum + ", productNum=" + productNum
				+ ", productName=" + productName + ", shipNum=" + shipNum + ", shipCompany=" + shipCompany + ", orders="
				+ orders + "]";
	}
	
}
