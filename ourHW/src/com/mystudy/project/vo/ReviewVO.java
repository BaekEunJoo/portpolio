package com.mystudy.project.vo;

public class ReviewVO {
	
	String reviewNo;
	String title;
	String content;
	String userId;
	String userName;
	String wdate;
	String productNo;
	int hit;

	public ReviewVO() {
		super();
	}
	
	
	public ReviewVO(String reviewNo, String title, String content, String productNo) {
		super();
		this.reviewNo = reviewNo;
		this.title = title;
		this.content = content;
		this.productNo = productNo;
	}
	
	
	public ReviewVO(String title, String content, String userId, String userName, String productNo) {
		super();
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.userName = userName;
		this.productNo = productNo;
	}


	public ReviewVO(String reviewNo, String title, String content, String userId, String userName, String wdate,
			String productNo, int hit) {
		super();
		this.reviewNo = reviewNo;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.userName = userName;
		this.wdate = wdate;
		this.productNo = productNo;
		this.hit = hit;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
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
