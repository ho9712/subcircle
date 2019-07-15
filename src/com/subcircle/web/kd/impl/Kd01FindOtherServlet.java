package com.subcircle.web.kd.impl;

public class Kd01FindOtherServlet extends Kd01Controller 
{

	@Override
	public String execute() throws Exception 
	{
		this.findOther();
		return "kd/otheruser_main";
	}

}
