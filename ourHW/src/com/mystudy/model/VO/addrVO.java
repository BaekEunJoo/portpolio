package com.mystudy.model.VO;

public class addrVO {
	private String
	delName,
	delGetter,
	delPhone,
	delAddr;
	private int userNo;
	private int delNo;

	
	
	public addrVO(String delName, String delGetter, String delPhone, String delAddr, int userNo, int delNo) {
		
		this.delName = delName;
		this.delGetter = delGetter;
		this.delPhone = delPhone;
		this.delAddr = delAddr;
		this.userNo = userNo;
		this.delNo = delNo;
	}
	
	public addrVO(String delName, String delGetter, String delPhone, String delAddr, int userNo) {
		
		this.delName = delName;
		this.delGetter = delGetter;
		this.delPhone = delPhone;
		this.delAddr = delAddr;
		this.userNo = userNo;
	}
	public addrVO(String delName, String delGetter, String delPhone, String delAddr) {
		
		this.delName = delName;
		this.delGetter = delGetter;
		this.delPhone = delPhone;
		this.delAddr = delAddr;
		
	
	}
	
	public String getDelName() {
		return delName;
	}

	public void setDelName(String delName) {
		this.delName = delName;
	}

	public String getDelGetter() {
		return delGetter;
	}

	public void setDelGetter(String delGetter) {
		this.delGetter = delGetter;
	}

	public String getDelPhone() {
		return delPhone;
	}

	public void setDelPhone(String delPhone) {
		this.delPhone = delPhone;
	}

	public String getDelAddr() {
		return delAddr;
	}

	public void setDelAddr(String delAddr) {
		this.delAddr = delAddr;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getDelNo() {
		return delNo;
	}

	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}

	@Override
	public String toString() {
		return "addrVO [delName=" + delName + ", delGetter=" + delGetter + ", delPhone=" + delPhone + ", delAddr="
				+ delAddr + ", userNo=" + userNo + ", delNo=" + delNo + "]";
	}
	
	
	
	
}
