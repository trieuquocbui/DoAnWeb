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

import management.dao.IPromotionAdminDao;
import management.entity.DetailsPromotion;
import management.entity.DetailsPromotionPk;
import management.entity.Product;
import management.entity.Promotion;

@Transactional
@Repository
public class PromotionAdminDaoImpl implements IPromotionAdminDao {

	@Autowired
	private SessionFactory sessionFactory;

	public List<Promotion> getAllKM() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Promotion WHERE endDate>=:currentDate and status = true";
	    Query query = session.createQuery(hql);
	    query.setParameter("currentDate", new Date());
		List<Promotion> list = query.list();
		return list;
	}
	
	public Promotion getKM(String makm) {
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM Promotion WHERE endDate>=:currentDate and status = true AND id = :makm";
	        Query query = session.createQuery(hql);
			query.setParameter("makm", makm);
			query.setParameter("currentDate", new Date());
	        Promotion promotion = (Promotion) query.uniqueResult();
	        return promotion;
	    } catch (HibernateException ex) {
	        System.out.println("Lỗi: " + ex.getMessage());
	        return null;
	    } finally {
	        session.close();
	    }
	}

	public Integer updatePromotion(Promotion km) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(km);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public Integer insertPromotion(Promotion km) {

		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(km);
			t.commit();
		} catch (Exception e) {
			t.rollback();
			return 0;
		} finally {
			session.close();
		}
		return 1;
	}

	public String creatMaKM() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Promotion";
		Query query = session.createQuery(hql);
		List<Promotion> list = query.list();
		int max = 0;
		for (Promotion km : list) {
			String a = km.getId().replace("km", "");
			int b = Integer.parseInt(a.strip());
			if (b > max) {
				max = b;
			} else {
				max = max;
			}

		}

		String makm = "km" + String.valueOf(max + 1);
		return makm;

	}

	@Override
	public Integer insertDetailsPromotion(DetailsPromotion pr) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.save(pr);
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
	public Integer updateDetailsPromotion(DetailsPromotion pr) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		try {
			session.update(pr);
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
	public DetailsPromotion getDetailsPromotion(String masp, String makm) {
		Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM DetailsPromotion d WHERE d.product.id = :masp AND d.promotion.id =:makm";
	        Query query = session.createQuery(hql);
			query.setParameter("masp", masp);
			query.setParameter("makm", makm);
			DetailsPromotion detailsPromotion = (DetailsPromotion) query.uniqueResult();
			  return detailsPromotion;
	    } catch (HibernateException ex) {
	        System.out.println("Lỗi: " + ex.getMessage());
	        return null;
	    } finally {
	        session.close();
	    }
	}
	
	@Override
	public List<Object[]> listDetailsPromotion() {
		Session session = sessionFactory.openSession();
		String hql = "SELECT d, p FROM DetailsPromotion d JOIN d.product p";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		
		return list;
	}
}
