package management.dao;

import java.util.List;

import management.entity.Customer;

public interface ICustomerDao {
	Customer createCustomer(Customer customer);

	Long getNumberOfCustomer();

	List<Customer> getListCustomer();

}
