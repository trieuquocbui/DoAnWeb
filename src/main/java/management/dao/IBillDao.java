package management.dao;

import java.util.List;

import management.entity.Bill;


public interface IBillDao {

	long getCountBill() ;
	
	public List<Bill> getListBill();
	
//	trạng thái đang chờ xử lý
	public List<Bill> getListBillTT(int status);
	
	public Bill getBill(int id);
	
	public void updateStatus(int idBill, int statusNew);
	
	int createBill(Bill bill);
	
	Bill getBillById(int id);
}