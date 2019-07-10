package com.subcircle.web.kd.impl;

public class LoginServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		return this.userLogin();
	}

}
