package com.bbs.service;

import java.util.List;

import com.bbs.model.reply;

public interface ReplyDao {
	public void addReply(reply reply);
	public List getReplyByPostid(int postId,int pageIndex,int pageSize);
}
