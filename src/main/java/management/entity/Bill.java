package management.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "HOA_DON")
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MAHD")
	private int id;
	
	@Column(name = "TRANGTHAI")
	private int status;
	
	@Column(name = "NGAYAD")
	private Date createDate;
	
	@Column(name = "NGAYTAOHOADON")
	private Date applicableDate;
	
	@Column(name = "GHICHU")
	private String note;
	
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

	public int getId() {
		return id;
	}
	

	public int getStatus() {
		return status;
	}

	public void setId(int id) {
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public List<DetailsCart> getDetailsCarts() {
		return detailsCarts;
	}

	public void setDetailsCarts(List<DetailsCart> detailsCarts) {
		this.detailsCarts = detailsCarts;
	}


	
	
}
