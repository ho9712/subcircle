package com.subcircle.web.kd.impl;

public class Kd02SendMsgServlet extends Kd02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.sendMsg();
		return "kd/message_send";
	}

}
