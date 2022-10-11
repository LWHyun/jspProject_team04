package dto;

import java.util.Date;

public class Product_Like_ProDTO {
	private int product_id; //제품코드
	private String mem_id; //회원 아이디
	private Date like_pro_date; //찜한 날짜
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
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
}
