package management.dao;

import java.util.List;

import management.entity.Customer;

public interface ICustomerDao {
	Customer createCustomer(Customer customer);

	Long getNumberOfCustomer();

	List<Customer> getListCustomer();

	Customer getCustomerByEmail(String email);
	
	void updateCustomer(Customer customer);
}
