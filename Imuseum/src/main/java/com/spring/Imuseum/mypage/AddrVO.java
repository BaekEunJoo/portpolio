package com.spring.Imuseum.mypage;

public class AddrVO {
	
	private int addrNum;
	private String id, addr, addrDetail, addrPhone, addrGetter, addrDefault, postNum;
	
	public AddrVO() {
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getAddrNum() {
		return addrNum;
	}

	public void setAddrNum(int addrNum) {
		this.addrNum = addrNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getAddrPhone() {
		return addrPhone;
	}

	public void setAddrPhone(String addrPhone) {
		this.addrPhone = addrPhone;
	}

	public String getAddrGetter() {
		return addrGetter;
	}

	public void setAddrGetter(String addrGetter) {
		this.addrGetter = addrGetter;
	}

	public String getAddrDefault() {
		return addrDefault;
	}

	public void setAddrDefault(String addrDefault) {
		this.addrDefault = addrDefault;
	}

	public String getPostNum() {
		return postNum;
	}

	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}

	@Override
	public String toString() {
		return "AddrVO [addrNum=" + addrNum + ", id=" + id + ", addr=" + addr + ", addrDetail=" + addrDetail
				+ ", addrPhone=" + addrPhone + ", addrGetter=" + addrGetter + ", addrDefault=" + addrDefault
				+ ", postNum=" + postNum + "]";
	}


	
}
