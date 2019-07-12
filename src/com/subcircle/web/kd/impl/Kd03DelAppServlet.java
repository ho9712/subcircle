package com.subcircle.web.kd.impl;

public class Kd03DelAppServlet extends Kd03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.delApp();
		return "kd/workadminpage_queryApp";
	}

}
