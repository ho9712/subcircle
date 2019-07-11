package com.subcircle.web.kd.impl;

public class Kd01DelAdminServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception
	{
		this.delAdmin();
		return "kd/rootadminpage_query";
	}

}
