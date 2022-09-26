package dto;

import java.util.Date;

public class Product_ImgSrcDTO {
	private int product_id; //제품코드
	private String brand;  //브랜드
	private String eng_name; //영어이름
	private String kor_name; //한글이름
	private int gender; //성별
	private long price; // 가격
	private String color; // 색상
	private Date regdate; //등록일
	private long ca_code; // 카테고리 코드
	
	private String s_file_path; //제품 이미지 작은사진 경로
	private String l_file_path; //제품 이미지 큰사진 경로
	
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public long getCa_code() {
		return ca_code;
	}
	public void setCa_code(long ca_code) {
		this.ca_code = ca_code;
	}
	public String getS_file_path() {
		return s_file_path;
	}
	public void setS_file_path(String s_file_path) {
		this.s_file_path = s_file_path;
	}
	public String getL_file_path() {
		return l_file_path;
	}
	public void setL_file_path(String l_file_path) {
		this.l_file_path = l_file_path;
	}



}
