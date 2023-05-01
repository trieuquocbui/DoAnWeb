package management.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.ICustomerDao;
import management.entity.Customer;
import management.entity.Product;

@Repository
@Transactional
public class CustomerDaoImpl implements ICustomerDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Customer createCustomer(Customer customer) {

		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();

			String saveCustomer = (String) s.save(customer);

			System.out.println(saveCustomer);

			System.out.println(saveCustomer);

			s.getTransaction().commit();

			return null;
		} catch (Exception e) {

			System.out.println(e);

			s.getTransaction().rollback();

		} finally {
			s.close();
		}

		return null;
	}

	@Override
	public Long getNumberOfCustomer() {

		Session s = sessionFactory.openSession();

		String hql = "select count(kh.id) from Customer kh";

		Query query = s.createQuery(hql);

		Iterator count = query.iterate();

		return (Long) count.next();
	}

	@Override
	public List<Customer> getListCustomer() {

		Session session = sessionFactory.openSession();

		String hgl = "From Customer";

		Query query = session.createQuery(hgl);

		List<Customer> list = query.list();

		return list;
	}

	@Override
	public Customer getCustomerById(String id) {
		Session s = sessionFactory.openSession();

		String hql = "select c from Customer c where c.id = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, id);

		return (Customer) query.list().get(0);
	}

	@Override
	public Customer update(Customer customer) {
		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();

			s.update(customer);

			s.getTransaction().commit();

			return customer;
		} catch (Exception e) {

			s.getTransaction().rollback();

		} finally {
			s.close();
		}

		return null;
	}

}
