package com.spring.Imuseum.product;

import java.sql.Date;

public class ProductQnaVO {
	private String 
	id,
	question,
	answer,
	secret,
	typename;
	
	private int pqnanum,
	productnum,
	typenum;
	
	private Date regdate;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getSecret() {
		return secret;
	}

	public void setSecret(String secret) {
		this.secret = secret;
	}

	public int getPqnanum() {
		return pqnanum;
	}

	public void setPqnanum(int pqnanum) {
		this.pqnanum = pqnanum;
	}

	public int getProductnum() {
		return productnum;
	}

	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}

	public int getTypenum() {
		return typenum;
	}

	public void setTypenum(int typenum) {
		this.typenum = typenum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "ReviewVO [id=" + id + ", question=" + question + ", answer=" + answer + ", secret=" + secret
				+ ", pqnanum=" + pqnanum + ", productnum=" + productnum + ", typenum=" + typenum + ", regdate="
				+ regdate + ", typename=" + typename + "]";
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}
	
}
