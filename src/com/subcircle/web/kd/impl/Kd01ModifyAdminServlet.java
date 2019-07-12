package com.subcircle.web.kd.impl;

public class Kd01ModifyAdminServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.modifyAdmin();
		return "kd/rootadminpage_query";
	}

}
