package management.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.IShipDao;
import management.entity.Ship;

@Repository  
@Transactional
public class ShipDao implements IShipDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Ship getShipId(String id) {
		Session s = sessionFactory.openSession();

		String hql = "select s from Ship s where s.id = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, id);

		return (Ship) query.list().get(0);
	}

}
