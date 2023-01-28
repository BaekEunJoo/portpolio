package com.spring.Imuseum.mypage;

public class ProductFaqVO {

	//product 테이블
	private int productNum;
	private String productName, photo1;
	
	//productQna 테이블
	private int pqnaNum;
	private String question, answer, pStatus, regdate, id;
	
	public ProductFaqVO() {
	}
	
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getpStatus() {
		return pStatus;
	}



	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}



	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public int getPqnaNum() {
		return pqnaNum;
	}
	public void setPqnaNum(int pqnaNum) {
		this.pqnaNum = pqnaNum;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}



	@Override
	public String toString() {
		return "ProductFaqVO [productNum=" + productNum + ", productName=" + productName + ", photo1=" + photo1
				+ ", id=" + id + ", pqnaNum=" + pqnaNum + ", question=" + question + ", answer=" + answer + ", pStatus="
				+ pStatus + ", regdate=" + regdate + "]";
	}




	
}//end
