package com.subcircle.web.kd.impl;

public class Ka02DelReplyServlet extends Ka02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delReply();
		this.queryReplyRecord();
		return "kd/userpage_replyRecord";
	}

}
