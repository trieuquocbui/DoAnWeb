package management.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "SHIP")
public class Ship {
	@Id
	@Column(name = "MASHIP",length = 10)
	private String id;
	
	@Column(name = "TEN", length = 100)
	private String name;
	
	@Column(name = "GIA")
	private Double price;
	
	@OneToMany(mappedBy = "ship")
	private List<Bill> bills = new ArrayList<Bill>();
	
	@OneToMany(mappedBy = "ship")
	private List<ProductReturnVoucher> productReturnVouchers = new ArrayList<ProductReturnVoucher>();
}
