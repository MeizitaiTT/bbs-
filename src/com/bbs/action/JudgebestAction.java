package com.bbs.action;

import com.bbs.model.posts;
import com.bbs.service.PostDao;
import com.bbs.serviceImpl.PostDaoImpl;

public class JudgebestAction extends BaseAction {
	private int isgood;
	private int id;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIsgood() {
		return isgood;
	}

	public void setIsgood(int isgood) {
		this.isgood = isgood;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(isgood==-1&&id>0){
			PostDao pDao = new PostDaoImpl();
			posts current = pDao.getPostById(id);
			current.setIsgood(isgood);
			
			pDao.updatePostBypost(current);
		}else if (isgood==1&&id>0) {
			PostDao pDao = new PostDaoImpl();
			posts current = pDao.getPostById(id);
			current.setIsgood(isgood);
			current.setStatus(1);
			pDao.updatePostBypost(current);
		}
		return SUCCESS;
	}
}
