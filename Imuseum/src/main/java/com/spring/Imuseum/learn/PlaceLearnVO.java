package com.spring.Imuseum.learn;

public class PlaceLearnVO {
	private int placeNum;
	private String placeName;
	public int getPlaceNum() {
		return placeNum;
	}
	public void setPlaceNum(int placeNum) {
		this.placeNum = placeNum;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	@Override
	public String toString() {
		return "PlaceLearn [placeNum=" + placeNum + ", placeName=" + placeName + "]";
	}
	
	
}
