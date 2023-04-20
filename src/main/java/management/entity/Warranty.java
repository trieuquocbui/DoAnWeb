package management.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "PHIEU_BAO_HANH")
public class Warranty {
	@Id
	@Column(name = "MAPBH", length = 10)
	private String id;
	
	@Column(name = "DIACHI", length = 500)
	private String address;
	
	@Column(name = "SDTKH", length = 10)
	private String phoneNumber;
	
	@Column(name = "NGAYBH", length = 10)
	private Date warrantyDate;
	
	@ManyToOne
    @JoinColumn(name = "SERI")
    private Seri seri;
	
	@ManyToOne
	@JoinColumn(name = "MANV")
	private Staff staff;
	
	
}
