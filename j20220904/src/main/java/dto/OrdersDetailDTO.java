package dto;

public class OrdersDetailDTO {

	// orders_detail
	private int order_id;
	private int size_num;
	private int product_id;
	private int cnt;
	private int order_price;
	
	
	public OrdersDetailDTO() {}
	
	public OrdersDetailDTO(int size_num, int product_id, int cnt, int order_price) {
		
		super();
		this.size_num = size_num;
		this.product_id = product_id;
		this.cnt = cnt;
		this.order_price = order_price;
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

	@Override
	public String toString() {
		return "OrdersDetailDTO [order_id=" + order_id + ", size_num=" + size_num + ", product_id=" + product_id
				+ ", cnt=" + cnt + ", order_price=" + order_price + "]";
	}
	
	
}