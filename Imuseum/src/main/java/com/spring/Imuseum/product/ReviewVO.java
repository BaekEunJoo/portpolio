package com.spring.Imuseum.product;

import java.sql.Date;

public class ReviewVO {
	private String 
	id,
	content,
	star;
	private int 
	prnum,
	productnum;
	private Date regdate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public int getPrnum() {
		return prnum;
	}
	public void setPrnum(int prnum) {
		this.prnum = prnum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", content=" + content + ", star=" + star + ", prnum=" + prnum + ", productnum="
				+ productnum + ", regdate=" + regdate + "]";
	}
	
	
}
