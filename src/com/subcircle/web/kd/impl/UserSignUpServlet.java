package com.subcircle.web.kd.impl;

public class UserSignUpServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		return this.userSignUp();
	}

}
