package management.dao;

import java.util.List;

import management.entity.Account;
import management.entity.Staff;

public interface IStaffDao {

	List<Staff>getListStaff(int status);
	public void addStaff(Staff staff,Account account);
	public void updateStaff(Staff staff,Account account);
	
}
