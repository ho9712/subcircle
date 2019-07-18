package com.subcircle.web.kd.impl;

public class Ka01DelPostServlet extends Ka01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delPost();
		this.queryPostRecord();
		return "kd/userpage_postRecord";
	}

}
