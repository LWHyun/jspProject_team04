package dto;

public class MyPage_Order_statusDTO {
	private int order_status;
	private int cnt;
	
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "MyPage_Order_statusDTO [order_status=" + order_status + ", cnt=" + cnt + "]";
	}
	
	
	
}
