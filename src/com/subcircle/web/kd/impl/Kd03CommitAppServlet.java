package com.subcircle.web.kd.impl;

public class Kd03CommitAppServlet extends Kd03Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.commitApp();
		return "kd/userpage_per";
	}

}
