package com.mystudy.project.vo;

public class QAVO {

	
	String qnaNo;
	String title;
	String content;
	String userId;
	String userName;
	String wdate;
	String productNo;
	int hit;
	
	
	
	
	public QAVO() {
		super();
	}
	
		
	public QAVO(String qnaNo, String title, String content, String productNo) {
			super();
			this.qnaNo = qnaNo;
			this.title = title;
			this.content = content;
			this.productNo = productNo;
	}



	public QAVO(String title, String content, String userId, String userName, String productNo) {
		super();
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.userName = userName;
		this.productNo = productNo;
	}



	public String getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(String qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}


	
	
}
