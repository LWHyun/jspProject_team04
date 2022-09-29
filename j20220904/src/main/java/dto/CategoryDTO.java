package dto;

public class CategoryDTO {
	private int ca_code;		//카테고리 코드
	private String ca_name;		//카테고리 이름
	private int ca_code_ref;	//상위 카테고리
	
	public int getCa_code() {
		return ca_code;
	}
	public void setCa_code(int ca_code) {
		this.ca_code = ca_code;
	}
	public String getCa_name() {
		return ca_name;
	}
	public void setCa_name(String ca_name) {
		this.ca_name = ca_name;
	}
	public int getCa_code_ref() {
		return ca_code_ref;
	}
	public void setCa_code_ref(int ca_code_ref) {
		this.ca_code_ref = ca_code_ref;
	}
	
	
	
}
