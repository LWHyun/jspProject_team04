package dto;

public class Product_ImgDTO {
	private int pro_image; //제품 이미지 번호
	private int product_id;	//제품 코드	
	private String s_file_path; //제품 이미지 작은사진 경로
	private String l_file_path; //제품 이미지 큰사진 경로
	
	
	public int getPro_image() {
		return pro_image;
	}
	public void setPro_image(int pro_image) {
		this.pro_image = pro_image;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getS_file_path() {
		return s_file_path;
	}
	public void setS_file_path(String s_file_path) {
		this.s_file_path = s_file_path;
	}
	public String getL_file_path() {
		return l_file_path;
	}
	public void setL_file_path(String l_file_path) {
		this.l_file_path = l_file_path;
	}
	
	
	
	
}
