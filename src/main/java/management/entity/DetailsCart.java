package management.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CHITIET_GIOHANG")
public class DetailsCart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	private Customer customer;
	
	@ManyToOne
	private DetailsUpdatePrice detailsUpdatePrice; 
	
	@Column(name = "SOLUONG")
	private Integer quantity;
	
	@Column(name = "TRANGTHAI")
	private boolean status;
	
	@ManyToOne
	@JoinColumn(name="MAHD", nullable=false)
	private Bill bill;
	
	
}
