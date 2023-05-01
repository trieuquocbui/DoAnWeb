package management.dao;

import java.util.List;

import management.entity.DetailsCart;

public interface IDetailsCartDao {
	List<DetailsCart> getDetailsCartsOfCustomerYetBuy(String idCustomer);
	
	List<DetailsCart> getDetailsCartsOfCustomerWasBought(String idCustomer);
	
	void save(DetailsCart cart);
	
	DetailsCart getDetailsCartById(Long id);
	
	void deteleDetailsCart(DetailsCart detailsCart);
	
	DetailsCart updateDetailsCart(DetailsCart detailsCart);
}
