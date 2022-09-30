package dto;

import java.util.List;

public class OrdersPageDTO {

	
	private List<OrdersInfoDTO> orders;

	public List<OrdersInfoDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrdersInfoDTO> orders) {
		this.orders = orders;
	}
}
