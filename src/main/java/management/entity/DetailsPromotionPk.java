package management.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Embeddable;

@Embeddable
public class DetailsPromotionPk implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String product;	
	private String promotion;

	public DetailsPromotionPk() {
		super();
	}
	
	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getPromotion() {
		return promotion;
	}

	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public int hashCode() {
		return Objects.hash(product, promotion);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DetailsPromotionPk other = (DetailsPromotionPk) obj;
		return Objects.equals(product, other.product) && Objects.equals(promotion, other.promotion);
	}

	
}
