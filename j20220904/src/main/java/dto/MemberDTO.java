package dto;

import java.util.Date;
import java.util.Objects;

public class MemberDTO {
	private String mem_id;
	private String mem_name;
	private String mem_pwd;
	private String mem_email1;
	private String mem_email2;
	private String mem_tel;
	private String mem_zipcode;
	private String mem_addr1;
	private String mem_addr2;
	private Date mem_rogDate;
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_email1() {
		return mem_email1;
	}
	public void setMem_email1(String mem_email1) {
		this.mem_email1 = mem_email1;
	}
	public String getMem_email2() {
		return mem_email2;
	}
	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}
	public String getMem_tel() {
		return mem_tel;
	}
	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_addr1() {
		return mem_addr1;
	}
	public void setMem_addr1(String mem_addr1) {
		this.mem_addr1 = mem_addr1;
	}
	public String getMem_addr2() {
		return mem_addr2;
	}
	public void setMem_addr2(String mem_addr2) {
		this.mem_addr2 = mem_addr2;
	}
	public Date getMem_rogDate() {
		return mem_rogDate;
	}
	public void setMem_rogDate(Date mem_rogDate) {
		this.mem_rogDate = mem_rogDate;
	}
	@Override
	public String toString() {
		return "MemberDTO [mem_id=" + mem_id + ", mem_name=" + mem_name + ", mem_pwd=" + mem_pwd + ", mem_email1="
				+ mem_email1 + ", mem_email2=" + mem_email2 + ", mem_tel=" + mem_tel + ", mem_zipcode=" + mem_zipcode
				+ ", mem_addr1=" + mem_addr1 + ", mem_addr2=" + mem_addr2 + ", mem_rogDate=" + mem_rogDate + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(mem_addr1, mem_addr2, mem_email1, mem_email2, mem_id, mem_name, mem_pwd, mem_rogDate,
				mem_tel, mem_zipcode);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		return Objects.equals(mem_addr1, other.mem_addr1) && Objects.equals(mem_addr2, other.mem_addr2)
				&& Objects.equals(mem_email1, other.mem_email1) && Objects.equals(mem_email2, other.mem_email2)
				&& Objects.equals(mem_id, other.mem_id) && Objects.equals(mem_name, other.mem_name)
				&& Objects.equals(mem_pwd, other.mem_pwd) && Objects.equals(mem_rogDate, other.mem_rogDate)
				&& Objects.equals(mem_tel, other.mem_tel) && Objects.equals(mem_zipcode, other.mem_zipcode);
	}
	
	
	
}
