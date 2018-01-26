package com.bbs.service;

import java.util.List;

import com.bbs.model.User;
import com.bbs.model.posts;

public interface UserDao {
	public List<User> login(User user);
	public boolean regist(User user);
	public User getUserByUsername(String username);
	public boolean isExist(User user);
	public User getUserById(int id);
	public void update(User user);
	public List<User> getUserByPopedom(int popedom,int pageIndex,int pageSize);
}
