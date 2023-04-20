package management.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "DANH_MUC")
public class Category {
	@Id
	@Column(name = "MADM", length = 10)
	private String id;
	
	@Column(name = "TENDM", length = 250)
	private String name;
	
	@Column(name = "TRANGTHAI")
	private boolean status;
	
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<Product>();

	public Category() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
}
