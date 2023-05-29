package management.dao;

import java.util.Date;
import java.util.List;

import management.entity.Category;
import management.entity.DetailsUpdatePricePK;
import management.entity.Product;

public interface IProductAdminDao {
	
	List<Product> getAllSP();
	
	Product getSP(String masp);
	
	Integer updateProduct(Product pd);
	
	Integer insertProduct(Product pd);
	
	String creatMaSP();
	
	List<Category> getAllLoai();
	
	Category getLoaibyId(String maloai);

	Integer updateStatusSeri(String masp);
}
