package management.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIET_SERI_DOI")
public class DetailsExchangeVoucher {
	
	@EmbeddedId
	private DetailsExchangeVoucherPk id;
	
	@ManyToOne
	@MapsId("seri")
	private Seri seri;
	
	@ManyToOne
	@MapsId("exchangeVoucher")
	private ProductExchangeVoucher exchangeVoucher;
}
