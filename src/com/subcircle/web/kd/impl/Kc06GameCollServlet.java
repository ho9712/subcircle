package com.subcircle.web.kd.impl;

public class Kc06GameCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryGameColl();
		return "kd/userpage_gameColl";
	}

}
