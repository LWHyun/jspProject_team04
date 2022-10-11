package dto;

import java.util.Date;
import java.util.List;

public class MyPage_OrdersDTO {
	// orders
	private int order_id;
	private String mem_id;
	private String order_name;
	private String order_phone;
	private String order_email;
	private String take_name;
	private String take_phone;
	private String take_zipcode;
	private String take_addr1;
	private String take_addr2;
	private String order_msg;
	private Date order_date;
	private int order_status; // 0 , 1
	
	// MyPage_OrdersDetailDTO 리스트
	private List<MyPage_OrdersDetailDTO> list;
	
	public MyPage_OrdersDTO() {}

	public MyPage_OrdersDTO(int order_id, String mem_id, String order_name, String order_phone, String order_email,
			String take_name, String take_phone, String take_zipcode, String take_addr1, String take_addr2,
			String order_msg, Date order_date, int order_status, List<MyPage_OrdersDetailDTO> list) {
		super();
		this.order_id = order_id;
		this.mem_id = mem_id;
		this.order_name = order_name;
		this.order_phone = order_phone;
		this.order_email = order_email;
		this.take_name = take_name;
		this.take_phone = take_phone;
		this.take_zipcode = take_zipcode;
		this.take_addr1 = take_addr1;
		this.take_addr2 = take_addr2;
		this.order_msg = order_msg;
		this.order_date = order_date;
		this.order_status = order_status;
		this.list = list;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}

	public String getOrder_phone() {
		return order_phone;
	}

	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}

	public String getOrder_email() {
		return order_email;
	}

	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}

	public String getTake_name() {
		return take_name;
	}

	public void setTake_name(String take_name) {
		this.take_name = take_name;
	}

	public String getTake_phone() {
		return take_phone;
	}

	public void setTake_phone(String take_phone) {
		this.take_phone = take_phone;
	}

	public String getTake_zipcode() {
		return take_zipcode;
	}

	public void setTake_zipcode(String take_zipcode) {
		this.take_zipcode = take_zipcode;
	}

	public String getTake_addr1() {
		return take_addr1;
	}

	public void setTake_addr1(String take_addr1) {
		this.take_addr1 = take_addr1;
	}

	public String getTake_addr2() {
		return take_addr2;
	}

	public void setTake_addr2(String take_addr2) {
		this.take_addr2 = take_addr2;
	}

	public String getOrder_msg() {
		return order_msg;
	}

	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}

	public List<MyPage_OrdersDetailDTO> getList() {
		return list;
	}

	public void setList(List<MyPage_OrdersDetailDTO> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "MyPage_OrdersDTO [order_id=" + order_id + ", mem_id=" + mem_id + ", order_name=" + order_name
				+ ", order_phone=" + order_phone + ", order_email=" + order_email + ", take_name=" + take_name
				+ ", take_phone=" + take_phone + ", take_zipcode=" + take_zipcode + ", take_addr1=" + take_addr1
				+ ", take_addr2=" + take_addr2 + ", order_msg=" + order_msg + ", order_date=" + order_date
				+ ", order_status=" + order_status + ", list=" + list + "]";
	}
}
