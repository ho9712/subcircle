package com.subcircle.web.ka.impl;

public class Ka01PostForumServlet extends Ka01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("postForum","1");
		return "ka/ka01MainForum.kahtml";
	}
}
