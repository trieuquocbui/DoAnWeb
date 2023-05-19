package management.bean;

import java.util.List;

import management.entity.Product;

public class DetailReceipt {
	
	private int soLuong;
	private Double gia;

	private Product product;
	public Product getProduct() {
		return product;

	

	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public int getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}
	public Double getGia() {
		return gia;
	}
	public void setGia(Double gia) {
		this.gia = gia;
	}
	public DetailReceipt() {
		super();
	}
	
	
}
