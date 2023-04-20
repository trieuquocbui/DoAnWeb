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
@Table(name = "HOA_DON")
public class Bill {
	@Id
	@Column(name = "MAHD", length = 10)
	private String id;
	
	@Column(name = "TRANGTHAI")
	private int status;
	
	@Column(name = "NGAYAD")
	private Date createDate;
	
	@Column(name = "NGAYTAOHOADON")
	private Date applicableDate;
	
	@ManyToOne
	@JoinColumn(name = "MASHIP")
	private Ship ship;
	
	@ManyToOne
	@JoinColumn(name = "MANV")
	private Staff staff;
	
	@OneToMany(mappedBy = "bill")
	private List<DetailsCart> detailsCarts;

	public Bill() {
		super();
	}

	public String getId() {
		return id;
	}
	

	public int getStatus() {
		return status;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int isStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getApplicableDate() {
		return applicableDate;
	}

	public void setApplicableDate(Date applicableDate) {
		this.applicableDate = applicableDate;
	}

	public Ship getShip() {
		return ship;
	}

	public void setShip(Ship ship) {
		this.ship = ship;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}


	
	
}
