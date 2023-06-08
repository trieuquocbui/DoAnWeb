package management.entity;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SAN_PHAM")
public class Product {

	@Id
	@Column(name = "MASP", length = 10)
	private String id;
	
	@Column(name = "TENSP", columnDefinition = "nvarchar(100)")
	private String name; 
	
	@Column(name = "MAUSAC",columnDefinition = "nvarchar(100)")
	private String color;
	
	@Column(name = "CHATLIEU",columnDefinition = "nvarchar(100)")
	private String material;
	
	@Column(name = "KICHTHUOC")
	private String size;
	
	@Column(name = "MOTA",columnDefinition = "nvarchar(4000)")
	private String description;
	
	@Column(name = "HANG", columnDefinition = "nvarchar(100)")
	private String branch;
	
	@Column(name = "TRANGTHAI")
	private boolean status;
	
	@Column(name = "THOIGIANBH_THANG")
	private int warrantyPeriod;
	
	@Column(name = "THOIGIANTRAHANG_NGAY")
	private int deliveryTime;
	
	@OneToMany(mappedBy = "product")
	private Set<Seri> seri; 
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "MADM")
	private Category category;
	
	@OneToMany(mappedBy = "product")
	private Set<DetailsPromotion> detailsPromotions; 
	
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	private List<DetailsUpdatePrice> detailsUpdatePrices = new ArrayList<DetailsUpdatePrice>();

	public Product() {
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

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getWarrantyPeriod() {
		return warrantyPeriod;
	}

	public void setWarrantyPeriod(int warrantyPeriod) {
		this.warrantyPeriod = warrantyPeriod;
	}

	public int getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(int deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public Set<Seri> getSeri() {
		return seri;
	}

	public void setSeri(Set<Seri> seri) {
		this.seri = seri;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<DetailsPromotion> getDetailsPromotions() {
		return detailsPromotions;
	}

	public void setDetailsPromotions(Set<DetailsPromotion> detailsPromotions) {
		this.detailsPromotions = detailsPromotions;
	}

	public List<DetailsUpdatePrice> getDetailsUpdatePrices() {
		return detailsUpdatePrices;
	}

	public void setDetailsUpdatePrices(List<DetailsUpdatePrice> detailsUpdatePrices) {
		this.detailsUpdatePrices = detailsUpdatePrices;
	}

	
	
}