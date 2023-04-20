package management.dao.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.dao.ISupplierDao;
import management.entity.Customer;
import management.entity.Supplier;

@Repository
@Transactional
public class SupplierDaoImpl implements ISupplierDao {

	@Autowired
	private SessionFactory sessionFactory;

	// Lấy Mã NCC tự động
	@Override
	public Long getNumberOfCustomer() {		
		Session s = sessionFactory.openSession();
		
		String hql = "select count(ncc.id) from Supplier ncc";
		
		Query query = s.createQuery(hql);
		
		Iterator count = query.iterate();
		
		return (Long) count.next()+1L;
	}

	// Thêm NCC vào CSDL
	@Override
	public boolean addSupplier(Supplier supplier) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(supplier);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(57);
			session.getTransaction().rollback();
			
		}finally {
			session.close();
		}
		return false;
	}

	
	
	// Lấy danh sách nhà cung cấp
	@Override
	public List<Supplier> get_ListSupplier() {
		List<Supplier> list = new ArrayList<>();
		try {
			Session session = sessionFactory.openSession();
			String hqlString="FROM Supplier";
			Query query = session.createQuery(hqlString);
			 list = query.list();
			 session.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("73_SupplierDao");
		}
		return list;
		
	}
}
