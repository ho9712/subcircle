package com.subcircle.web.kd.impl;

public class Kd02QueryReceiveServlet extends Kd02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryReceive();
		return "kd/message_receive";
	}

}
