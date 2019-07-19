package com.subcircle.web.kd.impl;

public class Ka02OtherReplyRecordServlet extends Ka02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryReplyRecord();
		this.otherInfo();
		return "kd/otheruser_replyRecord";
	}

}
