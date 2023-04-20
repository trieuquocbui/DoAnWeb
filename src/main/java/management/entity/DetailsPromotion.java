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
	
}
