package management.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TAI_KHOAN")
public class Account {
	@Id
	@Column(name = "EMAIL", length = 500)
	private String email;
	
	@Column(name = "MATKHAU", length = 60)
	private String password;
	
	@Column(name = "TRANHTHAI")
	private int status;
	
	@ManyToOne
	@JoinColumn(name = "MACV")
	private Role role;
	
	@OneToOne(mappedBy = "account")
	private Customer customer;
	
	@OneToOne(mappedBy = "account")
	private Staff staff;

	public Account() {
		super();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int isStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}
	
}
