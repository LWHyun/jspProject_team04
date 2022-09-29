package dto;

import java.sql.Date;

public class SearchClickDTO {
	private String sc_word;
	private int sc_count;
	private Date sc_date;
	public String getSc_word() {
		return sc_word;
	}
	public void setSc_word(String sc_word) {
		this.sc_word = sc_word;
	}
	public int getSc_count() {
		return sc_count;
	}
	public void setSc_count(int sc_count) {
		this.sc_count = sc_count;
	}
	public Date getSc_date() {
		return sc_date;
	}
	public void setSc_date(Date sc_date) {
		this.sc_date = sc_date;
	}
	
	
}
