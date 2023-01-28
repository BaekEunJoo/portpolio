package com.spring.Imuseum.notice;

public class NoticeVO {
	private int noNum, noCategoryNum;
	private String noDate, noTitle,	noCategory, id;
	
	public NoticeVO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNoNum() {
		return noNum;
	}
	public void setNoNum(int noNum) {
		this.noNum = noNum;
	}
	public int getNoCategoryNum() {
		return noCategoryNum;
	}
	public void setNoCategoryNum(int noCategoryNum) {
		this.noCategoryNum = noCategoryNum;
	}
	public String getNoDate() {
		return noDate;
	}
	public void setNoDate(String noDate) {
		this.noDate = noDate;
	}
	public String getNoTitle() {
		return noTitle;
	}
	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}
	public String getNoCategory() {
		return noCategory;
	}
	public void setNoCategory(String noCategory) {
		this.noCategory = noCategory;
	}

	@Override
	public String toString() {
		return "NoticeVO [noNum=" + noNum + ", noCategoryNum=" + noCategoryNum + ", noDate=" + noDate + ", noTitle="
				+ noTitle + ", noCategory=" + noCategory + ", id=" + id + "]";
	}

	
	
}
