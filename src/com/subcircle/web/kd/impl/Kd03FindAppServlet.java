package com.subcircle.web.kd.impl;

public class Kd03FindAppServlet extends Kd03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.findApp();
		return "kd/userpage_per";
	}

}
