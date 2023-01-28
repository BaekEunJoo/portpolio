package com.spring.Imuseum.qnaBoard;

import java.sql.Date;

public class QnaAnswerVO {
	private int answerIdx,qnaIdx;
	private String content;
	private Date regdate;
	
	public QnaAnswerVO() {}
	
	public int getAnswerIdx() {
		return answerIdx;
	}
	public void setAnswerIdx(int answerIdx) {
		this.answerIdx = answerIdx;
	}
	public int getQnaIdx() {
		return qnaIdx;
	}
	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "QnaAnswerVO [answerIdx=" + answerIdx + ", qnaIdx=" + qnaIdx + ", content=" + content + ", regdate="
				+ regdate + "]";
	}
}
