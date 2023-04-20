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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getImportDate() {
		return importDate;
	}

	public void setImportDate(Date importDate) {
		this.importDate = importDate;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public List<Seri> getSeries() {
		return series;
	}

	public void setSeries(List<Seri> series) {
		this.series = series;
	}

	public Receipt() {
		super();
	}
	
}
