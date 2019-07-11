package com.subcircle.web.ka.impl;

public class Ka01MainForumServlet extends Ka01Controller {

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "ka/forum.jsp";
	}

}
