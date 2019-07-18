package com.subcircle.web.kd.impl;

public class Ka04DelPostCollServlet extends Ka04Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delPostColl();
		this.queryPostColl();
		return "kd/userpage_postColl";
	}

}
