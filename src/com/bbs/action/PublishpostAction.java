package com.bbs.action;

import java.util.Date;

import com.bbs.model.posts;
import com.bbs.service.PostDao;
import com.bbs.service.UserDao;
import com.bbs.serviceImpl.PostDaoImpl;
import com.bbs.serviceImpl.UserDaoImpl;

public class PublishpostAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private int subjectId;
	private String title;
	private String content;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		int id = (Integer)session.getAttribute("uid");
		UserDao uDao = new UserDaoImpl();
		if(uDao.getUserById(subjectId).getStatus()==-1){
			addFieldError("limit", "ÄãÒÑ±»½ûÖ¹·¢Ìû");
			return "publish";
		}
		posts post = new posts();
		post.setUserId(id);
		post.setBuildDate(new Date());
		post.setContent(content);
		post.setHasread(0);
		post.setIsgood(0);
		post.setIstop(0);
		post.setStatus(1);
		post.setTitle(title);
		post.setSubjectId(subjectId);
		PostDao pDao = new PostDaoImpl();
		pDao.pushlish(post);		
		return SUCCESS;
	}
	public String updatePost(){
		if(id>0){
			PostDao pDao = new PostDaoImpl();			
			pDao.updatePost(id, title, content, subjectId);
		
		}
		if(request.getParameter("user").equals("admin")){
			return "update_admin";
		}else{
			return SUCCESS;
		}
	}
}
