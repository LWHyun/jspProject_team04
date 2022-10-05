package dto;

import java.util.Date;

public class MyPage_OrdersDTO {
	// orders_detail
	private int order_id;
	private int size_num;
	private int product_id;
	private int cnt;
	private int order_price;
	
	// orders
	private String mem_id;
	private String order_status;
	private Date order_date;
	
	// product_size
	private int pd_size;
	
	// product
	private int gender;
	private String brand;
	private String kor_name;
	
	// product_image
	private String s_file_path;

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getSize_num() {
		return size_num;
	}

	public void setSize_num(int size_num) {
		this.size_num = size_num;
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

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getPd_size() {
		return pd_size;
	}

	public void setPd_size(int pd_size) {
		this.pd_size = pd_size;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
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

	public String getS_file_path() {
		return s_file_path;
	}

	public void setS_file_path(String s_file_path) {
		this.s_file_path = s_file_path;
	}

	@Override
	public String toString() {
		return "MyPage_OrdersDTO [order_id=" + order_id + ", size_num=" + size_num + ", product_id=" + product_id
				+ ", cnt=" + cnt + ", order_price=" + order_price + ", mem_id=" + mem_id + ", order_status="
				+ order_status + ", order_date=" + order_date + ", pd_size=" + pd_size + ", gender=" + gender
				+ ", brand=" + brand + ", kor_name=" + kor_name + ", s_file_path=" + s_file_path + "]";
	}
	
	
}
