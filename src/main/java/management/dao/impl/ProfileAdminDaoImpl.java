package management.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.dao.IProfileAdminDao;
import management.entity.Staff;
import management.entity.Account;

@Transactional
@Repository
public class ProfileAdminDaoImpl implements IProfileAdminDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Staff getStaffByEmail(String id) {
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM Staff s WHERE s.account.email =:id";
	        Query query = session.createQuery(hql);
			query.setParameter("id", id);
	        Staff staff = (Staff) query.uniqueResult();
	        return staff;
	    } catch (HibernateException ex) {
	        System.out.println("Lỗi: " + ex.getMessage());
	        return null;
	    } finally {
	        session.close();
	    }
	}
	
	public Integer updateStaff(Staff nv, Account tk) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(nv);
			session.update(tk);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}
}
