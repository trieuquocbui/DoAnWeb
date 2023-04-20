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

	@Column(name = "TENKM", length = 500)
	private String name;

	@Column(name = "NGAYBD")
	private Date startDate;

	@Column(name = "NGAYKT")
	private Date endDate;

	@Column(name = "MUCKM")
	private Double promotionLitmit;

	@ManyToOne
	@JoinColumn(name = "MANV")
	private Staff staff;
	
	@OneToMany(mappedBy = "promotion",fetch = FetchType.EAGER)
	private Set<DetailsPromotion> detailsPromotions; 

}
