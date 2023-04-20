package management.dao;

import java.util.List;

import management.entity.Account;
import management.entity.Staff;

public interface IStaffDao {

	List<Staff>getListStaff();
	public void addStaff(Staff staff,Account account);
	
}
