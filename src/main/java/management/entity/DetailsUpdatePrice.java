package management.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CT_CAPNHAT_GIA")
public class DetailsUpdatePrice {
	@EmbeddedId
	private DetailsUpdatePricePK id;

	@Column(name = "GIA")
	private Double price;
	
	@MapsId("productId")
	@ManyToOne
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "MANV")
	private Staff staff;
	
	@OneToMany(mappedBy = "detailsUpdatePrice")
	private List<DetailsCart> detailsCarts = new ArrayList<DetailsCart>();

	public DetailsUpdatePrice() {
		super();
	}

	public DetailsUpdatePricePK getId() {
		return id;
	}

	public void setId(DetailsUpdatePricePK id) {
		this.id = id;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public List<DetailsCart> getDetailsCarts() {
		return detailsCarts;
	}

	public void setDetailsCarts(List<DetailsCart> detailsCarts) {
		this.detailsCarts = detailsCarts;
	}
	
	
	
	
}
