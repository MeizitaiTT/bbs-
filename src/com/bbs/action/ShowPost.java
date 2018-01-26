package com.bbs.action;

import java.util.List;

import com.bbs.model.posts;
import com.bbs.service.PostDao;
import com.bbs.serviceImpl.PostDaoImpl;

public class ShowPost extends BaseAction {
	private int Id;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}
	
}
