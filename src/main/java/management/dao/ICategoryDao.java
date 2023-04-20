package management.dao;

import java.util.List;

import management.entity.Category;

public interface ICategoryDao {
	List<Category> getCategoriesIsAcctive(boolean b);
}
