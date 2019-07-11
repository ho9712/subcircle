package com.subcircle.web.kd.impl;

public class Kd01FindAdminServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.findAdmin();
		return "kd/rootadminpage_modify";
	}

}
