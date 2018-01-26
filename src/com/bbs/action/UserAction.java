package com.bbs.action;

import java.io.File;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;

import org.apache.struts2.ServletActionContext;



import com.bbs.model.User;
import com.bbs.service.UserDao;
import com.bbs.serviceImpl.UserDaoImpl;


import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends BaseAction implements ModelDriven<User> {
	
	private User user = new User();
	 //上传文件全路径、类型、文件名
	private File photoImg;
	private String photoImgFileName;
	private String photoImgContentType;
	



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



	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	
	
	public String login(){
		UserDao udao = new UserDaoImpl();
		List<User> u = udao.login(user);
		if(u!=null){
			User a = u.get(0);
			session.setAttribute("username", a.getUsername());
			session.setAttribute("popedom", a.getPopedom());	
			session.setAttribute("uid", a.getId());
			return "login_success";
		}else{
			return "login_failure";
		}
	}
	public String regist(){
		UserDao udao = new UserDaoImpl();
		if(udao.isExist(user)){
			return "regist_failture";
		}else{
			user.setImagepath("/photoImg/133845.57482217.jpg");
			user.setPopedom(1);
			user.setStatus(1);
			user.setbirthDay(new Date());
			boolean judge = udao.regist(user);
			if(judge){
				session.setAttribute("username", user.getUsername());
				session.setAttribute("popedom", user.getPopedom());	
				session.setAttribute("uid", user.getId());
				return "regist_success";
			}else{
				 return "regist_failture";
			}
		}
	}
	public String userChange() throws IOException{
		
		if(user.getUsername()!=null||(Integer)(user.getAge())!=0||user.getImagepath()!=null||user.getPassword()!=null){
			int id = (Integer)session.getAttribute("uid");
			user.setId(id);
			UserDao uDao = new UserDaoImpl();
			User current = uDao.getUserById(id);
			if(user.getUsername()!=null&&user.getUsername().length()>0){			
				if(uDao.getUserByUsername(user.getUsername())!=null){
					addFieldError("username", "该用户名已存在");
					
						return "change_success";
					
				}				
			}else{
				user.setUsername(current.getUsername());
			}
			
			if(user.getPassword()==null||user.getPassword()==""){
				user.setPassword(current.getPassword());
			}
			if(photoImg!=null){
				System.out.print(1);
				String path = ServletActionContext.getServletContext().getRealPath("/upload");
				System.out.println(path);
				System.out.println(photoImgFileName);
				File file = new File(path);
				if(!file.exists()){
					file.mkdir();
				}
				FileUtils.copyFile(photoImg, new File(file,photoImgFileName));
				user.setImagepath("/upload/"+photoImgFileName);
				
			}else if(photoImg==null){
				user.setImagepath(current.getImagepath());
			}
			
			if((Integer)(user.getAge())==0){
				user.setAge(current.getAge());
			}
			user.setSex(current.getSex());
			user.setStatus(current.getStatus());
			user.setPopedom(current.getPopedom());
			user.setbirthDay(current.getbirthDay());
			user.setContent(current.getContent());
			
			uDao.update(user);
			
			
		}
		addFieldError("update_result", "修改成功");
		return "change_success";
	}
	public String changeUserInfo() throws IOException{
		
		if((user.getUsername()!=null)||((Integer)(user.getAge())!=0)||(user.getImagepath()!=null)||(user.getPassword()!=null)){
			int id = Integer.parseInt(request.getParameter("uid"));
			user.setId(id);
			UserDao uDao = new UserDaoImpl();
			User current = uDao.getUserById(id);
			if(user.getUsername()!=null&&user.getUsername().length()>0){			
				if(uDao.getUserByUsername(user.getUsername())!=null){
					addFieldError("username", "该用户名已存在");					
					return "change_success";					
				}				
			}else{
				user.setUsername(current.getUsername());
			}
			
			
			if(photoImg!=null){
				
				String path = ServletActionContext.getServletContext().getRealPath("/upload");
				System.out.println(path);
				System.out.println(photoImgFileName);
				File file = new File(path);
				if(!file.exists()){
					file.mkdir();
				}
				FileUtils.copyFile(photoImg, new File(file,photoImgFileName));
				user.setImagepath("/upload/"+photoImgFileName);
				
			}else if(photoImg==null){
				user.setImagepath(current.getImagepath());
			}
			
			if((Integer)(user.getAge())==0){
				user.setAge(current.getAge());
			}
			if(user.getPassword()==null||user.getPassword()==""){
				user.setPassword(current.getPassword());
			}
			
			user.setSex(current.getSex());
			user.setStatus(current.getStatus());
			user.setPopedom(current.getPopedom());
			user.setbirthDay(current.getbirthDay());
			user.setContent(current.getContent());
			
			uDao.update(user);
						
		}
		addFieldError("update_result", "修改成功");
		return "change_success";
	}
	
}
