package management.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "NHA_CUNG_CAP")
public class Supplier {
	@Id
	@Column(name = "MANCC",length = 10)
	private String id;
	
	@Column(name = "TENNCC", length = 200)
	private String name;
	
	@Column(name = "SDT",length = 10)
	private String phoneNumber;
	
	@Column(name = "DIACHI", length = 500)
	private String address;
	
	@OneToMany(mappedBy = "supplier")
	private List<Receipt> receipts = new ArrayList<Receipt>();

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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public List<Receipt> getReceipts() {
		return receipts;
	}

	public void setReceipts(List<Receipt> receipts) {
		this.receipts = receipts;
	}

	public Supplier() {
		super();
	}
	
}
