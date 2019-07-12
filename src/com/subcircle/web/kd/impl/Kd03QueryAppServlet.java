package com.subcircle.web.kd.impl;

public class Kd03QueryAppServlet extends Kd03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.queryApp();
		return "kd/workadminpage_queryApp";
	}

}
