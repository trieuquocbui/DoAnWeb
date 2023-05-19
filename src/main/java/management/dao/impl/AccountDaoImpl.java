package management.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import management.dao.IAccountDao;
import management.dao.ICustomerDao;
import management.dao.IRoleDao;
import management.entity.Account;
import management.entity.Bill;
import management.entity.Role;
import management.entity.Staff;

@Repository  
@Transactional
public class AccountDaoImpl implements IAccountDao{
	
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private ICustomerDao customerDao;
	
	@Autowired
	private IRoleDao roleDao;

	@Override
	public Account createAccountOfCustomer(Account account) {
		
		Session s = sessionFactory.openSession();
		
		try {
			
			s.beginTransaction();
			
			Role role = new Role();
			role.setName("USER");
			role.setId("USER");
			
			Long indentity = customerDao.getNumberOfCustomer();
			
			String idCusomer = "MAKH" + (indentity + 1);
			
			account.getCustomer().setId(idCusomer);
			
			account.getCustomer().setAccount(account);
			
			account.setRole(role);
			
			if (!roleDao.existsByName(account.getRole().getName())) {
				
				roleDao.createRole(account.getRole());
				
			}
			
			String saveAccount =  (String) s.save(account);
			
			String saveCustomer =  (String) s.save(account.getCustomer());
			
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
	public Account checkEmail(String email) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Account where email=:email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		List<Account> n =  query.list();
		session.close();
		System.out.println("tai khoan: "+n.size());
		if(n.size()!=0) return  n.get(0);	
		else return null;
			
	}

	@Override
	public void addAccount(Account account) {
		 Session session = sessionFactory.openSession();
		    Transaction tx = null;
		    try {
		        tx = session.beginTransaction();
		        session.save(account); // Lưu đối tượng Employee vào cơ sở dữ liệu
		        tx.commit(); // Xác nhận giao dịch
		       
		        session.close(); // Đóng session
		        System.out.println("them tk thanh cong");
		    } catch (Exception e) {
		    	System.out.println("that bai tk");
		        if (tx != null) {
		            tx.rollback(); // Rollback nếu xảy ra lỗi
		        }
		        e.printStackTrace();
		    } finally {
		        if (session != null) {
		            session.close(); // Đóng session
		        }
		    }
		
	}

	@Override
	public int deleteAccount(String accountId) {
		 Session session = sessionFactory.openSession();
		    Transaction tx = null;
		    try {
		        tx = session.beginTransaction();
		        String hql = "DELETE FROM Account WHERE accountId = :accountId";
		        Query query = session.createQuery(hql);
		        query.setParameter("accountId", accountId);
		        int result = query.executeUpdate();
		        tx.commit();
		        session.close();
		    } catch (Exception e) {
		        if (tx != null) {
		            tx.rollback();
		        }
		        e.printStackTrace();
		    } finally {
		        if (session != null) {
		            session.close();
		        }
		    }
		return 0;
	}
}
	
