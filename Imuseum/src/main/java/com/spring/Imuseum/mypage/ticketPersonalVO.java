package com.spring.Imuseum.mypage;

public class ticketPersonalVO {
	private String id, revNum, exhName;
	private String revDate, regdate, status;
	private int totalprice;
	
	public ticketPersonalVO() {
	}
	
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getTotalprice() {
		return totalprice;
	}


	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRevNum() {
		return revNum;
	}
	public void setRevNum(String revNum) {
		this.revNum = revNum;
	}
	public String getExhName() {
		return exhName;
	}
	public void setExhName(String exhName) {
		this.exhName = exhName;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "ticketPersonalVO [id=" + id + ", revNum=" + revNum + ", exhName=" + exhName + ", revDate=" + revDate
				+ ", regdate=" + regdate + ", status=" + status + ", totalprice=" + totalprice + "]";
	}




	
	
}//end
