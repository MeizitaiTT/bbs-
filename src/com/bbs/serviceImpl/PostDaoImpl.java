package com.bbs.serviceImpl;

import java.util.List;

import com.bbs.model.posts;
import com.bbs.service.PostDao;
import com.bbs.Hibernate.factory.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
public class PostDaoImpl implements PostDao {

	@Override
	public void pushlish(posts post) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		try {
			Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
			tx = session.beginTransaction();
			session.save(post);
			tx.commit();						
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();			
		}
		finally{
			if(tx!=null)
			{				
				tx = null;
			}
		}
	}

	@Override
	public List<posts> getPostByType(int type, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.subjectId = :type";
		Query query = session.createQuery(sql);
		query.setParameter("type", type);
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

	@Override
	public List<posts> getPostByUserId(int userId, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.userId = :id";
		Query query = session.createQuery(sql);
		query.setParameter("id", userId);
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

	@Override
	public int getReplyNumById(int postId) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from reply where postId=:postId";	
		Query query = session.createQuery(sql);
		query.setParameter("postId", postId);
		List list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list.size();
	}

	@Override
	public posts getPostById(int postId) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts where Id=:postId";	
		Query query = session.createQuery(sql);
		query.setParameter("postId", postId);
		List<posts> list = query.list();
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
	public void updatePost(int postId, String title, String content,
			int subjectId) {
		// TODO Auto-generated method stub
		PostDao pDao = new PostDaoImpl();
		posts p = pDao.getPostById(postId);
		p.setTitle(title);
		p.setContent(content);
		p.setSubjectId(subjectId);
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		session.update(p);
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
	}

	@Override
	public void updatePostBypost(posts post) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		session.update(post);
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
	}

	@Override
	public List<posts> getPostByStatus(int status, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.status = :status";
		Query query = session.createQuery(sql);
		query.setParameter("status", status);
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

	@Override
	public int getPostNumBySubject(int subjectId) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts where subjectId=:subjectId";	
		Query query = session.createQuery(sql);
		query.setParameter("subjectId", subjectId);
		List list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list.size();
	}

	@Override
	public List getNewTwoPost() {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts as p , Subject as s where p.subjectId=s.id AND p.status!=0 order by p.buildDate DESC";	
		Query query = session.createQuery(sql);
		query.setFirstResult(0);
		query.setMaxResults(2);
		List list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public List getGoodTwoPost() {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts as p , Subject as s where p.subjectId=s.id AND p.isgood=1 AND p.status!=0 order by p.buildDate DESC";	
		Query query = session.createQuery(sql);
		query.setFirstResult(0);
		query.setMaxResults(2);
		List list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public List<posts> getPostByIstop(int istop,int subjectId) {
		// TODO Auto-generated method stub
		Transaction tx = null;	
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "";
		if(subjectId!=0){
			 sql = "from posts where istop=:istop AND status!=0 AND subjectId=:subjectId";	
		}else{
			 sql = "from posts where istop=:istop AND status!=0";
		}
		Query query = session.createQuery(sql);
		query.setParameter("istop", istop);
		if(subjectId!=0){
			query.setParameter("subjectId", subjectId);
		}
		List<posts> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public List<posts> getPostByTypeIstop(int type, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.subjectId = :type AND istop!=1 AND status!=0";
		Query query = session.createQuery(sql);
		query.setParameter("type", type);
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

	@Override
	public List<posts> getPostsByHasRead(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.status!=0 order by p.hasread DESC";
		Query query = session.createQuery(sql);		
		int startIndex = (pageIndex -1) * pageSize;
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List<posts> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public List<posts> getPostsByBuildDate(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.status!=0 order by p.buildDate DESC";
		Query query = session.createQuery(sql);		
		int startIndex = (pageIndex -1) * pageSize;
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List<posts> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public List<posts> getPostsByIsgood(int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from posts p where p.status!=0 AND p.isgood=1 order by p.buildDate DESC";
		Query query = session.createQuery(sql);		
		int startIndex = (pageIndex -1) * pageSize;
		query.setFirstResult(startIndex);
		query.setMaxResults(pageSize);
		List<posts> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

	@Override
	public List<posts> getPostsBySearchkey(String searchkey) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from Post post where post.title like :searchkey";
		Query query = session.createQuery(sql);
		query.setParameter("searchkey", '%'+searchkey+'%');
		List<posts> list = query.list();
		tx.commit();
		if(tx!=null)
		{				
			tx = null;
		}
		return list;
	}

}
