package management.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class DetailsPromotionPk implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String product;
	
	private String promotion;

}
