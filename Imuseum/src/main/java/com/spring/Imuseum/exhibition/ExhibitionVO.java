package com.spring.Imuseum.exhibition;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class ExhibitionVO {

	private int exhNum;
	private String exhName, startDate, lastDate, exhInfo;
	private String genre, partnership, posterImg, upImg, infoImg, ticketImg;
	private String year;
	
	
	//달력 서치용
	private String calDay;
	
	public String getCalDay() {
		return calDay;
	}
	public void setCalDay(String calDay) {
		this.calDay = calDay;
	}

	//검색용
	private String searchKeyword = "";

	
	// 파일업로드
	@JsonIgnore
	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	//================================
	public int getExhNum() {
		return exhNum;
	}
	public void setExhNum(int exhNum) {
		this.exhNum = exhNum;
	}
	public String getExhName() {
		return exhName;
	}
	public void setExhName(String exhName) {
		this.exhName = exhName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getExhInfo() {
		return exhInfo;
	}
	public void setExhInfo(String exhInfo) {
		this.exhInfo = exhInfo;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPartnership() {
		return partnership;
	}
	public void setPartnership(String partnership) {
		this.partnership = partnership;
	}
	public String getPosterImg() {
		return posterImg;
	}
	public void setPosterImg(String posterImg) {
		this.posterImg = posterImg;
	}
	public String getUpImg() {
		return upImg;
	}
	public void setUpImg(String upImg) {
		this.upImg = upImg;
	}
	public String getInfoImg() {
		return infoImg;
	}
	public void setInfoImg(String infoImg) {
		this.infoImg = infoImg;
	}
	
	public String getTicketImg() {
		return ticketImg;
	}
	public void setTicketImg(String ticketImg) {
		this.ticketImg = ticketImg;
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	//검색용
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "ExhibitionVO [exhNum=" + exhNum + ", exhName=" + exhName + ", startDate=" + startDate + ", lastDate="
				+ lastDate + ", exhInfo=" + exhInfo + ", genre=" + genre + ", partnership=" + partnership
				+ ", posterImg=" + posterImg + ", upImg=" + upImg + ", infoImg=" + infoImg + ", ticketImg=" + ticketImg
				+ ", year=" + year + ", searchKeyword=" + searchKeyword + ", uploadFile=" + uploadFile + "]";
	}
	
	
}
