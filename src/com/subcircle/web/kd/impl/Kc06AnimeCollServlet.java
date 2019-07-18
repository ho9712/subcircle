package com.subcircle.web.kd.impl;

public class Kc06AnimeCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryAnimeColl();
		return "kd/userpage_animeColl";
	}

}
