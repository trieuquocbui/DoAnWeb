package management.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIET_KHUYENMAI")
public class DetailsPromotion {
	
	@EmbeddedId
	private DetailsPromotionPk id;
	
	@ManyToOne
	@MapsId("product")
	private Product product;
	
	@ManyToOne
	@MapsId("promotion")
	private Promotion promotion;

	public DetailsPromotion() {
		super();
	}
	
	public DetailsPromotionPk getId() {
		return id;
	}

	public void setId(DetailsPromotionPk id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Promotion getPromotion() {
		return promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}
	
}
