package service.impl;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;

import com.bbs.model.User;
import com.bbs.service.PostDao;
import com.bbs.service.SubjectDao;
import com.bbs.service.UserDao;
import com.bbs.serviceImpl.PostDaoImpl;
import com.bbs.serviceImpl.SubjectDapImpl;
import com.bbs.serviceImpl.UserDaoImpl;
public class getReplyNum {
	@Test
	public void testUserLogin(){
		
		PostDao pDao = new PostDaoImpl();
//		Assert.assertEquals(1, uDao.login(user).get(0).getPopedom());
//		Assert.assertEquals(true, uDao.isExist(user));
/*		pDao.updatePost(7, "123", "123", 123);*/
//		SubjectDao sDao = new SubjectDapImpl();
//		sDao.getAllSubject();
		List p = pDao.getGoodTwoPost();
		
		Object[] pObject =(Object[]) p.get(0);
		System.out.print(pObject.length);
		System.out.print(pObject[0].getClass());
	}
}
