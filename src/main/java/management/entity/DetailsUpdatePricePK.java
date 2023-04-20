package management.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class DetailsUpdatePricePK implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "NGAYAPDUNG")
	private Date applicableDate;
	
	private String productId;
	
}
