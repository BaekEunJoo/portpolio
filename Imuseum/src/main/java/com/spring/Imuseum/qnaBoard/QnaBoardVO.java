package com.spring.Imuseum.qnaBoard;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaBoardVO {
	private int qnaIdx,menuCategory,questionCategory,fileIdx;
	private String title,contents,id,cateName,menuName,statusValue;
	private MultipartFile uploadFile;
	private Date regDate;
	
	public QnaBoardVO() {}
	public int getQnaIdx() {
		return qnaIdx;
	}
	public void setQnaIdx(int qnaIdx) {
		this.qnaIdx = qnaIdx;
	}
	public int getMenuCategory() {
		return menuCategory;
	}
	public void setMenuCategory(int menuCategory) {
		this.menuCategory = menuCategory;
	}
	public int getQuestionCategory() {
		return questionCategory;
	}
	public void setQuestionCategory(int questionCategory) {
		this.questionCategory = questionCategory;
	}
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getStatusValue() {
		return statusValue;
	}
	public void setStatusValue(String statusValue) {
		this.statusValue = statusValue;
	}
	
	
	@Override
	public String toString() {
		return "QnaBoardVO [qnaIdx=" + qnaIdx + ", menuCategory=" + menuCategory + ", questionCategory="
				+ questionCategory + ", fileIdx=" + fileIdx + ", title=" + title + ", contents=" + contents + ", id="
				+ id + ", cateName=" + cateName + ", menuName=" + menuName + ", statusValue=" + statusValue
				+ ", uploadFile=" + uploadFile + ", regDate=" + regDate + "]";
	}

}
