package com.spring.Imuseum.product;

public class OptionVO {
	
	private String optionname;
	private int optionnum, cnt, productnum;
	
	public String getOptionname() {
		return optionname;
	}
	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(int optionnum) {
		this.optionnum = optionnum;
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	
	@Override
	public String toString() {
		return "OptionVO [optionname=" + optionname + ", optionnum=" + optionnum + ", cnt=" + cnt + ", productnum="
				+ productnum + "]";
	}
	
	
}
