package com.bbs.action;

import java.util.Date;

import com.bbs.model.posts;
import com.bbs.model.reply;
import com.bbs.service.PostDao;
import com.bbs.service.ReplyDao;
import com.bbs.serviceImpl.PostDaoImpl;
import com.bbs.serviceImpl.ReplyDaoImpl;

public class ReplyAction extends BaseAction {
	private int subjectId;
	private int userId;
	private int postId;
	private String content;

	public int getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String addReply(){
		if(postId>0){			
			reply newReply = new reply();
			newReply.setBuildDate(new Date());
			newReply .setContent(content);
			newReply.setStatus(1);
			newReply.setPostId(postId);
			newReply.setTopicId(subjectId);
			newReply.setUserId(userId);
			ReplyDao rDao = new ReplyDaoImpl();
			rDao.addReply(newReply);
			request.setAttribute("postId", postId);
		}
		return "add_success";
	}
}
