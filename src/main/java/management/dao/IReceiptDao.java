package management.dao;

import java.util.List;

import management.bean.DetailReceipt;
import management.entity.Product;
import management.entity.Receipt;
import management.entity.Supplier;

public interface IReceiptDao {
	void createReceipt(Receipt receipt);
	Long getNumberOfReceipt();
	Supplier findById(String id);
	String getCurrentDate();
	List<Supplier> getAllSupplier();	
	List<Product> getAllProduct();
	List<DetailReceipt> get_DetailReceipts(String id, String name, int soluong, int gia);
}
