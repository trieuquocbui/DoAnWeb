package management.dao.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.dao.IProductAdminDao;
import management.entity.Category;
import management.entity.DetailsUpdatePricePK;
import management.entity.Product;

@Transactional
@Repository
public class ProductAdminDaoImpl implements IProductAdminDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getAllSP() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Product p WHERE p.status = true AND p.id NOT IN (SELECT d.product.id FROM DetailsUpdatePrice d)";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		return list;
	}

	@Override
	public Product getSP(String masp) {
		Session session = sessionFactory.openSession();
		try {
			String hql = "FROM Product WHERE status = true AND id = :masp";
			Query query = session.createQuery(hql);
			query.setParameter("masp", masp);
			Product product = (Product) query.uniqueResult();
			return product;
		} catch (HibernateException ex) {
			System.out.println("Lỗi: " + ex.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	@Override
	public Integer updateProduct(Product pd) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(pd);
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
	public Integer insertProduct(Product pd) {

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pd);
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
	public String creatMaSP() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		int max = 0;
		for (Product sp : list) {
			String a = sp.getId().replace("sp", "");
			int b = Integer.parseInt(a.strip());
			if (b > max) {
				max = b;
			} else {
				max = max;
			}

		}

		String masp = "sp" + String.valueOf(max + 1);
		return masp;

	}

	@Override
	public List<Category> getAllLoai() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Category where status = true";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}

	@Override
	public Category getLoaibyId(String maloai) {
		Session session = sessionFactory.openSession();
		try {
			String hql = "FROM Category WHERE status = true AND id = :maloai";
			Query query = session.createQuery(hql);
			query.setParameter("maloai", maloai);
			Category category = (Category) query.uniqueResult();
			return category;
		} catch (HibernateException ex) {
			System.out.println("Lỗi: " + ex.getMessage());
			return null;
		} finally {
			session.close();
		}
	}

	@Override
	public Integer updateStatusSeri(String masp) {
		Session session = sessionFactory.openSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			String hql = "UPDATE Seri s SET s.status = false WHERE s.product.id = :masp";
			Query query = session.createQuery(hql);
			query.setParameter("masp", masp);
			int r = query.executeUpdate();
			transaction.commit();
			return r;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
			return 0;
		} finally {
			session.close();
		}
	}
}
