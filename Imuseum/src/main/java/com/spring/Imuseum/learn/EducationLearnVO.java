package com.spring.Imuseum.learn;

public class EducationLearnVO {
	private int educationNum;
	private String educationName;
	public int getEducationNum() {
		return educationNum;
	}
	public void setEducationNum(int educationNum) {
		this.educationNum = educationNum;
	}
	public String getEducationName() {
		return educationName;
	}
	public void setEducationName(String educationName) {
		this.educationName = educationName;
	}
	@Override
	public String toString() {
		return "EducationLearn [educationNum=" + educationNum + ", educationName=" + educationName + "]";
	}
	
	
}
