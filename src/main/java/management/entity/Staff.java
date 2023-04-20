package management.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "NHAN_VIEN")
public class Staff {
	@Id
	@GeneratedValue
	@Column(name = "MANV", length = 10)
	private int id;
	
	@Column(name = "HO", length = 50)
	private String surname;
	
	@Column(name = "TEN", length = 50)
	private String name;
	
	@Column(name = "SDT", length = 10)
	private String phoneNumber;
	
	@Column(name = "CMND", length = 10)
	private String cMND;
	
	@Column(name = "GIOITINH", length = 10)
	private boolean gender;
	
	public String getcMND() {
		return cMND;
	}

	public void setcMND(String cMND) {
		this.cMND = cMND;
	}

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
	
	@OneToMany(mappedBy = "staff")
	private List<Promotion> promotions = new ArrayList<Promotion>();
	
	@OneToMany(mappedBy = "staff")
	private List<ProductExchangeVoucher> exchangeVouchers = new ArrayList<ProductExchangeVoucher>();

	@OneToMany(mappedBy = "staff")
	private List<Warranty> warranties = new ArrayList<Warranty>();
	
	@OneToMany(mappedBy = "staff")
	private List<Bill> bills = new ArrayList<Bill>();
	
	@OneToMany(mappedBy = "staff")
	private List<DetailsUpdatePrice> detailsUpdatePrices = new ArrayList<DetailsUpdatePrice>();

	public Staff() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public boolean getGender() {
		return gender;
	}

	public void setGender(boolean gender) {
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

	public List<Promotion> getPromotions() {
		return promotions;
	}

	public void setPromotions(List<Promotion> promotions) {
		this.promotions = promotions;
	}

	public List<ProductExchangeVoucher> getExchangeVouchers() {
		return exchangeVouchers;
	}

	public void setExchangeVouchers(List<ProductExchangeVoucher> exchangeVouchers) {
		this.exchangeVouchers = exchangeVouchers;
	}

	public List<Warranty> getWarranties() {
		return warranties;
	}

	public void setWarranties(List<Warranty> warranties) {
		this.warranties = warranties;
	}

	public List<Bill> getBills() {
		return bills;
	}

	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

	public List<DetailsUpdatePrice> getDetailsUpdatePrices() {
		return detailsUpdatePrices;
	}

	public void setDetailsUpdatePrices(List<DetailsUpdatePrice> detailsUpdatePrices) {
		this.detailsUpdatePrices = detailsUpdatePrices;
	}
	
	
	public String getBirthDaytoString() throws ParseException {
	    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy", Locale.ENGLISH);
	    String ngaySinhString = formatter.format(this.getDateOfBirth());
	    return ngaySinhString;
	    
	}
	public String getBirthDaytoStringYMD() throws ParseException {
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
	    String ngaySinhString = formatter.format(this.getDateOfBirth());
	    return ngaySinhString;
	    
	}

	
}
