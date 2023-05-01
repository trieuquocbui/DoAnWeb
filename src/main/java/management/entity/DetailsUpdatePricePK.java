package management.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class DetailsUpdatePricePK implements Serializable {
	private static final long serialVersionUID = 1L;

	@Column(name = "NGAYAPDUNG")
	private Date applicableDate;
	
	private String productId;

	public Date getApplicableDate() {
		return applicableDate;
	}

	public void setApplicableDate(Date applicableDate) {
		this.applicableDate = applicableDate;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(applicableDate, productId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		DetailsUpdatePricePK other = (DetailsUpdatePricePK) obj;
		return Objects.equals(applicableDate, other.applicableDate) && Objects.equals(productId, other.productId);
	}
	
	
	
	
	
}
