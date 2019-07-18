package com.subcircle.web.kd.impl;

public class Ka04PostCollServlet extends Ka04Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryPostColl();
		return "kd/userpage_postColl";
	}

}
