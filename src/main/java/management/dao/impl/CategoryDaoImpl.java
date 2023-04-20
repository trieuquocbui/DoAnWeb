package management.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.ICategoryDao;
import management.entity.Category;

@Repository
@Transactional
public class CategoryDaoImpl implements ICategoryDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> getCategoriesIsAcctive(boolean b) {
		
		Session s = sessionFactory.openSession();
		
		String hql = "select ca from Category ca where ca.status = ?";
		
		Query query = s.createQuery(hql);
		
		query.setParameter(0,  b);
		
		return query.list();
	}

}
