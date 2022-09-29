package dto;

import java.util.Date;

public class LikeProDTO {
	private String product_id;
	private String mem_id;
	private Date like_pro_date;
	
	// 찜 추가 정보
	private String brand;
	private String kor_name;
	private int price;
	private int gender;
	private String s_file_path;
	
	// getter / setter
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getLike_pro_date() {
		return like_pro_date;
	}
	public void setLike_pro_date(Date like_pro_date) {
		this.like_pro_date = like_pro_date;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getS_file_path() {
		return s_file_path;
	}
	public void setS_file_path(String s_file_path) {
		this.s_file_path = s_file_path;
	}
	
	// toString()
	@Override
	public String toString() {
		return "LikeProDTO [product_id=" + product_id + ", mem_id=" + mem_id + ", like_pro_date=" + like_pro_date
				+ ", brand=" + brand + ", kor_name=" + kor_name + ", price=" + price + ", gender=" + gender
				+ ", s_file_path=" + s_file_path + "]";
	}
	
	
}
