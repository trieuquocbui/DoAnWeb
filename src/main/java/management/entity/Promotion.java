package management.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "KHUYEN_MAI")
public class Promotion {
	@Id
	@Column(name = "MAKM", length = 10)
	private String id;

	@Column(name = "TENKM", columnDefinition = "nvarchar(500)")
	private String name;

	@Column(name = "NGAYBD")
	private Date startDate;

	@Column(name = "NGAYKT")
	private Date endDate;

	@Column(name = "MUCKM")
	private Double promotionLitmit;
	
	@Column(name = "TRANGTHAI")
	private boolean status;

	@ManyToOne
	@JoinColumn(name = "MANV")
	private Staff staff;
	
	@OneToMany(mappedBy = "promotion",fetch = FetchType.EAGER)
	private Set<DetailsPromotion> detailsPromotions;

	public Promotion() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Double getPromotionLitmit() {
		return promotionLitmit;
	}

	public void setPromotionLitmit(Double promotionLitmit) {
		this.promotionLitmit = promotionLitmit;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Set<DetailsPromotion> getDetailsPromotions() {
		return detailsPromotions;
	}

	public void setDetailsPromotions(Set<DetailsPromotion> detailsPromotions) {
		this.detailsPromotions = detailsPromotions;
	}

}
