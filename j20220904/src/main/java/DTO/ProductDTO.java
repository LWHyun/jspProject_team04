package DTO;

import java.util.Date;

public class ProductDTO {
	private int product_id; //제품코드
	private String brand;  //브랜드
	private String eng_name; //영어이름
	private String kor_name; //한글이름
	private int gender; //성별
	private int price; // 가격
	private String color; // 색상
	private Date regdate; //등록일
	private int ca_code; // 카테고리 코드
	
	//getter, setter 생성
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
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
	public int getCa_code() {
		return ca_code;
	}
	public void setCa_code(int ca_code) {
		this.ca_code = ca_code;
	}
	
	
	

	
	
}
