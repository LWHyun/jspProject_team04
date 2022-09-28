package dto;

public class Product_SizeDTO {
	
	private int product_id; //제품코드
	private int size_num; //사이즈별 일련번호
	private int pd_size; //사이즈
	private int stock; //재고
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getSize_num() {
		return size_num;
	}
	public void setSize_num(int size_num) {
		this.size_num = size_num;
	}
	public int getPd_size() {
		return pd_size;
	}
	public void setPd_size(int pd_size) {
		this.pd_size = pd_size;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
	
}

