package com.subcircle.web.ka.impl;

public class Ka01GameForumServlet extends  Ka01Controller
{
	@Override
	public String execute() throws Exception 
	{  
		this.hotPost();
		return this.queryByCondition();
	}
}
