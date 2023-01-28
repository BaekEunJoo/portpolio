package com.mystudy.or.VO;

public class productOptionVo {
	private int optionNo;
	private int productNo;
	private String optionSize;
	private int optionCount;
	
	public productOptionVo() {
	}
	
	public productOptionVo(int optionNo, int productNo, String optionSize, int optionCount) {
		super();
		this.optionNo = optionNo;
		this.productNo = productNo;
		this.optionSize = optionSize;
		this.optionCount = optionCount;
	}

	public productOptionVo(int optionCount) {
		this.optionCount = optionCount;
	}

	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
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
		return "productOptionVo [optionNo=" + optionNo + ", productNo=" + productNo + ", optionSize=" + optionSize
				+ ", optionCount=" + optionCount + "]";
	}
	
	
	
}//end
