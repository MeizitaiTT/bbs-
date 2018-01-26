package com.bbs.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.bbs.model.Subject;
import com.bbs.model.posts;
import com.bbs.service.PostDao;
import com.bbs.service.SubjectDao;
import com.bbs.serviceImpl.PostDaoImpl;
import com.bbs.serviceImpl.SubjectDapImpl;

public class SubjectAction extends BaseAction {
	private File photoImg;
	private String photoImgFileName;
	private String photoImgContentType;
	
	private String subjectName;
	private String subjectDescription;
	public File getPhotoImg() {
		return photoImg;
	}
	public void setPhotoImg(File photoImg) {
		this.photoImg = photoImg;
	}
	public String getPhotoImgFileName() {
		return photoImgFileName;
	}
	public void setPhotoImgFileName(String photoImgFileName) {
		this.photoImgFileName = photoImgFileName;
	}
	public String getPhotoImgContentType() {
		return photoImgContentType;
	}
	public void setPhotoImgContentType(String photoImgContentType) {
		this.photoImgContentType = photoImgContentType;
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
	
	public String addSubject() throws IOException{
		Subject newSubject = new Subject();
		if(subjectName!=null){
			newSubject.setSubjectName(subjectName);
		}
		if(subjectDescription!=null){
			newSubject.setSubjectDescription(subjectDescription);
		}
		if(photoImg!=null){
			String path = ServletActionContext.getServletContext().getRealPath("/upload");
			
			File file = new File(path);
			if(!file.exists()){
				file.mkdir();
			}
			FileUtils.copyFile(photoImg, new File(file,photoImgFileName));
			newSubject.setImagepath("/upload/"+photoImgFileName);
		}
		newSubject.setbuildDate(new Date());
		newSubject.setManagerId((Integer)session.getAttribute("uid"));
		newSubject.setStatus(1);
		SubjectDao sDao = new SubjectDapImpl();
		sDao.addSubject(newSubject);
		addFieldError("update_result", "创建成功");
		return "add_success";
	}
	public String deleteSubject(){
		int Id = Integer.parseInt(request.getParameter("Id"));
		if(Id>0){
			SubjectDao sDao = new SubjectDapImpl();
			Subject s = sDao.getSubjectById(Id);
			s.setStatus(0);
			sDao.updateSubject(s);
		}
		return "delete_success";
	}
	public String recoverSubject(){
		int Id = Integer.parseInt(request.getParameter("Id"));
		if(Id>0){
			SubjectDao sDao = new SubjectDapImpl();
			Subject s = sDao.getSubjectById(Id);
			s.setStatus(1);
			sDao.updateSubject(s);
		}
		return "recover_success";
	}
	public String updateSubject() throws IOException{
		int Id = Integer.parseInt(request.getParameter("Id"));
		if(Id>0){
			SubjectDao sDao = new SubjectDapImpl();
			Subject s = sDao.getSubjectById(Id);
			if(subjectName!=null){
				s.setSubjectName(subjectName);
			}
			if(subjectDescription!=null){
				s.setSubjectDescription(subjectDescription);
			}
			if(photoImg!=null){
				String path = ServletActionContext.getServletContext().getRealPath("/upload");
				
				File file = new File(path);
				if(!file.exists()){
					file.mkdir();
				}
				FileUtils.copyFile(photoImg, new File(file,photoImgFileName));
				s.setImagepath("/upload/"+photoImgFileName);
			}
			sDao.updateSubject(s);
			addFieldError("update_result", "修改成功");
		}
		return "update_success";
	}
	public String setTop(){
		int Id = Integer.parseInt(request.getParameter("Id"));
		int istop = Integer.parseInt(request.getParameter("istop"));
		if(Id>0){
			PostDao pDao = new PostDaoImpl();
			posts p = pDao.getPostById(Id);
			p.setIstop(istop);
			pDao.updatePostBypost(p);
		}
		return "set_success";
	}
}
