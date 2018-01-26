package com.bbs.model;

import java.util.Date;

public class Subject {
	private int id;
	private String subjectName;
	private String subjectDescription;
	private int managerId;
	private Date buildDate;
	private int status;
	private String imagepath;
	public Subject(){
		
	}
	public Subject(int id, String subjectName, String subjectDescription,
			int managerId, Date buildDate, int status, String imagepath) {
		super();
		this.id = id;
		this.subjectName = subjectName;
		this.subjectDescription = subjectDescription;
		this.managerId = managerId;
		this.buildDate = buildDate;
		this.status = status;
		this.imagepath = imagepath;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectDescription() {
		return subjectDescription;
	}
	public void setSubjectDescription(String subjectDescription) {
		this.subjectDescription = subjectDescription;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public Date getbuildDate() {
		return buildDate;
	}
	public void setbuildDate(Date buildDate) {
		this.buildDate = buildDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	
}
