package com.spring.Imuseum.ticket;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class LearnTicketVO {

	private String revNum;
	private String id;
	private int learnIdx;
	private String title, revDate, subscriber;
	private int totalprice;
	private String payment,	place, time, regdate;
	private int sum;
	private String status, name;
	private String cardNum, cardName, approvalNum;
	private String snsName;
	
	
	//결제실패시
	private String errorMsg;
	public String getErrorMsg() {
		return errorMsg;
	}
	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	
	//페이징
	private int begin = 0; //현재 페이지상의 시작 번호
	private int end = 0; //현재 페이지상의 마지막 번호
	
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
	//검색을 위한 데이터 저장용
	@JsonIgnore
	private String searchCondition = "";
	@JsonIgnore
	private String searchKeyword = "";
	
	
	// 검색을 위해 추가 ---------------
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	
	
	
	//서치용
	private String regdate1, regdate2;
	
	public String getRegdate1() {
		return regdate1;
	}
	public void setRegdate1(String regdate1) {
		this.regdate1 = regdate1;
	}
	public String getRegdate2() {
		return regdate2;
	}
	public void setRegdate2(String regdate2) {
		this.regdate2 = regdate2;
	}
		
		
	//--------------------------------------
	
	
	
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public String getRevNum() {
		return revNum;
	}
	public void setRevNum(String revNum) {
		this.revNum = revNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLearnIdx() {
		return learnIdx;
	}
	public void setLearnIdx(int learnIdx) {
		this.learnIdx = learnIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public String getSubscriber() {
		return subscriber;
	}
	public void setSubscriber(String subscriber) {
		this.subscriber = subscriber;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCardNum() {
		return cardNum;
	}
	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(String approvalNum) {
		this.approvalNum = approvalNum;
	}
	public String getSnsName() {
		return snsName;
	}
	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}
	
	@Override
	public String toString() {
		return "LearnTicketVO [revNum=" + revNum + ", id=" + id + ", learnIdx=" + learnIdx + ", title=" + title
				+ ", revDate=" + revDate + ", subscriber=" + subscriber + ", totalprice=" + totalprice + ", payment="
				+ payment + ", place=" + place + ", time=" + time + ", regdate=" + regdate + ", sum=" + sum
				+ ", status=" + status + ", name=" + name + ", cardNum=" + cardNum + ", cardName=" + cardName
				+ ", approvalNum=" + approvalNum + ", snsName=" + snsName + ", searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", regdate1=" + regdate1 + ", regdate2=" + regdate2 + "]";
	}
	
	
	
}
