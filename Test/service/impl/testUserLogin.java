package service.impl;

import java.util.Date;

import org.junit.Assert;
import org.junit.Test;

import com.bbs.model.Subject;
import com.bbs.model.User;

import com.bbs.service.SubjectDao;
import com.bbs.service.UserDao;

import com.bbs.serviceImpl.SubjectDapImpl;
import com.bbs.serviceImpl.UserDaoImpl;

public class testUserLogin {
	@Test
	public void testUserLogin(){
		User user= new User(1, "½­¾ü", "ccc", 1, 2, 1, new Date(), "132", 1, "a");
		UserDao uDao = new UserDaoImpl();
//		Assert.assertEquals(1, uDao.login(user).get(0).getPopedom());
	
//		Assert.assertEquals(true, uDao.regist(user));
	Subject aSubject =new Subject();
	SubjectDao aDao = new SubjectDapImpl();
	 aDao.addSubject(aSubject);
	}
}
