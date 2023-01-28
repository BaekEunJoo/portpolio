package com.spring.Imuseum.learn;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

	public class LearnVO {
		private int categoryNum, learnIdx, placeNum, educationNum, views, likeHit, likeCheck;
		private String id, mainPhote, categoryName, title, place, educationTimeNum, educationTime, 
		inquiry, educationNumber, memberNumber, fee, 
		content, subtitle, target, regdate, regdate1, regdate2, cnt, 
		rNum, fileName, educationTimeName, fileName2;
		// 파일업로드
		@JsonIgnore
		private MultipartFile uploadFile;
		// 파일업로드
		@JsonIgnore
		private MultipartFile uploadFile2;
		
		
		//검색용
		private String searchKeyword = "";
		
		//검색용
		public String getSearchKeyword() {
			return searchKeyword;
		}
		public void setSearchKeyword(String searchKeyword) {
			this.searchKeyword = searchKeyword;
		}
		
		
		//달력용
		private String calDay;
		//달력용
		public String getCalDay() {
			return calDay;
		}
		public void setCalDay(String calDay) {
			this.calDay = calDay;
		}
		
		

		public String getFileName2() {
			return fileName2;
		}
		public void setFileName2(String fileName2) {
			this.fileName2 = fileName2;
		}
		public String getEducationTime() {
			return educationTime;
		}
		public int getLikeHit() {
			return likeHit;
		}
		public void setLikeHit(int likeHit) {
			this.likeHit = likeHit;
		}
		public int getLikeCheck() {
			return likeCheck;
		}
		public void setLikeCheck(int likeCheck) {
			this.likeCheck = likeCheck;
		}
		public void setEducationTime(String educationTime) {
			this.educationTime = educationTime;
		}
		public String getEducationTimeName() {
			return educationTimeName;
		}
		public void setEducationTimeName(String educationTimeName) {
			this.educationTimeName = educationTimeName;
		}
		public String getRegdate() {
			return regdate;
		}
		public void setRegdate(String regdate) {
			this.regdate = regdate;
		}
		public int getViews() {
			return views;
		}
		public void setViews(int views) {
			this.views = views;
		}
		public int getPlaceNum() {
			return placeNum;
		}
		public void setPlaceNum(int placeNum) {
			this.placeNum = placeNum;
		}
		public int getEducationNum() {
			return educationNum;
		}
		public void setEducationNum(int educationNum) {
			this.educationNum = educationNum;
		}
		public String getFileName() {
			return fileName;
		}
		public void setFileName(String fileName) {
			this.fileName = fileName;
		}
		public String getCnt() {
			return cnt;
		}
		public String getrNum() {
			return rNum;
		}
		public void setrNum(String rNum) {
			this.rNum = rNum;
		}
		public void setCnt(String cnt) {
			this.cnt = cnt;
		}
		public MultipartFile getUploadFile() {
			return uploadFile;
		}
		public void setUploadFile(MultipartFile uploadFile) {
			this.uploadFile = uploadFile;
		}
		public MultipartFile getUploadFile2() {
			return uploadFile2;
		}
		public void setUploadFile2(MultipartFile uploadFile2) {
			this.uploadFile2 = uploadFile2;
		}
		public int getCategoryNum() {
			return categoryNum;
		}
		public void setCategoryNum(int categoryNum) {
			this.categoryNum = categoryNum;
		}
		public int getLearnIdx() {
			return learnIdx;
		}
		public void setLearnIdx(int learnIdx) {
			this.learnIdx = learnIdx;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getMainPhote() {
			return mainPhote;
		}
		public void setMainPhote(String mainPhote) {
			this.mainPhote = mainPhote;
		}

		public String getCategoryName() {
			return categoryName;
		}
		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getPlace() {
			return place;
		}
		public void setPlace(String place) {
			this.place = place;
		}
		public String getInquiry() {
			return inquiry;
		}
		public void setInquiry(String inquiry) {
			this.inquiry = inquiry;
		}

		public String getEducationTimeNum() {
			return educationTimeNum;
		}
		public void setEducationTimeNum(String educationTimeNum) {
			this.educationTimeNum = educationTimeNum;
		}
		public String getEducationNumber() {
			return educationNumber;
		}
		public void setEducationNumber(String educationNumber) {
			this.educationNumber = educationNumber;
		}
		public String getMemberNumber() {
			return memberNumber;
		}
		public void setMemberNumber(String memberNumber) {
			this.memberNumber = memberNumber;
		}
		public String getFee() {
			return fee;
		}
		public void setFee(String fee) {
			this.fee = fee;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}

		public String getSubtitle() {
			return subtitle;
		}
		public void setSubtitle(String subtitle) {
			this.subtitle = subtitle;
		}
		public String getTarget() {
			return target;
		}
		public void setTarget(String target) {
			this.target = target;
		}

		
		
		
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
		
		
		
		@Override
		public String toString() {
			return "LearnVO [categoryNum=" + categoryNum + ", learnIdx=" + learnIdx + ", placeNum=" + placeNum
					+ ", educationNum=" + educationNum + ", views=" + views + ", likeHit=" + likeHit + ", likeCheck="
					+ likeCheck + ", id=" + id + ", mainPhote=" + mainPhote + ", categoryName=" + categoryName
					+ ", title=" + title + ", place=" + place + ", educationTimeNum=" + educationTimeNum
					+ ", educationTime=" + educationTime + ", inquiry=" + inquiry + ", educationNumber="
					+ educationNumber + ", memberNumber=" + memberNumber + ", fee=" + fee + ", content=" + content
					+ ", subtitle=" + subtitle + ", target=" + target + ", regdate=" + regdate + ", regdate1="
					+ regdate1 + ", regdate2=" + regdate2 + ", cnt=" + cnt + ", rNum=" + rNum + ", fileName=" + fileName
					+ ", educationTimeName=" + educationTimeName + ", fileName2=" + fileName2 + ", uploadFile="
					+ uploadFile + ", uploadFile2=" + uploadFile2 + "]";
		}

}
