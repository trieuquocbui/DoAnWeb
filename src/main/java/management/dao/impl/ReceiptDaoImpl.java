package management.dao.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transaction;
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
import management.entity.Seri;
import management.entity.Supplier;

@Repository
@Transactional
public class ReceiptDaoImpl implements IReceiptDao {

	@Autowired
	private SessionFactory sessionFactory;

	/*
	 * @Override public void createReceipt(final Receipt receipt) { Session s =
	 * sessionFactory.openSession();
	 * 
	 * try {
	 * 
	 * s.beginTransaction();
	 * 
	 * String saveCustomer = (String) s.save(receipt);
	 * 
	 * s.getTransaction().commit();
	 * 
	 * return; } catch (Exception e) {
	 * 
	 * System.out.println(e);
	 * 
	 * s.getTransaction().rollback();
	 * 
	 * } finally { s.close(); }
	 * 
	 * }
	 */

	// Tạo Mã Phiếu Nhập tự sinh
	@Override
	public Long getNumberOfReceipt() {
		Session s = sessionFactory.openSession();

		String hql = "select count(ncc.id) from Receipt ncc";

		Query query = s.createQuery(hql);

		Iterator count = query.iterate();

		Long iLong = (Long) count.next() + 1L;
		s.close();
		return iLong;
	}

	@Override
	public Long getNumberOfSeri() {
		Session s = sessionFactory.openSession();

		String hql = "select count(ncc.id) from Seri ncc";

		Query query = s.createQuery(hql);

		Iterator count = query.iterate();

		Long iLong = (Long) count.next() + 1L;
		s.close();
		return iLong;
	}

	@Override
	public void createReCeipt(String id, Supplier supplier, Date date) {
		Session s = sessionFactory.openSession();
		try {

			s.beginTransaction();

			Receipt receipt = new Receipt();
			receipt.setId(id);
			receipt.setImportDate(date);
			receipt.setSupplier(supplier);
			s.save(receipt);
			s.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e);
			s.getTransaction().rollback();

		} finally {
			s.close();
		}
	}

	// TÌm kiếm Nhà cung cấp dựa trên ID
	@Override
	public Supplier findById(String id) {
		Session session = sessionFactory.openSession();
		try {

			String hqlString = "FROM Supplier where column=: ID_Supplier";
			Query query = session.createQuery(hqlString);
			query.setParameter("ID_Supplier", id);
			Supplier entity = (Supplier) query.uniqueResult();
			session.getTransaction().commit();

			return entity;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public Supplier getSupplierlById(String id) {
		
		Session s = sessionFactory.openSession();
		if(s==null) {
			s=sessionFactory.getCurrentSession();
		}
		String hql = "select b from Supplier b where b.id = ?";
		Supplier supplier = null;
		Query query = s.createQuery(hql);
		try {
			query.setParameter(0, id);
			supplier = (Supplier) query.list().get(0);
		} finally {
			s.close();
		}
		return supplier;
	}

	@Override
	public Receipt getReceiptlById(String id) {
		Session s = sessionFactory.openSession();
		if(s==null) {
			s=sessionFactory.getCurrentSession();
		}
		String hql = "select b from Receipt b where b.id = ?";
		Receipt receipt = null;
		Query query = s.createQuery(hql);
		try {
			query.setParameter(0, id);
			receipt = (Receipt) query.list().get(0);
		} finally {
			s.close();
		}
		return receipt;

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
			String hqlString = "FROM Supplier";
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
			String hqlString = "FROM Product WHERE status = 1 ";
			Query query = session.createQuery(hqlString);
			list = query.list();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("132_Supplier");
		}
		return list;
	}

	public static List<DetailReceipt> list = new ArrayList<>();

	@Override
	public List<DetailReceipt> get_DetailReceipts(String id, String name, int soluong, Double gia) {
		DetailReceipt detailReceipt = new DetailReceipt();

		detailReceipt.setSoLuong(soluong);
		detailReceipt.setGia(gia);
		list.add(detailReceipt);
		if (list.size() != 0) {
			return list;
		}
		return null;
	}

	@Override
	public void create_Serial(Seri seri) {

		Session s = sessionFactory.openSession();
		try {
			s.beginTransaction();

			s.save(seri);
			s.getTransaction().commit();
		} catch (Exception e) {
			System.out.println(e);
			s.getTransaction().rollback();

		} finally {
			s.close();
		}
	}

	@Override
	public List<Receipt> getListReceipt() {

		Session session = sessionFactory.openSession();

		String hgl = "From Receipt";

		Query query = session.createQuery(hgl);

		List<Receipt> list = query.list();

		return list;
	}

	// Hàm lấy sản phẩm từ mã Phiếu Nhập
	@Override
	public HashMap<Product, Long> getListProduct_From_Reeipt(String id ) {

		Session session = sessionFactory.openSession();

		String hql = "SELECT s.product FROM Seri s WHERE s.receipt.id = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		
		List <Product> list = (List<Product>)query.list();
		
		Set<Product> l = new  HashSet<>(list);
		
		
		 list = new ArrayList<>(l);
		 HashMap<Product, Long> map = new HashMap<>();
		for (Product product : list) {
			String hqlCount = "Select count(*) from Seri s where s.product.id = :pdid and s.receipt.id = :reid";
			query = session.createQuery(hqlCount);
			query.setParameter("pdid", product.getId());
			query.setParameter("reid", id);
			map.put(product, (Long) query.list().get(0));
		} 
		

		return map;
	}
	// Hàm lấy giá nhập từ số seri
	
	@Override
	public Double getPriceofSeri(String idpn, String idsp) {

		Session session = sessionFactory.openSession();

		String hql = "SELECT seri.importPrice FROM Seri seri WHERE seri.receipt.id = :receiptId AND seri.product.id = :productId";
	    Query query = session.createQuery(hql);
	    query.setParameter("receiptId", idpn);
	    query.setParameter("productId", idsp);
	    Double importPrice = (Double) query.list().get(0);
	    return importPrice ;
	}
}