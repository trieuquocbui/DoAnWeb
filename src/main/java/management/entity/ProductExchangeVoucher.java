package management.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PHIEU_DOI")
public class ProductExchangeVoucher {
	@Id
	@Column(name = "MAPD",length = 10)
	private String id;
	
	@Column(name = "NGAYDOI")
	private Date exchangeDate;
	
	@OneToOne(mappedBy = "productExchangeVoucher")
	private ProductReturnVoucher productReturnVoucher;
	
	@ManyToOne
	@JoinColumn(name = "MAKH")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name = "MANV")
	private Staff staff;
	
	@OneToMany(mappedBy = "exchangeVoucher")
	private Set<DetailsExchangeVoucher> detailsExchangeVouchers; 
	
}
