package com.bbs.service;

import java.util.List;

import com.bbs.model.Subject;

public interface SubjectDao {
	public void addSubject(Subject subject);
	public List<Subject> getAllSubject();
	public Subject getSubjectById(int id);
	public void updateSubject(Subject s);
	public List<Subject> getAllSubjectByStatus(int status);
}
