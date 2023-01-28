package com.spring.Imuseum.learn;

public class GroupReservationVO {
	private int groupInfomation, applicant, card, quantityMethod, reservationIdx;
	private String datepicker, wantTime, groupName, memberNumber, relationship, content, id, name, programTitle, regdate, regdate1, regdate2, groupValue;
	
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	public int getReservationIdx() {
		return reservationIdx;
	}
	public void setReservationIdx(int reservationIdx) {
		this.reservationIdx = reservationIdx;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public String getGroupValue() {
		return groupValue;
	}
	public void setGroupValue(String groupValue) {
		this.groupValue = groupValue;
	}
	public String getProgramTitle() {
		return programTitle;
	}
	public void setProgramTitle(String programTitle) {
		this.programTitle = programTitle;
	}
	public int getGroupInfomation() {
		return groupInfomation;
	}
	public void setGroupInfomation(int groupInfomation) {
		this.groupInfomation = groupInfomation;
	}
	public int getApplicant() {
		return applicant;
	}
	public void setApplicant(int applicant) {
		this.applicant = applicant;
	}
	public int getCard() {
		return card;
	}
	public void setCard(int card) {
		this.card = card;
	}
	public int getQuantityMethod() {
		return quantityMethod;
	}
	public void setQuantityMethod(int quantityMethod) {
		this.quantityMethod = quantityMethod;
	}
	public String getDatepicker() {
		return datepicker;
	}
	public void setDatepicker(String datepicker) {
		this.datepicker = datepicker;
	}
	public String getWantTime() {
		return wantTime;
	}
	public void setWantTime(String wantTime) {
		this.wantTime = wantTime;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getMemberNumber() {
		return memberNumber;
	}
	public void setMemberNumber(String memberNumber) {
		this.memberNumber = memberNumber;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "GroupReservationVO [groupValue=" + groupValue + ", groupInfomation=" + groupInfomation + ", applicant="
				+ applicant + ", card=" + card + ", quantityMethod=" + quantityMethod + ", reservationIdx="
				+ reservationIdx + ", datepicker=" + datepicker + ", wantTime=" + wantTime + ", groupName=" + groupName
				+ ", memberNumber=" + memberNumber + ", relationship=" + relationship + ", content=" + content + ", id="
				+ id + ", name=" + name + ", programTitle=" + programTitle + ", regdate=" + regdate + ", regdate1="
				+ regdate1 + ", regdate2=" + regdate2 + "]";
	}
	
	
	
}
