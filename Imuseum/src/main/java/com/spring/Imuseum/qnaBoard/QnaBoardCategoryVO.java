package com.spring.Imuseum.qnaBoard;


public class QnaBoardCategoryVO {
	private int questionCategory,menuIdx;
	private String cateName;
	
	public int getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(int questionCategory) {
		this.questionCategory = questionCategory;
	}
	public int getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	@Override
	public String toString() {
		return "QnaBoardCategoryVO [questionCategory=" + questionCategory + ", menuIdx=" + menuIdx + ", cateName="
				+ cateName + "]";
	}
	


	
}
