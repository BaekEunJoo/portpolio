package com.spring.Imuseum.product;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class ProductVO {
	private int productnum, discount;
	private String id, category, photo1, photo2, photo3, photo4, productname, price, 
	productcontent;
	
	private Date regdate;
	private int existence;
	
	@JsonIgnore
	private String searchCondition = "PRODUCTNAME";
	@JsonIgnore
	private String searchKeyword = "PRODUCTCONTENT";	
	
	// 파일업로드
	@JsonIgnore
	private MultipartFile uploadFile1;	
	@JsonIgnore
	private MultipartFile uploadFile2;	
	@JsonIgnore
	private MultipartFile uploadFile3;	
	@JsonIgnore
	private MultipartFile uploadFile4;	
	@JsonIgnore
	private MultipartFile uploadFile5;	
	
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhoto1() {
		return photo1;
	}
	public void setPhoto1(String photo1) {
		this.photo1 = photo1;
	}
	public String getPhoto2() {
		return photo2;
	}
	public void setPhoto2(String photo2) {
		this.photo2 = photo2;
	}
	public String getPhoto3() {
		return photo3;
	}
	public void setPhoto3(String photo3) {
		this.photo3 = photo3;
	}
	public String getPhoto4() {
		return photo4;
	}
	public void setPhoto4(String photo4) {
		this.photo4 = photo4;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getProductcontent() {
		return productcontent;
	}
	public void setProductcontent(String productcontent) {
		this.productcontent = productcontent;
	}
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss",
			timezone = "Asia/Seoul")
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getExistence() {
		return existence;
	}
	public void setExistence(int existence) {
		this.existence = existence;
	}
	
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
	
	// 파일 업로드 ---------------------------------
	public MultipartFile getUploadFile1() {
		return uploadFile1;
	}
	public void setUploadFile1(MultipartFile uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}
	public MultipartFile getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(MultipartFile uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	public MultipartFile getUploadFile3() {
		return uploadFile3;
	}
	public void setUploadFile3(MultipartFile uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}
	public MultipartFile getUploadFile4() {
		return uploadFile4;
	}
	public void setUploadFile4(MultipartFile uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}
	public MultipartFile getUploadFile5() {
		return uploadFile5;
	}
	public void setUploadFile5(MultipartFile uploadFile5) {
		this.uploadFile5 = uploadFile5;
	}
	@Override
	public String toString() {
		return "ProductVO [productnum=" + productnum + ", id=" + id + ", category=" + category + ", photo1=" + photo1
				+ ", photo2=" + photo2 + ", photo3=" + photo3 + ", photo4=" + photo4 + ", productname=" + productname
				+ ", price=" + price + ", regdate="
				+ regdate + ",discount=" + discount + ", existence=" + existence + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", uploadFile1=" + uploadFile1 + ", uploadFile2=" + uploadFile2 + ", uploadFile3="
				+ uploadFile3 + ", uploadFile4=" + uploadFile4 + ", uploadFile5=" + uploadFile5 + "]";
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}

	
}
