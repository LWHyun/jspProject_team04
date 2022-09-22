package product.bean;

public class Product_ImageDTO {
	private int pro_image; //제품 이미지 번호
	private int product_id;	//제품 코드	
	private String file_path; //제품 이미지 경로
	
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
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	
	
}
