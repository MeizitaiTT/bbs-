package com.bbs.model;

import java.util.Date;

public class reply {
	private int id;
	private int postId;
	private int topicId;
	private Date buildDate;
	private int userId;
	private String content;
	private int status;
	public reply(){
		
	}
	public reply(int id, int postId, int topicId, Date buildDate, int userId,
			String content, int status) {
		super();
		this.id = id;
		this.postId = postId;
		this.topicId = topicId;
		this.buildDate = buildDate;
		this.userId = userId;
		this.content = content;
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getTopicId() {
		return topicId;
	}
	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}
	public Date getBuildDate() {
		return buildDate;
	}
	public void setBuildDate(Date buildDate) {
		this.buildDate = buildDate;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
}
