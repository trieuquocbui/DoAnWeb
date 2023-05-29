package management.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class DetailsPromotionPk implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String product;
	
	private String promotion;

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

}
