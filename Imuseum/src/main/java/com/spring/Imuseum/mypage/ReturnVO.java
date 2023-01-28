package com.spring.Imuseum.mypage;

public class ReturnVO {
	private String orderNum, id, orderCancel, orderDate;
	
	public ReturnVO() {
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
	public String getOrderCancel() {
		return orderCancel;
	}
	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrder_date(String orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "returnVO [orderNum=" + orderNum + ", id=" + id + ", orderCancel=" + orderCancel + ", orderDate="
				+ orderDate + "]";
	}
	
	
	
}//end
