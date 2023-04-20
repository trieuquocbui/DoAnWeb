package management.entity;

import java.io.Serializable;

import javax.persistence.Embeddable;

@Embeddable
public class DetailsReturnVoucherPk implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private String seri;
	
	private String returnVoucher;
}
