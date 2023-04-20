package management.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.ISeriDao;

@Repository
@Transactional
public class SeriDaoImpl implements ISeriDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public long getQuantitySeriOfProduct(String idProdcut) {
		Session s = sessionFactory.openSession();

		String hql = "select count(s) from Seri s where s.product.id = ? and s.status = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, idProdcut);
		
		query.setParameter(1, false);

		return (long) query.uniqueResult();
	}

}
