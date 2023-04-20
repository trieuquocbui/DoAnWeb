package management.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import management.dao.IStaffDao;
import management.entity.Account;
import management.entity.Staff;

@Repository
@Transactional
public class StaffDaoImpl implements IStaffDao  {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<Staff> getListStaff() {
		Session session=sessionFactory.openSession();
		String hgl="from Staff";
		Query query=session.createQuery(hgl);
		List<Staff> list=query.list();
		return list;
	
		
	}
	
	

	@Override
	public void addStaff(Staff staff, Account account) {
		Session session = sessionFactory.openSession();
	    Transaction tx = null;
	    
	    try {
	        tx = session.beginTransaction();
	        session.save(account); 
	        session.save(staff); 
	        tx.commit(); 
	        System.out.println("giai đoạn 2");
	       
	    } catch (Exception e) {
	       
	            tx.rollback(); 
	        
	        
	        e.printStackTrace();
	    } finally {
	        
	            session.close(); 
	       
	    }
		
	}

}
