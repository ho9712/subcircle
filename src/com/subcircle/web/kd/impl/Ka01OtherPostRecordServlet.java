package com.subcircle.web.kd.impl;

public class Ka01OtherPostRecordServlet extends Ka01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryPostRecord();
		this.otherInfo();
		return "kd/otheruser_postRecord";
	}

}
