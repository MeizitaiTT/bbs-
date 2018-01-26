package com.bbs.serviceImpl;

import com.bbs.model.Subject;
import com.bbs.model.posts;
import com.bbs.service.SubjectDao;

import java.util.List;
import com.bbs.Hibernate.factory.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
public class SubjectDapImpl implements SubjectDao {

	@Override
	public void addSubject(Subject subject) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		session.save(subject);		
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
	}

	@Override
	public List<Subject> getAllSubject() {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from Subject where status!=0";	
		Query query = session.createQuery(sql);
		List<Subject> list = query.list();			
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public Subject getSubjectById(int id) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from Subject where Id=:id";	
		Query query = session.createQuery(sql);
		query.setParameter("id", id);
		List<Subject> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		if(list!=null){
			return list.get(0);
		}else {
			return null;
		}
	}

	@Override
	public void updateSubject(Subject s) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		session.update(s);						
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
	}

	@Override
	public List<Subject> getAllSubjectByStatus(int status) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from Subject where status=:status";	
		Query query = session.createQuery(sql);
		query.setParameter("status", status);
		List<Subject> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

}
