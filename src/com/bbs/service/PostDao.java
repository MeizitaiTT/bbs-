package com.bbs.service;

import java.util.List;

import com.bbs.model.posts;

public interface PostDao {
	public void pushlish(posts post);
	public int getPostNumBySubject(int subjectId);
	
	public List<posts> getPostByType(int type,int pageIndex,int pageSize);
	public List<posts> getPostByUserId(int userId,int pageIndex,int pageSize);
	
	public int getReplyNumById(int userId);
	
	public posts getPostById(int postId);
	
	public void updatePost(int postId, String title, String content,
			int subjectId);
	public void updatePostBypost(posts post);
	
	public List<posts> getPostByStatus(int status,int pageIndex,int pageSize);
	
	public List getNewTwoPost();
	public List getGoodTwoPost();
	
	public List<posts> getPostByIstop(int istop,int subjectId);
	public List<posts> getPostByTypeIstop(int type,int pageIndex,int pageSize);
	public List<posts> getPostsByHasRead(int pageIndex, int pageSize);
	public List<posts> getPostsByBuildDate(int pageIndex, int pageSize);
	public List<posts> getPostsByIsgood(int pageIndex, int pageSize);
	
	public List<posts> getPostsBySearchkey(String searchkey);
}
