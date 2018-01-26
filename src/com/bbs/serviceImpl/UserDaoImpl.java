package com.bbs.serviceImpl;

import java.util.List;
import com.bbs.Hibernate.factory.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bbs.model.User;
import com.bbs.model.posts;
import com.bbs.service.UserDao;

public class UserDaoImpl implements UserDao{

	@Override
	public boolean regist(User user) {
		// TODO Auto-generated method stub
		Transaction tx = null;				
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			session.save(user);
			tx.commit();
			return true;			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		finally{
			if(tx!=null)
			{				
				tx = null;
			}
		}
		
	}
	@Override
	public List<User> login(User user) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		String hqlString = "";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			hqlString = "from User where Name=:username and PassWord=:password";
			Query query = session.createQuery(hqlString);
			query.setParameter("username", user.getUsername());
			query.setParameter("password", user.getPassword());
			List<User> list = query.list();
			tx.commit();
			if(list.size()!=0){
				
				if(list.size()>1){				
					return null;
				}
				else {
					return list;
				}
			}else {
				return null;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		finally{
			if(tx!=null)
			{				
				tx = null;
			}
		}
		
		
	}





	@Override
	public User getUserByUsername(String username) {
		Transaction tx = null;
		String hqlString = "";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			hqlString = "from User where Name=:username";
			Query query = session.createQuery(hqlString);
			query.setParameter("username", username);			
			List<User> list = query.list();
			tx.commit();
			if(list.size()!=0){
				return list.get(0);
			}else{
				return null;
			}		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		finally{
			if(tx!=null)
			{				
				tx = null;
			}
		}
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isExist(User user) {
		// TODO Auto-generated method stub
		if(getUserByUsername(user.getUsername())!=null){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public User getUserById(int id) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		String hqlString = "";
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			hqlString = "from User where Id=:Id";
			Query query = session.createQuery(hqlString);
			query.setParameter("Id", id);			
			List<User> list = query.list();
			tx.commit();
			return list.get(0);		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		finally{
			if(tx!=null)
			{				
				tx = null;
			}
		}
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		session.update(user);
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		
	}

	@Override
	public List<User> getUserByPopedom(int popedom, int pageIndex, int pageSize) {
			// TODO Auto-generated method stub
			Transaction tx = null;
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			String sql = "from User u where u.popedom = :popedom";
			Query query = session.createQuery(sql);
			query.setParameter("popedom", popedom);
			int startIndex = (pageIndex -1) * pageSize;
			query.setFirstResult(startIndex);
			query.setMaxResults(pageSize);
			List list = query.list();
			tx.commit();
			if(tx!=null)
			{				
				tx = null;
			}
			return list;
	
	}	

}
