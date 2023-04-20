package management.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SOSERI")
public class Seri {
	@Id
	@Column(name = "SOSERI")
	private String id;
	
	@Column(name = "GIANHAP")
	private Double importPrice;
	
	@Column(name = "TRANGTHAI")
	private boolean status;
	
	@Column(name = "NGAYBAN")
	private Date saleDate;
	
	@OneToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name = "MASP",referencedColumnName = "MASP")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "MAPN")
	private Receipt receipt;
	
	@OneToMany(mappedBy = "seri")
	private List<Warranty> warranties = new ArrayList<Warranty>();
	
	@OneToMany(mappedBy = "seri")
	private Set<DetailsReturnVoucher> detailsReturnVouchers; 
	
	@OneToMany(mappedBy = "seri")
	private Set<DetailsExchangeVoucher> detailsExchangeVouchers;

	public Seri() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Double getImportPrice() {
		return importPrice;
	}

	public void setImportPrice(Double importPrice) {
		this.importPrice = importPrice;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Date getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Receipt getReceipt() {
		return receipt;
	}

	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}

	public List<Warranty> getWarranties() {
		return warranties;
	}

	public void setWarranties(List<Warranty> warranties) {
		this.warranties = warranties;
	}

	public Set<DetailsReturnVoucher> getDetailsReturnVouchers() {
		return detailsReturnVouchers;
	}

	public void setDetailsReturnVouchers(Set<DetailsReturnVoucher> detailsReturnVouchers) {
		this.detailsReturnVouchers = detailsReturnVouchers;
	}

	public Set<DetailsExchangeVoucher> getDetailsExchangeVouchers() {
		return detailsExchangeVouchers;
	}

	public void setDetailsExchangeVouchers(Set<DetailsExchangeVoucher> detailsExchangeVouchers) {
		this.detailsExchangeVouchers = detailsExchangeVouchers;
	}
	
	

}
