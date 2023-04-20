package management.dao;

import management.entity.Role;

public interface IRoleDao {
	Role createRole(Role role);
	boolean existsByName(String name);
}
