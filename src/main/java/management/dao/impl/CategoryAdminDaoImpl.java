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

import management.dao.ICategoryAdminDao;
import management.entity.Category;

@Transactional
@Repository
public class CategoryAdminDaoImpl implements ICategoryAdminDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Category> getAllDM() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Category where status = true";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
	
	public Category getDM(String madm) {
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM Category WHERE status = true AND id = :madm";
	        Query query = session.createQuery(hql);
			query.setParameter("madm", madm);
	        Category category = (Category) query.uniqueResult();
	        return category;
	    } catch (HibernateException ex) {
	        System.out.println("Lỗi: " + ex.getMessage());
	        return null;
	    } finally {
	        session.close();
	    }
	}

	public Integer updateCategory(Category dm) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(dm);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer insertCategory(Category dm) {

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(dm);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public String creatMaDM() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		int max = 0;
		for (Category dm : list) {
			String a = dm.getId().replace("dm", "");
			int b = Integer.parseInt(a.strip());
			if (b > max) {
				max = b;
			} else {
				max = max;
			}

		}

		String masp = "dm" + String.valueOf(max + 1);
		return masp;

	}
	
	public Category checkExistId(String madm) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Category where id=:madm";
		Query query = session.createQuery(hql);
		query.setParameter("madm", madm);
		List<Category> dm =  query.list();
		session.close();
				
		if(dm.size()!=0) return  dm.get(0);	
		else return null;					
	}
}
