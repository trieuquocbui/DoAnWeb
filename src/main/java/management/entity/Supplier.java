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
}
