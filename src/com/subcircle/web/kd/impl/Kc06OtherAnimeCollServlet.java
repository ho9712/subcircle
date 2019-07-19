package com.subcircle.web.kd.impl;

public class Kc06OtherAnimeCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryAnimeColl();
		this.otherInfo();
		return "kd/otheruser_animeColl";
	}

}
