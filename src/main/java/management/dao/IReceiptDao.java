package management.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import management.bean.DetailReceipt;
import management.entity.Product;
import management.entity.Receipt;
import management.entity.Seri;
import management.entity.Supplier;

public interface IReceiptDao {
	//void createReceipt(Receipt receipt);
	Long getNumberOfReceipt();
	Supplier findById(String id);
	String getCurrentDate();
	List<Supplier> getAllSupplier();	
	List<Product> getAllProduct();
	List<DetailReceipt> get_DetailReceipts(String id, String name, int soluong, Double gia);
	void create_Serial(Seri seri);
	void createReCeipt(String id, Supplier supplier, Date date);
	Supplier getSupplierlById(String id);
	 Long getNumberOfSeri();
	 Receipt getReceiptlById(String id);
	 List<Receipt> getListReceipt();
	 HashMap<Product, Long> getListProduct_From_Reeipt(String id );
	// HashMap<Product, Integer> getListProductAndProductNumByReceiId(String receiptId);
	 Double getPriceofSeri(String idpn, String idsp);
}
