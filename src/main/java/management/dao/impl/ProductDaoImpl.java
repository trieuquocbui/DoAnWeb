package management.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.IProductDao;
import management.entity.Product;
import management.entity.Supplier;

@Repository
@Transactional
public class ProductDaoImpl implements IProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getProductsIsAcctive(boolean b, int position, int pageSize) {

		Session s = sessionFactory.openSession();

		String hql = "select sp from Product sp where sp.status = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, b);

		query.setFirstResult(position);

		query.setMaxResults(pageSize);

		return query.list();
	}

	@Override
	public List<Product> getProductsOfCategory(String categoryId, int position, int pageSize) {

		Session s = sessionFactory.openSession();

		String hql = "select sp from Product sp where sp.category.id = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, categoryId);

		query.setFirstResult(position);

		query.setMaxResults(pageSize);

		return query.list();
	}

	@Override
	public long getQuantityProductsIsAcctive(boolean b) {

		Session s = sessionFactory.openSession();

		String hql = "select count(sp) from Product sp where sp.status = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, b);

		return (long) query.uniqueResult();
	}

	@Override
	public long getQuantityProductsOfCategory(String categoryId) {
		Session s = sessionFactory.openSession();

		String hql = "select count(sp) from Product sp where sp.category.id = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, categoryId);

		return (long) query.uniqueResult();
	}

	@Override
	public List<Product> getProductsContainingString(String name, int position, int pageSize) {
		Session s = sessionFactory.openSession();

		String hql = "select sp from Product sp where sp.name like ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, "%"+name+"%");

		query.setFirstResult(position);

		query.setMaxResults(pageSize);

		return query.list();
	}

	@Override
	public long getQuantityProductsContainingString(String name) {
		Session s = sessionFactory.openSession();

		String hql = "select count(sp) from Product sp where sp.name like ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, "%"+name+"%");

		return (long) query.uniqueResult();
	}

	@Override
	public Product getProductById(String id) {
		Session s = sessionFactory.openSession();
		String hql = "select b from Product b where b.id = ?";
Product supplier=null;
		Query query = s.createQuery(hql);
		try {
			
			
			
			query.setParameter(0, id);
			supplier=(Product) query.list().get(0);
		} finally {
			s.close();
		}
		return supplier;
	}

}
