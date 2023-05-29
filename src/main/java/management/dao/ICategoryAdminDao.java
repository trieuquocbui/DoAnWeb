package management.dao;

import java.util.List;

import management.entity.Category;

public interface ICategoryAdminDao {
	
	List<Category> getAllDM();
	
	Category getDM(String madm);
	
	Integer updateCategory(Category dm);
	
	Integer insertCategory(Category dm);
	
	String creatMaDM();
	
	Category checkExistId(String madm);
}