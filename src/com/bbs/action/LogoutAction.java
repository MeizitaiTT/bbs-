package com.bbs.action;

public class LogoutAction extends BaseAction {
	@Override
	public String execute() throws Exception {		
		if (session.getAttribute("username")!=null){
			session.setAttribute("popedom",null);
			session.setAttribute("uid",null);
			session.setAttribute("username",null);
		}		
		return SUCCESS;
	}
}
