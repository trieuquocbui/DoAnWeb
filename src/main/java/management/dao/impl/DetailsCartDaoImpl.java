package management.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.IDetailsCartDao;
import management.entity.Customer;
import management.entity.DetailsCart;
import management.entity.Role;

@Repository
@Transactional
public class DetailsCartDaoImpl implements IDetailsCartDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<DetailsCart> getDetailsCartsOfCustomerYetBuy(String idCustomer) {
		Session s = sessionFactory.openSession();

		String hql = "select dc from DetailsCart dc where dc.customer.id = ? and dc.status = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, idCustomer);

		query.setParameter(1, false);

		return query.list();
	}

	@Override
	public void save(DetailsCart cart) {

		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();
			
			s.save(cart);
			
			s.getTransaction().commit();

		} catch (Exception e) {
			
			s.getTransaction().rollback();

		} finally {
			s.close();
		}

	}

	@Override
	public DetailsCart getDetailsCartById(Long id) {
		
		Session s = sessionFactory.openSession();

		String hql = "select dc from DetailsCart dc where dc.id = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, id);

		return (DetailsCart) query.list().get(0);
		
	}

	@Override
	public void deteleDetailsCart(DetailsCart detailsCart) {
		Session s = sessionFactory.openSession();
		try {
			
			s.beginTransaction();
			
			s.delete(detailsCart);
			
			s.getTransaction().commit();
			
		} catch(Exception e) {
			
			s.getTransaction().rollback();
			
		} finally {
			s.close();
		}
		
		
		
	}

	@Override
	public DetailsCart updateDetailsCart(DetailsCart detailsCart) {
		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();

			s.update(detailsCart);

			s.getTransaction().commit();

			return detailsCart;
		} catch (Exception e) {

			s.getTransaction().rollback();

		} finally {
			s.close();
		}

		return null;
	}

	@Override
	public List<DetailsCart> getDetailsCartsOfCustomerWasBought(String idCustomer) {
		Session s = sessionFactory.openSession();

		String hql = "select dc from DetailsCart dc where dc.customer.id = ? and dc.status = ? and dc.bill is null";

		Query query = s.createQuery(hql);

		query.setParameter(0, idCustomer);

		query.setParameter(1, true);
		
		return query.list();
	}

}
