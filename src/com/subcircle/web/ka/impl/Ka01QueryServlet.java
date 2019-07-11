package com.subcircle.web.ka.impl;

public class Ka01QueryServlet extends Ka04Controller {

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "ka/userCollection.jsp";
	}

}