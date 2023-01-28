package com.spring.Imuseum.learn;

public class CategoryLearnVO {
	private int categoryNum;
	private String categoryName;
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "CategoryLearnVO [categoryNum=" + categoryNum + ", categoryName=" + categoryName + "]";
	}
	
	

}
