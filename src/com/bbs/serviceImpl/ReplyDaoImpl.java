package com.bbs.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bbs.Hibernate.factory.HibernateSessionFactory;
import com.bbs.model.reply;
import com.bbs.service.ReplyDao;

public class ReplyDaoImpl implements ReplyDao {

	@Override
	public void addReply(reply reply) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		try {
			Session session = HibernateSessionFactory.getSessionFactory()
					.getCurrentSession();
			tx = session.beginTransaction();
			session.save(reply);
			tx.commit();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (tx != null) {
				tx = null;
			}
		}
	}

	@Override
	public List getReplyByPostid(int postId, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		Transaction tx = null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		tx = session.beginTransaction();
		String sql = "from reply as r,User as u  where r.postId = :postId AND  r.status!=0 AND u.status!=0 AND u.Id= r.userId";
		Query query = session.createQuery(sql);
		query.setParameter("postId", postId);
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
