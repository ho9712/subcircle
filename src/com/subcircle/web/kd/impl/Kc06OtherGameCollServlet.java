package com.subcircle.web.kd.impl;

public class Kc06OtherGameCollServlet extends Kc06Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryGameColl();
		this.otherInfo();
		return "kd/otheruser_gameColl";
	}

}
