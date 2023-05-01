package management.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "KHACH_HANG")
public class Customer {
	@Id
	@Column(name = "MAKH", length = 10)
	private String id;
	
	@Column(name = "HO", length = 50)
	private String surname;
	
	@Column(name = "TEN", length = 50)
	private String name;
	
	@Column(name = "SDT", length = 10)
	private String phoneNumber;
	
	@Column(name = "GIOITINH", length = 10)
	private String gender;
	
	@Column(name = "DIACHI", length = 1000)
	private String address;
	
	@Column(name = "ANH", length = 500)
	private String image;
	
	@Column(name = "NGAYSINH")
	@DateTimeFormat(pattern = "dd-mm-yyyy")
	private Date dateOfBirth;
	
	@OneToOne
	@JoinColumn(name = "EMAIL")
	private Account account;
	
	@OneToMany(mappedBy = "customer")
	private List<ProductExchangeVoucher> exchangeVouchers = new ArrayList<ProductExchangeVoucher>();
	
//	@OneToOne(mappedBy = "customer")
//	private DetailsCart detailsCart;
	
	@OneToMany(mappedBy = "customer")
	private List<DetailsCart> detailsCarts = new ArrayList<DetailsCart>();

	public Customer() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<ProductExchangeVoucher> getExchangeVouchers() {
		return exchangeVouchers;
	}

	public void setExchangeVouchers(List<ProductExchangeVoucher> exchangeVouchers) {
		this.exchangeVouchers = exchangeVouchers;
	}

	public List<DetailsCart> getDetailsCarts() {
		return detailsCarts;
	}

	public void setDetailsCarts(List<DetailsCart> detailsCarts) {
		this.detailsCarts = detailsCarts;
	}

//	public DetailsCart getDetailsCart() {
//		return detailsCart;
//	}
//
//	public void setDetailsCart(DetailsCart detailsCart) {
//		this.detailsCart = detailsCart;
//	}
	
	




	
	
	
}
