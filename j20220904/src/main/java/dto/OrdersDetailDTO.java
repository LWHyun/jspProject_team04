package dto;

public class OrdersDetailDTO {

	// orders_detail
	private int order_id;
	private int size_num;
	private int product_id;
	private int cnt;
	private int order_price;
		
	// product_size
	private int pd_size;
		
	// product
	private int gender;
	private String brand;
	private String kor_name;
	private String s_file_path;	
	
	public OrdersDetailDTO() {}
	
	public OrdersDetailDTO(int order_id, int size_num, int product_id, int cnt, int order_price, int pd_size,
			int gender, String brand, String kor_name, String s_file_path) {
			super();
			this.order_id = order_id;
			this.size_num = size_num;
			this.product_id = product_id;
			this.cnt = cnt;
			this.order_price = order_price;
			this.pd_size = pd_size;
			this.gender = gender;
			this.brand = brand;
			this.kor_name = kor_name;
			this.s_file_path = s_file_path;
			
	}

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
	
}
