package com.subcircle.web.kd.impl;

public class Kd01QueryUserServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception
	{
		this.queryUser();
		return "kd/workadminpage_queryUser";
	}

}
