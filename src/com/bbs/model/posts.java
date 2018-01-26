package com.bbs.model;

import java.util.Date;

public class posts {
	private int id;
	private int subjectId;
	private String title;
	private String content;
	private Date buildDate;
	private int hasread;
	private int isgood;
	private int userId;
	private int status;
	private int istop;
	public posts(){
		
	}
	public posts(int id, int subjectId, String title, String content,
			Date buildDate, int hasread, int isgood, int userId, int status,
			int istop) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.title = title;
		this.content = content;
		this.buildDate = buildDate;
		this.hasread = hasread;
		this.isgood = isgood;
		this.userId = userId;
		this.status = status;
		this.istop = istop;
	}
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
	public Date getBuildDate() {
		return buildDate;
	}
	public void setBuildDate(Date buildDate) {
		this.buildDate = buildDate;
	}
	public int getHasread() {
		return hasread;
	}
	public void setHasread(int hasread) {
		this.hasread = hasread;
	}
	public int getIsgood() {
		return isgood;
	}
	public void setIsgood(int isgood) {
		this.isgood = isgood;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIstop() {
		return istop;
	}
	public void setIstop(int istop) {
		this.istop = istop;
	}
	
}
