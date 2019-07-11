package com.subcircle.web.kd.impl;

public class Kd01QueryAdminServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryAdmin();
		return "kd/rootadminpage_query";
	}

}
