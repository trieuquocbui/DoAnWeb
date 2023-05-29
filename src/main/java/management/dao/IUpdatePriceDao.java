package management.dao;

import java.util.Date;
import java.util.List;

import management.entity.DetailsUpdatePrice;
import management.entity.DetailsUpdatePricePK;
import management.entity.Staff;

public interface IUpdatePriceDao {
	Integer insertDetailsUpdatePrice(DetailsUpdatePrice pr, DetailsUpdatePricePK pr1);
	
	Integer updateDetailsUpdatePrice(DetailsUpdatePrice pr);
	
	Staff getStaff(String manv);
	
	DetailsUpdatePrice getDetailsUpdatePrice(String masp, DetailsUpdatePricePK id);
	
	List<Object[]> listDetailsUpdatePrice();
}
