package com.subcircle.web.kd.impl;

public class Kc06DelGameCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delColl();
		this.queryGameColl();
		return "kd/userpage_gameColl";
	}

}
