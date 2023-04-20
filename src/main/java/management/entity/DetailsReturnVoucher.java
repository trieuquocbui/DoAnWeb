package management.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIET_SERI_TRA")
public class DetailsReturnVoucher {
	
	@EmbeddedId
	private DetailsReturnVoucherPk id;
	
	@ManyToOne
	@MapsId("seri")
	private Seri seri;
	
	@ManyToOne
	@MapsId("returnVoucher")
	private ProductReturnVoucher returnVoucher;
}
