package com.subcircle.web.kd.impl;

public class Kd03DealAppServlet extends Kd03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.dealApp();
		return "kd/workadminpage_queryApp";
	}

}
