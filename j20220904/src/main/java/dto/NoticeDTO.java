package dto;

import java.util.Date;

public class NoticeDTO {
	
	private int    notice_code;
	private String notice_title;
	private Date   notice_date;
	private String notice_content;
	//private int    notice_type;
	
	// 조회용 변수 (게시판 이전글·다음글의 제목·날짜 )
	private String notice_title_before;
	private String notice_title_after;
	
	private Date notice_date_before;
	private Date notice_date_after;

	
	public Date getNotice_date_before() {
		return notice_date_before;
	}
	public void setNotice_date_before(Date notice_date_before) {
		this.notice_date_before = notice_date_before;
	}
	public Date getNotice_date_after() {
		return notice_date_after;
	}
	public void setNotice_date_after(Date notice_date_after) {
		this.notice_date_after = notice_date_after;
	}
	public String getNotice_title_before() {
		return notice_title_before;
	}
	public void setNotice_title_before(String notice_title_before) {
		this.notice_title_before = notice_title_before;
	}
	public String getNotice_title_after() {
		return notice_title_after;
	}
	public void setNotice_title_after(String notice_title_after) {
		this.notice_title_after = notice_title_after;
	}
	public int getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
}