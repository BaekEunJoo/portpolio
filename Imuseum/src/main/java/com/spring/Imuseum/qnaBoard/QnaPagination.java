package com.spring.Imuseum.qnaBoard;

public class QnaPagination {
	private String id,status;
	private int begin,end;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "QnaPagination [id=" + id + ", status=" + status + ", begin=" + begin + ", end=" + end + "]";
	}
	
	
}
