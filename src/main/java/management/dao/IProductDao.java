package management.dao;

import java.util.List;

import management.entity.Product;

public interface IProductDao {
	List<Product> getProductsIsAcctive(boolean b,int position, int pageSize);
	
	List<Product> getProductsOfCategory(String categoryId,int position, int pageSize);
	
	List<Product> getProductsContainingString(String name,int position, int pageSize);
	
	long getQuantityProductsIsAcctive(boolean b);
	
	long getQuantityProductsOfCategory(String categoryId);
	
	long getQuantityProductsContainingString(String name);
	
	Product getProductById(String id);
}
