package management.dao.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.bean.DetailReceipt;
import management.dao.IReceiptDao;
import management.entity.Customer;
import management.entity.Product;
import management.entity.Receipt;
import management.entity.Supplier;

@Repository
@Transactional
public class ReceiptDaoImpl implements IReceiptDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void createReceipt(final Receipt receipt) {
		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();

			String saveCustomer = (String) s.save(receipt);

			s.getTransaction().commit();

			return;
		} catch (Exception e) {

			System.out.println(e);

			s.getTransaction().rollback();

		} finally {
			s.close();
		}

	}
	
	//Tạo Mã Phiếu Nhập tự sinh
	@Override
	public Long getNumberOfReceipt() {		
		Session s = sessionFactory.openSession();
		
		String hql = "select count(ncc.id) from Supplier ncc";
		
		Query query = s.createQuery(hql);
		
		Iterator count = query.iterate();
		
		return (Long) count.next()+1L;
	}

	// TÌm kiếm Nhà cung cấp dựa trên ID
	@Override
	public Supplier findById(String id) {
		Session session=sessionFactory.openSession();
		try {
			
		
		String hqlString="FROM Supplier where column=: ID_Supplier";
		Query query = session.createQuery(hqlString);
		query.setParameter("ID_Supplier", "id");
		Supplier entity = (Supplier) query.uniqueResult();
		session.getTransaction().commit();
		
		return entity;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return null;
	}

	// Hàm láy ngày hiện tại
	@Override
	public String getCurrentDate() {
		LocalDate currentDate = LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	    String formattedDate = currentDate.format(formatter);
	    return formattedDate;
	}

	// Hàm lấy danh sách các nhà cung cấp
	@Override
	public List<Supplier> getAllSupplier() {
		List<Supplier> list = new ArrayList<>();
		try {
			Session session = sessionFactory.openSession();
			String hqlString="FROM Supplier";
			Query query = session.createQuery(hqlString);
			 list = query.list();
			 session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("112_Supplier");
		}
		return list;
		
	}

	// Lấy DSSP
	@Override
	public List<Product> getAllProduct() {
		
		List<Product> list = new ArrayList<>();
		try {
			Session session = sessionFactory.openSession();
			String hqlString="FROM Product WHERE status = 1 ";
			Query query = session.createQuery(hqlString);
			 list = query.list();
			 session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("132_Supplier");
		}
		return list;
	}

	public static List<DetailReceipt> list= new ArrayList<>();
	@Override
	public List<DetailReceipt> get_DetailReceipts(String id, String name, int soluong, int gia) {
		DetailReceipt detailReceipt = new DetailReceipt();
		detailReceipt.setId(id);
		detailReceipt.setName(name);
		detailReceipt.setSoLuong(soluong);
		detailReceipt.setGia(gia);
		list.add(detailReceipt);
		if(list.size()!=0) 
		{
			return list;
		}
		return null;
	}

	
	
	
	
	
	
	
}
