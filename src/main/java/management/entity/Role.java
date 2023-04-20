package management.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "CHUC_VU")
public class Role implements Serializable{
	@Id
	@Column(name = "MACV", length = 10)
	private String id;
	
	@Column(name = "TENCV",length = 100)
	private String name;
	
	@OneToMany(mappedBy = "role")
	private List<Account> accounts = new ArrayList<Account>();

	public Role() {
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

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}
	
	
}
