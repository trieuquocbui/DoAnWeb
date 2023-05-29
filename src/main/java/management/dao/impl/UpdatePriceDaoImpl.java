package management.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.dao.IUpdatePriceDao;
import management.entity.DetailsUpdatePrice;
import management.entity.DetailsUpdatePricePK;
import management.entity.Staff;


@Transactional
@Repository
public class UpdatePriceDaoImpl implements IUpdatePriceDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Integer insertDetailsUpdatePrice(DetailsUpdatePrice pr, DetailsUpdatePricePK pr1) {

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pr);
			//session.save(pr1);
			t.commit();
			
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	@Override
	public Integer updateDetailsUpdatePrice(DetailsUpdatePrice pr) {

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(pr);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
	
	@Override
	public Staff getStaff(String manv) {
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM Staff WHERE status = true AND id = :manv";
	        Query query = session.createQuery(hql);
			query.setParameter("manv", manv);
	        Staff staff = (Staff) query.uniqueResult();
	        return staff;
	    } catch (HibernateException ex) {
	        System.out.println("Lỗi1: " + ex.getMessage());
	        return null;
	    } finally {
	        session.close();
	    }
	}
	
	@Override
	public DetailsUpdatePrice getDetailsUpdatePrice(String masp, DetailsUpdatePricePK id) {	
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM DetailsUpdatePrice d WHERE d.product.id = :masp AND d.id =:id";
	        Query query = session.createQuery(hql);
			query.setParameter("masp", masp);
			query.setParameter("id", id);
			DetailsUpdatePrice detailsUpdatePrice = (DetailsUpdatePrice) query.uniqueResult();
	        return detailsUpdatePrice;
	    } catch (HibernateException ex) {
	        System.out.println("Lỗi2: " + ex.getMessage());
	        return null;
	    } finally {
	        session.close();
	    }
	}
	
	@Override
	public List<Object[]> listDetailsUpdatePrice() {
		Session session = sessionFactory.openSession();
		String hql = "SELECT d, p FROM DetailsUpdatePrice d JOIN d.product p";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		
		return list;
	}
}
