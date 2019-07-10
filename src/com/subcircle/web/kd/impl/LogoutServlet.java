package com.subcircle.web.kd.impl;

public class LogoutServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.userLogout();;
		return "kd/login";
	}

}
