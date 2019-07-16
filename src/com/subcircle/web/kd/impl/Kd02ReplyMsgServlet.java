package com.subcircle.web.kd.impl;

public class Kd02ReplyMsgServlet extends Kd02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.replyMsg();
		return "kd/message_detail";
	}

}
