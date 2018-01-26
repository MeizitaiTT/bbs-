package com.bbs.action;

import com.bbs.model.User;
import com.bbs.service.UserDao;
import com.bbs.serviceImpl.UserDaoImpl;

public class AdminAction extends BaseAction {
	private int Id;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String deleteUser() {
		if (Id > 0) {
			UserDao uDao = new UserDaoImpl();
			User u = uDao.getUserById(Id);
			u.setStatus(0);
			uDao.update(u);
		}
		return SUCCESS;
	}
}
