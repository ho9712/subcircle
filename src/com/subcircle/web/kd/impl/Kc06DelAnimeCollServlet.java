package com.subcircle.web.kd.impl;

public class Kc06DelAnimeCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delColl();
		this.queryAnimeColl();
		return "kd/userpage_animeColl";
	}

}
