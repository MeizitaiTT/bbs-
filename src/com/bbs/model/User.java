package com.bbs.model;

import java.util.Date;

//”√ªß¿‡
public class User {
		private int id;
		private String username;
		private String password;
		private int sex;
		private int age;
		private int popedom;
		private Date birthDay;
		private String content;
		private int status;
		private String imagepath;
		public User(){
			
		}
		public User(int id, String username, String password, int sex, int age,
				int popedom, Date birthDay, String content, int status,
				String imagepath) {
			super();
			this.id = id;
			this.username = username;
			this.password = password;
			this.sex = sex;
			this.age = age;
			this.popedom = popedom;
			this.birthDay = birthDay;
			this.content = content;
			this.status = status;
			this.imagepath = imagepath;
		}



		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getImagepath() {
			return imagepath;
		}
		public void setImagepath(String imagepath) {
			this.imagepath = imagepath;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public int getSex() {
			return sex;
		}
		public void setSex(int sex) {
			this.sex = sex;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public int getPopedom() {
			return popedom;
		}
		public void setPopedom(int popedom) {
			this.popedom = popedom;
		}
		public Date getbirthDay() {
			return birthDay;
		}
		public void setbirthDay(Date birthDay) {
			this.birthDay = birthDay;
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
