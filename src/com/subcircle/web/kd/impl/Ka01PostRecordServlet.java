package com.subcircle.web.kd.impl;

public class Ka01PostRecordServlet extends Ka01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryPostRecord();
		return "kd/userpage_postRecord";
	}

}
