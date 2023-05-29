package management.dao;

import management.entity.Account;
import management.entity.Staff;

public interface IProfileAdminDao {
	Staff getStaffByEmail(String id);
	
	Integer updateStaff(Staff nv, Account tk);
}
