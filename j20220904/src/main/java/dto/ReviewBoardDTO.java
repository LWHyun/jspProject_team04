package dto;

import java.sql.Date;

public class ReviewBoardDTO {
	private int rb_id;
	private String mem_id;
	private int product_id;
	
	private String rb_title;
	private String rb_content;
	private Date rb_date;
	private int rb_views;
	
	public int getRb_id() {
		return rb_id;
	}
	public void setRb_id(int rb_id) {
		this.rb_id = rb_id;
	}
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
	public String getRb_title() {
		return rb_title;
	}
	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}
	public String getRb_content() {
		return rb_content;
	}
	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}
	public Date getRb_date() {
		return rb_date;
	}
	public void setRb_date(Date rb_date) {
		this.rb_date = rb_date;
	}
	public int getRb_views() {
		return rb_views;
	}
	public void setRb_views(int rb_views) {
		this.rb_views = rb_views;
	}
	
	
}
