package com.subcircle.web.kd.impl;

public class Kd01AddAdminServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.addAdmin();
		return "kd/rootadminpage_add";
	}

}
