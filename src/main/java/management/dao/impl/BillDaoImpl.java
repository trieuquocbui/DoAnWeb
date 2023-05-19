package management.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.dao.IBillDao;
import management.entity.Bill;
import management.entity.Customer;

@Repository
@Transactional
public class BillDaoImpl implements IBillDao {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public long getCountBill() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("select count(*) from Bill");

		Long l = (Long) query.uniqueResult();
		session.close();
		return l;

	}

	@Override
	public List<Bill> getListBill() {
		Session session = sessionFactory.openSession();

		String hgl = "From Bill";

		Query query = session.createQuery(hgl);

		List<Bill> list = query.list();
		session.close();

		return list;
	}

	@Override
	public List<Bill> getListBillTT(int status) {
		Session session = sessionFactory.openSession();

		String hgl = "FROM Bill B WHERE B.status = " + status;

		Query query = session.createQuery(hgl);

		List<Bill> list = query.list();
		session.close();

		return list;
	}

	@Override
	public Bill getBill(int id) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Bill where id=:id";
		Query query = session.createQuery(hql);
		query.setParameter("id", id + "");
		Bill n = (Bill) query.list().get(0);

		session.close();

		return n;
	}

	@Override
	public void updateStatus(int billId, int newStatus) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		try {

			Bill bill = getBill(billId);
			System.out.println("id sap updatw:" + bill.getId());

			bill.setStatus(newStatus);

			session.update(bill);

			transaction.commit();
			System.out.println("success");

		} catch (Exception e) {
			System.out.println("update fail");
			e.printStackTrace();
			transaction.rollback();
		} finally {

			session.close();
		}
	}

	@Override
	public int createBill(Bill bill) {

		Session s = sessionFactory.openSession();

		try {

			s.beginTransaction();
			
			int primaryKey = (int)s.save(bill);
			
			s.getTransaction().commit();
			
			return primaryKey;
		} catch (Exception e) {
			System.out.println(e);
			s.getTransaction().rollback();

		} finally {
			s.close();
		}
		
		return -1;
	}

	@Override
	public Bill getBillById(int id) {
		Session s = sessionFactory.openSession();

		String hql = "select b from Bill b where b.id = ?";

		Query query = s.createQuery(hql);

		query.setParameter(0, id);

		return (Bill) query.list().get(0);
	}

}
