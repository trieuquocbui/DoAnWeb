package management.dao;

import management.entity.Account;
import management.entity.Customer;

public interface IAccountDao {
	Account createAccountOfCustomer(Account account);
	
	Account checkEmail(String em);
	public void addAccount (Account account);
	int deleteAccount(String em);
}
