package com.spring.Imuseum.ticket;

public class ExhibitionTypeVO {

	private String type;
	private int price;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "ExhibitionTypeVO [type=" + type + ", price=" + price + "]";
	}
	
}
