package com.spring.Imuseum.learn;

import java.sql.Date;

public class LearnLikeVO {
	private int likeNo, learnIdx, rno, likeCheck, likeCheck2;
	
	
	
	public int getLikeCheck2() {
		return likeCheck2;
	}
	public void setLikeCheck2(int likeCheck2) {
		this.likeCheck2 = likeCheck2;
	}
	private String id;
	private Date likeDate;
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getLearnIdx() {
		return learnIdx;
	}
	public void setLearnIdx(int learnIdx) {
		this.learnIdx = learnIdx;
	}
	@Override
	public String toString() {
		return "LearnLikeVO [likeNo=" + likeNo + ", learnIdx=" + learnIdx + ", rno=" + rno + ", likeCheck=" + likeCheck
				+ ", likeCheck2=" + likeCheck2 + ", id=" + id + ", likeDate=" + likeDate + "]";
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getLikeCheck() {
		return likeCheck;
	}
	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getLikeDate() {
		return likeDate;
	}
	public void setLikeDate(Date likeDate) {
		this.likeDate = likeDate;
	}
}
