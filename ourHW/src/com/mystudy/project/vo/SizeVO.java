package com.mystudy.project.vo;

public class SizeVO {
	
	String optionNo;
	String productNo;
	String optionSize;
	int optionCount;
	
	
	public String getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(String optionNo) {
		this.optionNo = optionNo;
	}
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getOptionSize() {
		return optionSize;
	}
	public void setOptionSize(String optionSize) {
		this.optionSize = optionSize;
	}
	public int getOptionCount() {
		return optionCount;
	}
	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}
	
	
	@Override
	public String toString() {
		return "SizeVO [optionNo=" + optionNo + ", productNo=" + productNo + ", optionSize=" + optionSize
				+ ", optionCount=" + optionCount + "]";
	}
	
	
}
