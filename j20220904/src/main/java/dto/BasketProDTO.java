package dto;

import java.util.Objects;

public class BasketProDTO {
	private String mem_id;
	private int product_id;
	private int cnt;
	private int size_num;
	
	
	
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
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getSize_num() {
		return size_num;
	}
	public void setSize_num(int size_num) {
		this.size_num = size_num;
	}
	@Override
	public int hashCode() {
		return Objects.hash(mem_id, product_id, size_num);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BasketProDTO other = (BasketProDTO) obj;
		return Objects.equals(mem_id, other.mem_id) && product_id == other.product_id && size_num == other.size_num;
	}
	@Override
	public String toString() {
		return "BasketProDTO [mem_id=" + mem_id + ", product_id=" + product_id + ", cnt=" + cnt + ", size_num="
				+ size_num + "]";
	}
	
	
	
}
