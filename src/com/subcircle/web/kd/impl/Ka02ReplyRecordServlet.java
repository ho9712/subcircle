package com.subcircle.web.kd.impl;

public class Ka02ReplyRecordServlet extends Ka02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryReplyRecord();	
		return "kd/userpage_replyRecord";
	}

}
