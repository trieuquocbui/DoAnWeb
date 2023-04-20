package management.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "PHIEU_NHAP")
public class Receipt {
	@Id
	@Column(name = "MAPN", length = 10)
	private String id;
	
	@Column(name = "NGAYNHAP")
	private Date importDate;
	
	@ManyToOne
	@JoinColumn(name = "MANCC")
	private Supplier supplier;
	
	@OneToMany(mappedBy = "receipt")
	private List<Seri> series = new ArrayList<Seri>();
}
