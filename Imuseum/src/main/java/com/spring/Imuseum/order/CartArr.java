package com.spring.Imuseum.order;

import java.util.List;

public class CartArr {
	private List<CartVO> products;

	public List<CartVO> getProducts() {
		return products;
	}

	public void setProducts(List<CartVO> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "CartArr [products=" + products + "]";
	}
	
	
}
