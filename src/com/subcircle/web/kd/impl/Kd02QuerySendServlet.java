package com.subcircle.web.kd.impl;

public class Kd02QuerySendServlet extends Kd02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.querySend();
		return "kd/message_to";
	}

}
