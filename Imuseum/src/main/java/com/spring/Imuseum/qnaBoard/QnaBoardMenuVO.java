package com.spring.Imuseum.qnaBoard;


public class QnaBoardMenuVO {

	private int menuIdx;
	private String menuName;
	
	public int getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}

	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	@Override
	public String toString() {
		return "QnaBoardMenuService [menuIdx=" + menuIdx + ", name=" + menuName + "]";
	}
	
}
