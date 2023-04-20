package management.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.IRoleDao;
import management.entity.Role;

@Repository
@Transactional
public class RoleDaoImpl implements IRoleDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Role createRole(Role role) {
		
		
		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();
			
			String saveRole = (String) s.save(role);
			
			System.out.println(saveRole);

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
	public boolean existsByName(String name) {
		
		Session s = sessionFactory.openSession();
		
		String hql = "select 1 from Role r where r.name = ?";
		
		Query query = s.createQuery(hql);
		
		query.setParameter(0, name);
		
		return (query.uniqueResult() != null);
	}

}
