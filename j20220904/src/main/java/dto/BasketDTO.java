package dto;

public class BasketDTO {
	private String mem_id;
	private int product_id;
	private int cnt;
	private int size_num;
	private int stock;
	//
	
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	private String brand;
	private String eng_name;
	private String kor_name;
	private int gender;
	private int price;
	
	//
	private String s_file_path; //제품 이미지 작은사진 경로
	private int pd_size;
	
	//
	private String like_pro_date;
	
	
	
	public String getLike_pro_date() {
		return like_pro_date;
	}
	public void setLike_pro_date(String like_pro_date) {
		this.like_pro_date = like_pro_date;
	}
	public int getPd_size() {
		return pd_size;
	}
	public void setPd_size(int pd_size) {
		this.pd_size = pd_size;
	}
	public String getS_file_path() {
		return s_file_path;
	}
	public void setS_file_path(String s_file_path) {
		this.s_file_path = s_file_path;
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
	private String color;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getSize_num() {
		return size_num;
	}
	public void setSize_num(int size_num) {
		this.size_num = size_num;
	}
	

	@Override
	public String toString() {
		return "BasketDTO [mem_id=" + mem_id + ", product_id=" + product_id + ", cnt=" + cnt + ", size_num=" + size_num
				+ ", brand=" + brand + ", eng_name=" + eng_name + ", kor_name=" + kor_name + ", gender=" + gender
				+ ", price=" + price + ", color=" + color + ", getBrand()=" + getBrand() + ", getEng_name()="
				+ getEng_name() + ", getKor_name()=" + getKor_name() + ", getGender()=" + getGender() + ", getPrice()="
				+ getPrice() + ", getColor()=" + getColor() + ", getMem_id()=" + getMem_id() + ", getProduct_id()="
				+ getProduct_id() + ", getCnt()=" + getCnt() + ", getSize_num()=" + getSize_num() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
}
