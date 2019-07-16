package com.subcircle.web.kd.impl;

public class Kd02FindMsgDetailServlet extends Kd02Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.findMsgDetail();
		return "kd/message_detail";
	}

}
