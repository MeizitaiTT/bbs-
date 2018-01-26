package com.bbs.action;

import com.bbs.model.posts;
import com.bbs.service.PostDao;
import com.bbs.serviceImpl.PostDaoImpl;

public class PostAction extends BaseAction {
	private int postId;
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String editPost(){
		if(postId>0){
			PostDao pDao = new PostDaoImpl();
			posts post = pDao.getPostById(postId);
			request.setAttribute("post", post);
		}
		return SUCCESS;
	}
	public String applyBest(){
		if(postId>0){
			PostDao pDao = new PostDaoImpl();
			posts post = pDao.getPostById(postId);
			post.setStatus(2);
			pDao.updatePostBypost(post);
		}
		return SUCCESS;
	}
	public String adminEditPost(){
		if(postId>0){
			PostDao pDao = new PostDaoImpl();
			posts post = pDao.getPostById(postId);
			request.setAttribute("post", post);
		}
		return SUCCESS;
	}
}
